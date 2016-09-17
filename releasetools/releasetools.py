# Copyright (C) 2016 The CyanogenMod Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

import os
import subprocess

ANDROID_BUILD_TOP = os.getenv('ANDROID_BUILD_TOP')
OUT_DIR = os.getenv('OUT')
DEVICE_VENDOR_DIR = os.path.join(ANDROID_BUILD_TOP, 'vendor', 'nvidia', 'shieldtablet')
INSTALL_BIN_PATH = os.path.join('install', 'bin')

def FullOTA_Assertions(self):
  AddFirmwareFlash(self, self.input_zip)

def IncrementalOTA_Assertions(self):
  AddFirmwareFlash(self, self.target_zip)

def AddFirmwareFlash(self, input_zip):
  """Include the required binaries in the output zip."""
  self.output_zip.write(os.path.join(DEVICE_VENDOR_DIR, 'blob'), 'blob')
  self.output_zip.write(os.path.join(OUT_DIR, 'obj', 'EXECUTABLES', 'toolbox_intermediates', 'toolbox'), os.path.join(INSTALL_BIN_PATH, 'toolbox'))
  """Core script to flash the blob."""
  self.script.AppendExtra('package_extract_file("blob", "/tmp/blob");')
  self.script.AppendExtra('package_extract_file("install/bin/toolbox", "/tmp/toolbox");')
  self.script.AppendExtra('set_metadata("/tmp/toolbox", "uid", 0, "gid", 0, "mode", 0755);')
  self.script.AppendExtra('run_program("/tmp/toolbox", "dd", "if=/tmp/blob", "of=/dev/block/platform/sdhci-tegra.3/by-name/USP");')

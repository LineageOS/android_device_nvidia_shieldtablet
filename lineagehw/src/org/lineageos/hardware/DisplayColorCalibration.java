/*
 * Copyright (C) 2018 The LineageOS Project
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

package org.lineageos.hardware;

import org.lineageos.hardware.ReadingEnhancement;
import org.lineageos.internal.util.FileUtils;

public class DisplayColorCalibration {

    private static final String TAG = "DisplayColorCalibration";

    private static final String COLOR_FILE = "/sys/devices/platform/host1x/tegradc.0/color_filter_rgb";

    private static final int MIN = 0;
    private static final int MAX = 255;

    private static void setColorsInternal(String colors) {
        FileUtils.writeLine(COLOR_FILE, colors);
    }

    private static String getColorsInternal() {
        return FileUtils.readOneLine(COLOR_FILE);
    }

    public static boolean isSupported() {
        boolean supported = true;

        if (!FileUtils.isFileReadable(COLOR_FILE) || !FileUtils.isFileWritable(COLOR_FILE))
            supported = false;

        if (supported) {
            FileUtils.writeLine(COLOR_FILE, String.format("%d %d %d", MAX, MAX, MAX));
        }

        return supported;
    }

    public static int getMaxValue()  {
        return MAX;
    }

    public static int getMinValue()  {
        return MIN;
    }

    public static int getDefValue() {
        return getMaxValue();
    }

    public static String getCurColors()  {
        if (ReadingEnhancement.isEnabled()) {
            return ReadingEnhancement.getRestoreColors();
        }

        return getColorsInternal();
    }

    public static boolean setColors(String colors) {
        if (ReadingEnhancement.isEnabled()) {
            ReadingEnhancement.setRestoreColors(colors);
        } else {
            setColorsInternal(colors);
        }

        return true;
    }

}

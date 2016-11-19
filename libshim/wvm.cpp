/*
 * Copyright (C) 2016 The CyanogenMod Project
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

#include <sys/types.h>
#include "media/stagefright/MediaBufferGroup.h"

extern "C" {
int _ZN7android16MediaBufferGroupC1Ej(unsigned int);
int _ZN7android16MediaBufferGroupC1Ev() {
    return _ZN7android16MediaBufferGroupC1Ej(0);
}
android::status_t _ZN7android16MediaBufferGroup14acquire_bufferEPPNS_11MediaBufferEbj(android::MediaBuffer**, bool, size_t);
android::status_t _ZN7android16MediaBufferGroup14acquire_bufferEPPNS_11MediaBufferEb(android::MediaBuffer **buffer, bool nonBlocking) {
    return _ZN7android16MediaBufferGroup14acquire_bufferEPPNS_11MediaBufferEbj(buffer, nonBlocking, 0);
}
bool _ZNK7android12IMediaSource11ReadOptions9getSeekToEPxPNS1_8SeekModeE(int64_t*, int32_t*);
bool _ZNK7android11MediaSource11ReadOptions9getSeekToEPxPNS1_8SeekModeE(int64_t *time_us, int32_t *mode) {
    return _ZNK7android12IMediaSource11ReadOptions9getSeekToEPxPNS1_8SeekModeE(time_us, mode);
}
bool _ZNK7android12IMediaSource11ReadOptions14getNonBlockingEv();
bool _ZNK7android11MediaSource11ReadOptions14getNonBlockingEv() {
    return _ZNK7android12IMediaSource11ReadOptions14getNonBlockingEv();
}
}

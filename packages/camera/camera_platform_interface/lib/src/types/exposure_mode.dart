// Copyright 2013 The Flutter Authors
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/foundation.dart';

/// The possible exposure modes that can be set for a camera.
enum ExposureMode {
  /// Automatically determine exposure settings.
  auto,

  /// Lock the currently determined exposure settings.
  locked,

  /// Manually control exposure settings (ISO and duration).
  /// Available on iOS 8+ and Android API 21+.
  manual,
}

/// Returns the exposure mode as a String.
String serializeExposureMode(ExposureMode exposureMode) {
  switch (exposureMode) {
    case ExposureMode.locked:
      return 'locked';
    case ExposureMode.auto:
      return 'auto';
    case ExposureMode.manual:
      return 'manual';
  }
}

/// Returns the exposure mode for a given String.
ExposureMode deserializeExposureMode(String str) {
  switch (str) {
    case 'locked':
      return ExposureMode.locked;
    case 'auto':
      return ExposureMode.auto;
    case 'manual':
      return ExposureMode.manual;
    default:
      throw ArgumentError('"$str" is not a valid ExposureMode value');
  }
}

/// Properties of a camera exposure description.
@immutable
class ExposureDescription {
  /// Creates a new exposure description with the given properties.
  const ExposureDescription({
    required this.currentExpoOffset,
    required this.currentExpoTimeNs,
    required this.currentExpoISO,
    required this.currentExpoMode,
    required this.maxExpoTimeNs,
    required this.minExpoTimeNs,
    required this.minExpoISO,
    required this.maxExpoISO,
    required this.minExpoOffset,
    required this.maxExpoOffset,
  });

  /// Exposure Mode
  final ExposureMode currentExpoMode;

  /// Exposure Offset (EV)
  /// current exposure offset value
  final double currentExpoOffset;

  /// the minimum supported exposure offset for the selected camera in EV units.
  final double minExpoOffset;

  /// the maximum supported exposure offset for the selected camera in EV units.
  final double maxExpoOffset;

  /// Exposure ISO
  /// the current ISO value of the camera.
  final double currentExpoISO;

  /// the minimum supported ISO value for the selected camera.
  final double minExpoISO;

  /// the maximum supported ISO value for the selected camera.
  final double maxExpoISO;

  /// Exposure Time(shutter)
  /// the current exposure time of the camera in nanoseconds.
  final int currentExpoTimeNs;

  /// the minimum supported exposure time for the selected camera in nanoseconds.
  final int minExpoTimeNs;

  /// the maximum supported exposure time for the selected camera in nanoseconds.
  final int maxExpoTimeNs;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ExposureDescription &&
          runtimeType == other.runtimeType &&
          currentExpoMode == other.currentExpoMode &&
          currentExpoOffset == other.currentExpoOffset &&
          minExpoOffset == other.minExpoOffset &&
          maxExpoOffset == other.maxExpoOffset &&
          currentExpoISO == other.currentExpoISO &&
          minExpoISO == other.minExpoISO &&
          maxExpoISO == other.maxExpoISO &&
          currentExpoTimeNs == other.currentExpoTimeNs &&
          minExpoTimeNs == other.minExpoTimeNs &&
          maxExpoTimeNs == other.maxExpoTimeNs;

  @override
  int get hashCode => Object.hash(
    currentExpoMode,
    currentExpoOffset,
    minExpoOffset,
    maxExpoOffset,
    currentExpoISO,
    minExpoISO,
    maxExpoISO,
    currentExpoTimeNs,
    minExpoTimeNs,
    maxExpoTimeNs,
  );

  @override
  String toString() {
    return '${objectRuntimeType(this, 'ExposureDescription')}('
        '$currentExpoMode, '
        '$currentExpoOffset, '
        '$currentExpoTimeNs, '
        '$currentExpoISO, '
        '$minExpoTimeNs, '
        '$maxExpoTimeNs, '
        '$minExpoISO, '
        '$maxExpoISO, '
        '$minExpoOffset, '
        '$maxExpoOffset)';
  }
}

/// Properties of a exposure state value from camera setting.
@immutable
class ExposureStateValue {
  /// Creates a new exposure state value with the given properties.
  const ExposureStateValue({required this.expoTimeNs, required this.expoISO});

  /// The exposure time of the camera setting.
  final int expoTimeNs;

  /// The exposure IOS time of the camera setting.
  final double expoISO;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ExposureStateValue &&
          runtimeType == other.runtimeType &&
          expoTimeNs == other.expoTimeNs &&
          expoISO == other.expoISO;

  @override
  int get hashCode => Object.hash(expoTimeNs, expoISO);

  @override
  String toString() {
    return '${objectRuntimeType(this, 'ExposureDescription')}('
        '$expoTimeNs, $expoISO)';
  }
}

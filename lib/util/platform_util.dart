import 'package:flutter/foundation.dart';

class PlatformUtil {
  static bool isOnDesktopAndWeb() {
    if (kIsWeb) {
      return true;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.macOS:
      case TargetPlatform.linux:
      case TargetPlatform.windows:
        return true;
      case TargetPlatform.android:
      case TargetPlatform.iOS:
      case TargetPlatform.fuchsia:
        return false;
      default:
        throw UnsupportedError('Unknown platform: $defaultTargetPlatform');
    }
  }
}
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'komodo_dex_server_platform_interface.dart';

/// An implementation of [KomodoDexServerPlatform] that uses method channels.
class MethodChannelKomodoDexServer extends KomodoDexServerPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('komodo_dex_server');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}

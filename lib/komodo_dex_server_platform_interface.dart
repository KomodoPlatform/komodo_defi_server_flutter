import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'komodo_dex_server_method_channel.dart';

abstract class KomodoDexServerPlatform extends PlatformInterface {
  /// Constructs a KomodoDexServerPlatform.
  KomodoDexServerPlatform() : super(token: _token);

  static final Object _token = Object();

  static KomodoDexServerPlatform _instance = MethodChannelKomodoDexServer();

  /// The default instance of [KomodoDexServerPlatform] to use.
  ///
  /// Defaults to [MethodChannelKomodoDexServer].
  static KomodoDexServerPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [KomodoDexServerPlatform] when
  /// they register themselves.
  static set instance(KomodoDexServerPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}

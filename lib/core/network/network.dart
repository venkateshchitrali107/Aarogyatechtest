import 'package:connectivity_plus/connectivity_plus.dart';

/// Abstract class for providing network connectivity information
abstract class NetworkInfo {
  /// Checks if the device currently has an internet connection
  Future<bool> isConnected();
}

/// Implementation of [NetworkInfo] using the connectivity plus package
class NetworkInfoImpl implements NetworkInfo {
  /// Instance of [Connectivity] used to check connectivity status
  final Connectivity dataConnectionChecker;

  /// Constructor that takes in a [Connectivity] instance
  NetworkInfoImpl(this.dataConnectionChecker);

  @override

  /// Checks if the device currently has an internet connection
  /// by calling [Connectivity.checkConnectivity] and returning true
  /// if the status is not [ConnectivityResult.none]
  Future<bool> isConnected() async {
    final status = await dataConnectionChecker.checkConnectivity();
    return status != ConnectivityResult.none;
  }
}

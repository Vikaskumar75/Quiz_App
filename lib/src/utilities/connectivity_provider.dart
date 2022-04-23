// ignore_for_file: always_specify_types
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final connectivityProvider = StateNotifierProvider<InternetConnectivity, bool>(
  (ref) => InternetConnectivity(),
);

class InternetConnectivity extends StateNotifier<bool> {
  InternetConnectivity() : super(true) {
    startListeningForInternetConnectivity();
  }

  final Connectivity _connectivity = Connectivity();

  Future<void> startListeningForInternetConnectivity() async {
    final ConnectivityResult _result = await _connectivity.checkConnectivity();
    manageConnectivityState(_result);
    _connectivity.onConnectivityChanged.listen(manageConnectivityState);
  }

  void manageConnectivityState(ConnectivityResult result) {
    if (result == ConnectivityResult.mobile ||
        result == ConnectivityResult.wifi) {
      state = true;
    } else {
      state = false;
    }
  }
}

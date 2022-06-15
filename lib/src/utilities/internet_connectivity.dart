import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:quiz_app/src/utilities/export.dart';

class InternetConnectivity {
  InternetConnectivity._();
  static final InternetConnectivity instance = InternetConnectivity._();
  bool isConnected = false;

  void initialize() {
    startListeningForInternetConnectivity();
  }

  final Connectivity _connectivity = Connectivity();
  ConnectivityResult? _previousConnectivity;

  Future<void> startListeningForInternetConnectivity() async {
    final ConnectivityResult _result = await _connectivity.checkConnectivity();
    if (!_isConnected(_result)) manageConnectivityState(_result);
    _connectivity.onConnectivityChanged.listen(manageConnectivityState);
  }

  void manageConnectivityState(ConnectivityResult result) {
    if (_isConnected(result)) {
      if (_previousConnectivity != null) {
        if (!_isConnected(_previousConnectivity!)) _showDialog(result);
      }
    } else {
      _showDialog(result);
    }

    _previousConnectivity = result;
  }

  void _showDialog(ConnectivityResult result) {
    if (_isConnected(result)) {
      DialogService.instance.showDialog(
        message: Strings.backOnline,
        textColor: ColorPallet.green,
      );
    } else {
      DialogService.instance.showDialog(
        message: Strings.internetError,
        textColor: ColorPallet.orange,
        autoHide: false,
      );
    }
  }

  bool _isConnected(ConnectivityResult result) {
    isConnected = result == ConnectivityResult.mobile ||
        result == ConnectivityResult.wifi;
    return isConnected;
  }
}

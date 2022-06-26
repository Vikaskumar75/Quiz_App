import 'package:connectivity_plus/connectivity_plus.dart';
import 'export.dart';

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
    _showDialog(_result);
    _connectivity.onConnectivityChanged.listen(_showDialog);
  }

  void _showDialog(ConnectivityResult result) {
    if (_isConnected(result)) {
      if (_previousConnectivity == null) return;
      if (_isConnected(_previousConnectivity!)) return;
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

    _previousConnectivity = result;
  }

  bool _isConnected(ConnectivityResult result) {
    isConnected = result == ConnectivityResult.mobile ||
        result == ConnectivityResult.wifi;
    return isConnected;
  }
}

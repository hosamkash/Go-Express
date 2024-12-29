import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get/get.dart';

class connectivityInternet extends GetxController {
  String message = '';
  RxBool isConnected = false.obs;

  bool checkIsInternetConnected() {
    // Subscribe to connectivity changes
    Connectivity().onConnectivityChanged.listen(
      (List<ConnectivityResult> connResults) {
        if (connResults.any((result) {
          return result == ConnectivityResult.wifi || result == ConnectivityResult.ethernet || result == ConnectivityResult.mobile;
        })) {
          message = 'تم الإتصال بالإنترنت';
          isConnected.value = true;
        } else {
          message = 'تم قطع الإتصال بالإنترنت';
          isConnected.value = false;
        }
      },
    );
    return isConnected.value;
  }
}

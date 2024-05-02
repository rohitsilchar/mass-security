import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get/get.dart';

class InternetController extends GetxController {
  static InternetController instance = Get.find();
  var internetStatus = "".obs;

  @override
  void onInit() {
    super.onInit();
    _checkInternetConnectivity();
    _watchForInternet();
  }

  _checkInternetConnectivity() async {
    try {
      var connectivityResult = await (Connectivity().checkConnectivity());
      if (connectivityResult.toString() == "ConnectivityResult.none") {
        internetStatus("NOINTERNET");
      } else {
        internetStatus("INTERNET");
      }
    } finally {}
  }

  _watchForInternet() async {
    Connectivity().onConnectivityChanged.listen((ConnectivityResult result) {
      if (result.toString() == "ConnectivityResult.none") {
        internetStatus("NOINTERNET");
      } else {
        internetStatus("INTERNET");
      }
    });
  }
}

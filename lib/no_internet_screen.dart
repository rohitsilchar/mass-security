import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:get/get.dart';
import 'package:massguard/internet_controller.dart';

class NoInternet extends StatefulWidget {
  const NoInternet({Key? key}) : super(key: key);

  @override
  State<NoInternet> createState() => _NoInternetState();
}

class _NoInternetState extends State<NoInternet> {
  InternetController internetController = Get.find();
  late InAppWebViewController _webViewController;

  @override
  Widget build(BuildContext context) {
    internetController.onInit();
    return Obx(() {
      if (internetController.internetStatus.toString() == "NOINTERNET") {
        return const NoInternetScreen();
      } else {
        return InAppWebView(
          initialUrlRequest:
              URLRequest(url: WebUri("https://smsams.in/public/guard/login")),
          onWebViewCreated: (InAppWebViewController controller) {
            _webViewController = controller;
          },
        );
      }
    });
  }
}

class NoInternetScreen extends StatelessWidget {
  const NoInternetScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              height: 70,
              width: 70,
              child: Icon(Icons.network_check),
            ),
            Text(
              "No Internet",
              style: Theme.of(context).textTheme.headline3,
            ),
          ],
        ),
      ),
    );
  }
}

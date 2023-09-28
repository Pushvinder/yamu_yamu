import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:yamu/constants/ColorRes.dart';
import 'package:yamu/constants/CommonUi.dart';
import 'package:yamu/constants/Constants.dart';
import 'package:yamu/constants/Fonts.dart';
import 'package:yamu/constants/Strings.dart';
import 'package:yamu/constants/app_loader.dart';
import 'package:yamu/screens/dashboard/profile/my_profile/profile_controller.dart';
import 'package:yamu/screens/dashboard/wishlist/wishlist_controller.dart';

class WebViewLinks extends StatefulWidget {
  String link;
  String title;

  WebViewLinks(this.link, this.title, {super.key});

  @override
  _WebViewLinksState createState() => _WebViewLinksState();
}

class _WebViewLinksState extends State<WebViewLinks> {
  final ProfileController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        // appBar: AppBar(
        //   backgroundColor: Colors.transparent,
        //   shadowColor: Colors.transparent,
        //   leadingWidth: 50,
        //   centerTitle: true,
        //   title: Text(
        //     widget.title,
        //     style: CommonUi.setCustomTextStyle(
        //         textSize: 20.0,
        //         textFont: Fonts.fontLailaBold,
        //         textColor: ColorRes.colorPrimary),
        //   ),
        // ),
        body: Stack(
          children: [
            WebViewWidget(
              controller: WebViewController()
                ..setJavaScriptMode(JavaScriptMode.unrestricted)
                ..setBackgroundColor(const Color(0x00000000))
                ..setNavigationDelegate(
                  NavigationDelegate(
                    onProgress: (int progress) {
                      // Update loading bar.
                    },
                    onPageStarted: (String url) {},
                    onPageFinished: (String url) {
                      controller.webLoader.value = false;
                    },
                    onWebResourceError: (WebResourceError error) {},
                    onNavigationRequest: (NavigationRequest request) {
                      if (request.url.startsWith('https://www.youtube.com/')) {
                        return NavigationDecision.prevent;
                      }
                      Get.back();
                      return NavigationDecision.navigate;
                    },
                  ),
                )
                ..loadRequest(
                  Uri.parse(widget.link),
                ),
            ),
            Obx(() =>
                controller.webLoader.value ? const AppLoader() : const SizedBox())
          ],
        ),
      ),
    );
  }
}

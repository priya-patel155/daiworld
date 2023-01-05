import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'dart:io';

class ImageWebView extends StatefulWidget {
  final String? webimageurl;
  const ImageWebView({Key? key, this.webimageurl}) : super(key: key);

  @override
  State<ImageWebView> createState() => _ImageWebViewState();
}

class _ImageWebViewState extends State<ImageWebView> {
  @override
  void initState() {
    if (Platform.isAndroid) {
      WebView.platform = SurfaceAndroidWebView();
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print(widget.webimageurl);
    return WebView(
      initialUrl: widget.webimageurl,
      javascriptMode: JavascriptMode.unrestricted,
    );
  }
}

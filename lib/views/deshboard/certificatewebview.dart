import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class CertificateWebview extends StatefulWidget {
  final String? cerificateurl;
  const CertificateWebview({Key? key, this.cerificateurl}) : super(key: key);

  @override
  State<CertificateWebview> createState() => _CertificateWebviewState();
}

class _CertificateWebviewState extends State<CertificateWebview> {
  @override
  Widget build(BuildContext context) {
    return WebView(
      initialUrl: widget.cerificateurl,
      javascriptMode: JavascriptMode.unrestricted,
    );
  }
}

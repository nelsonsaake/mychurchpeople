import 'package:flutter/material.dart';
import 'package:hostels/widgets/busy_indicator/busy_indicator.dart';
import 'package:webview_flutter/webview_flutter.dart';

class PaystackWebView extends StatefulWidget {
  const PaystackWebView({
    super.key,
    this.getPaystackUrl,
  });

  final Future<String?>? getPaystackUrl;

  @override
  State<PaystackWebView> createState() => _PaystackWebViewState();
}

class _PaystackWebViewState extends State<PaystackWebView> {
  final controller = WebViewController();

  final futureBuilderKey = GlobalKey();

  final busyIndicatorKey = GlobalKey();

  var isBusy = false;

  @override
  void initState() {
    controller
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..setNavigationDelegate(
        NavigationDelegate(
          onPageFinished: (url) {
            isBusy = true;
          },
          onPageStarted: (url) {
            isBusy = false;
          },
        ),
      );
    super.initState();
  }

  Center buildErrorMessage() {
    return const Center(
      child: Text(
        "Something went wrong",
        style: TextStyle(
          color: Colors.red,
        ),
      ),
    );
  }

  Widget buildWebView(AsyncSnapshot<String?> snapshot) {
    //...

    var paystackUrl = snapshot.data;

    if (paystackUrl == null) {
      return buildErrorMessage();
    }

    controller.loadRequest(
      Uri.parse(paystackUrl),
    );

    return ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: WebViewWidget(
        controller: controller,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      key: futureBuilderKey,
      future: widget.getPaystackUrl,
      builder: (context, snapshot) {
        //...

        if (isBusy) {
          return const BusyIndicator(
            color: Colors.orange,
          );
        }

        if (snapshot.hasData) {
          return Stack(
            children: [
              const Positioned.fill(
                child: Center(
                  child: BusyIndicator(
                    color: Colors.green,
                  ),
                ),
              ),
              Positioned.fill(
                child: buildWebView(snapshot),
              )
            ],
          );
        }

        return const BusyIndicator(
          color: Colors.red,
        );
      },
    );
  }
}

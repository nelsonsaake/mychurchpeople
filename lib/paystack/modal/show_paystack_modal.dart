import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import 'package:hostels/resources/color_resources.dart';
import 'package:hostels/paystack/modal/paystack_modal.dart';
import 'package:hostels/widgets/space/space.dart';

Future showPaystackModal(
  BuildContext context,
  Future<String?> getPaystackUrl,
) async {
  // ...

  if (!(Platform.isAndroid || Platform.isIOS)) return;

  return showDialog(
    context: context,
    barrierDismissible: true,
    builder: (BuildContext context) {
      return Dialog(
        //...
        backgroundColor: Colors.transparent,

        surfaceTintColor: Colors.transparent,

        insetPadding: const EdgeInsets.all(16),

        child: Column(
          children: [
            //...

            const Space(10),

            Align(
              alignment: Alignment.centerRight,
              child: buildCloseButton(context),
            ),

            const Space(15),

            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: PaystackWebView(
                  getPaystackUrl: getPaystackUrl,
                ),
              ),
            ),
          ],
        ),
      );
    },
  );
}

Widget buildCloseButton(BuildContext context) {
  return SizedBox.square(
    dimension: 35,
    child: Center(
      child: TextButton(
        onPressed: () => Navigator.of(context).pop(),
        style: TextButton.styleFrom(
          backgroundColor: Colors.white,
          elevation: 2,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(35 / 2),
          ),
          padding: EdgeInsets.zero,
        ),
        child: const Icon(
          PhosphorIcons.x,
          color: ColorResources.dark,
        ),
      ),
    ),
  );
}

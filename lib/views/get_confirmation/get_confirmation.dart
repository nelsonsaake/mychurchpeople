import 'package:flutter/material.dart';
import 'package:hostels/resources/color_resources.dart';
import 'package:hostels/widgets/buttons/dialog_button.dart';
import 'package:hostels/widgets/g_card/g_card.dart';
import 'package:hostels/widgets/space/space.dart';

Future<bool?> getConfirmation(BuildContext context, String message) {
  return showDialog<bool?>(
    context: context,
    builder: (context) {
      return Dialog(
        child: GCard(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Confirm",
                  style: TextStyle(
                    fontSize: 20,
                    color: ColorResources.green,
                  ),
                ),
                Text(
                  message,
                ),
                const Space.vertical(16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    DialogButton(
                      "No",
                      isOutline: true,
                      isBusy: false,
                      onTap: () => Navigator.of(context).pop(false),
                    ),
                    const Space.horizontal(16),
                    DialogButton(
                      "Yes",
                      isBusy: false,
                      onTap: () => Navigator.of(context).pop(true),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      );
    },
  );
}

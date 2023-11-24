import 'package:flutter/material.dart';
import 'package:hostels/resources/color_resources.dart';
import 'package:hostels/widgets/buttons/dialog_button.dart';
import 'package:hostels/widgets/g_card/g_card.dart';
import 'package:hostels/widgets/space/space.dart';

Future<bool?> getDeleteConfirmation(
  BuildContext context, {
  String resource = "this resource",
}) async {
  return showDialog<bool?>(
    context: context,
    builder: (context) {
      return Dialog(
        insetPadding: const EdgeInsets.all(16.0),
        child: Stack(
          children: [
            GCard(
              height: 150,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Confirm Delete",
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.red,
                      ),
                    ),
                    Text(
                      "Are you show you want to delete $resource?",
                    ),
                    const Space.vertical(16),
                  ],
                ),
              ),
            ),
            Positioned(
              bottom: 10,
              right: 10,
              child: Container(
                alignment: Alignment.bottomRight,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    DialogButton(
                      "No",
                      isOutline: true,
                      isBusy: false,
                      color: Colors.white,
                      backgroundColor: ColorResources.green,
                      onTap: () => Navigator.of(context).pop(false),
                    ),
                    const Space.horizontal(16),
                    DialogButton(
                      "Yes",
                      isBusy: false,
                      color: Colors.white,
                      backgroundColor: Colors.red,
                      onTap: () => Navigator.of(context).pop(true),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    },
  );
}

import 'package:flutter/material.dart';

class DropDown extends StatelessWidget {
  const DropDown({
    super.key,
    this.value,
    required this.items,
    this.onChanged,
  });

  final String? value;
  final Map<String, String> items; // title, key
  final Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(0),
      surfaceTintColor: Colors.transparent,
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Container(
        width: double.maxFinite,
        padding: const EdgeInsets.symmetric(
          vertical: 8.0,
          horizontal: 16.0,
        ),
        child: DropdownButton<String>(
          isExpanded: true,
          borderRadius: BorderRadius.circular(10),
          underline: const SizedBox(),
          value: value ?? "#001",
          items: [
            buildDropDownMenuItem(
              "#001",
              "Select item",
            ),
            for (MapEntry v in items.entries)
              buildDropDownMenuItem(v.key, v.value)
          ],
          onChanged: (v) {
            onChanged?.call(v as String);
          },
        ),
      ),
    );
  }

  DropdownMenuItem<String> buildDropDownMenuItem(
    String? value,
    String? title,
  ) {
    return DropdownMenuItem<String>(
      value: value ?? "",
      child: Text(
        title ?? "",
        style: const TextStyle(
          fontSize: 18,
        ),
      ),
    );
  }
}

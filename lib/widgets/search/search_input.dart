import 'package:flutter/material.dart';
import 'package:hostels/resources/color_resources.dart';

class SearchInput extends StatelessWidget {
  const SearchInput({
    super.key,
    this.controller,
    this.hint,
  });

  final TextEditingController? controller;
  final String? hint;

  @override
  Widget build(BuildContext context) {
    return Card(
      //...

      elevation: 2,

      clipBehavior: Clip.antiAlias,

      margin: EdgeInsets.zero,

      color: ColorResources.dark,

      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
        side: const BorderSide(
          color: ColorResources.dark,
          width: 1,
        ),
      ),

      child: Container(
        color: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: TextField(
          controller: controller,
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: hint,
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:hostels/resources/color_resources.dart';
import 'package:stacked/stacked.dart';

import 'text_area_viewmodel.dart';

class TextAreaInput extends StackedView<TextAreaViewModel> {
  const TextAreaInput({
    super.key,
    this.controller,
    this.validator,
    this.obscureText = false,
  });

  final bool obscureText;
  final TextEditingController? controller;
  final String? Function(String? v)? validator;

  @override
  Widget builder(BuildContext context, viewModel, child) {
    return TextFormField(
      //...

      validator: validator,
      controller: viewModel.controller,
      obscureText: obscureText,

      minLines: 3,
      maxLines: 5,

      decoration: InputDecoration(
        //...

        fillColor: Colors.white,
        filled: true,
        border: OutlineInputBorder(
          //...

          borderRadius: BorderRadius.circular(10),

          borderSide: const BorderSide(
            color: ColorResources.dark,
            width: 2,
          ),
        ),

        errorStyle: const TextStyle(
          color: Colors.redAccent,
        ),
      ),
    );
  }

  @override
  TextAreaViewModel viewModelBuilder(BuildContext context) {
    return TextAreaViewModel(controller: controller);
  }

  @override
  void onViewModelReady(TextAreaViewModel viewModel) {}
}

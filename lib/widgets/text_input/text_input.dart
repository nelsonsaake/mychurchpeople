import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hostels/resources/color_resources.dart';
import 'package:hostels/widgets/text_input/text_input_viewmodel.dart';
import 'package:stacked/stacked.dart';

enum InputType { string, int, double, money }

class TextInput extends StackedView<TextInputViewModel> {
  const TextInput({
    super.key,
    this.controller,
    this.validator,
    this.obscureText = false,
    this.type = InputType.string,
  });

  final bool obscureText;
  final InputType type;
  final TextEditingController? controller;
  final String? Function(String? v)? validator;

  get inputFormatters {
    switch (type) {
      case InputType.string:
        return null;
      case InputType.int:
        return [FilteringTextInputFormatter.digitsOnly];
      case InputType.double:
        return <TextInputFormatter>[
          FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d*')),
        ];
      case InputType.money:
        return <TextInputFormatter>[
          FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d{0,2}')),
        ];
    }
  }

  get keyboardType {
    switch (type) {
      case InputType.string:
        return null;
      case InputType.int:
        return TextInputType.number;
      case InputType.double:
      case InputType.money:
        return const TextInputType.numberWithOptions(decimal: true);
    }
  }

  @override
  Widget builder(BuildContext context, viewModel, child) {
    return TextFormField(
      //...

      validator: validator,

      controller: viewModel.controller,

      obscureText: obscureText,

      inputFormatters: inputFormatters,

      keyboardType: keyboardType,

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
  TextInputViewModel viewModelBuilder(BuildContext context) {
    return TextInputViewModel(controller: controller);
  }

  @override
  void onViewModelReady(TextInputViewModel viewModel) {}
}

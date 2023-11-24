import 'package:flutter/material.dart';
import 'package:hostels/viewmodels/context_viewmodel/context_viewmodel.dart';

class TextAreaViewModel extends ContextViewModel {
  //...

  TextAreaViewModel({
    TextEditingController? controller,
  }) : controller = controller ?? TextEditingController();

  final TextEditingController controller;
}

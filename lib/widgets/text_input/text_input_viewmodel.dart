import 'package:flutter/material.dart';
import 'package:hostels/viewmodels/context_viewmodel/context_viewmodel.dart';

class TextInputViewModel extends ContextViewModel {
  //...

  TextInputViewModel({
    TextEditingController? controller,
  }) : controller = controller ?? TextEditingController();

  final TextEditingController controller;
}

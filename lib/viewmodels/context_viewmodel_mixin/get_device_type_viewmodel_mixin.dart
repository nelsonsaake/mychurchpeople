import 'dart:io';

import 'package:hostels/viewmodels/context_viewmodel/context_viewmodel.dart';

mixin GetDeviceTypeViewModelMixin on ContextViewModel {
  //...

  get deviceType =>
      '${Platform.operatingSystem} ${Platform.operatingSystemVersion}';
}

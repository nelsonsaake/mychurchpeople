import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:hostels/models/room_type.dart';
import 'package:hostels/resources/color_resources.dart';
import 'package:hostels/widgets/busy_indicator/busy_indicator.dart';
import 'package:hostels/widgets/buttons/button.dart';
import 'package:hostels/widgets/space/space.dart';
import 'package:stacked/stacked.dart';

import 'room_type_image_editor_viewmodel.dart';

class RoomTypeImageEditor extends StackedView<RoomTypeImageEditorViewModel> {
  const RoomTypeImageEditor(this.roomType, {super.key});

  final RoomType? roomType;

  @override
  Widget builder(
    BuildContext context,
    RoomTypeImageEditorViewModel viewModel,
    Widget? child,
  ) {
    //...

    ImageProvider backgroundImageProvider = const AssetImage(
      "assets/images/placeholder.jpg",
    );

    if (viewModel.hasPhoto) {
      backgroundImageProvider = FileImage(
        viewModel.photoAsFile!,
      );
    }

    Widget? photoView = buildImageWrap(
      viewModel,
      backgroundImageProvider,
    );

    if (viewModel.hasImage) {
      photoView = CachedNetworkImage(
        imageUrl: viewModel.image ?? "",
        imageBuilder: (context, imageProvider) {
          return buildImageWrap(
            viewModel,
            imageProvider,
          );
        },
      );
    }

    return Column(
      children: [
        //...

        Container(
          height: 2 * 90,
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(
              10,
            ),
          ),
          child: photoView,
        ),

        const Space.vertical(16),

        Row(
          children: [
            Expanded(
              child: buildTakePhotoButton(viewModel),
            ),
            const Space(16),
            Expanded(
              child: buildSelectPhotoButton(viewModel),
            ),
          ],
        ),

        const Space.vertical(32),
      ],
    );
  }

  Widget buildImageWrap(
    RoomTypeImageEditorViewModel viewModel,
    ImageProvider<Object> backgroundImageProvider,
  ) {
    //...

    Widget? child;

    if (viewModel.isBusy) {
      child = buildBusyIndicator();
    }

    return AnimatedContainer(
      key: viewModel.photoViewKey,
      duration: const Duration(seconds: 1),
      decoration: BoxDecoration(
        image: DecorationImage(
          image: backgroundImageProvider,
          fit: BoxFit.cover,
          alignment: Alignment.center,
        ),
      ),
      child: child,
    );
  }

  Button buildSelectPhotoButton(RoomTypeImageEditorViewModel viewModel) {
    return Button(
      "Select Photo",
      isBusy: false,
      borderRadius: 10,
      backgroundColor: ColorResources.green,
      color: Colors.white,
      onTap: viewModel.selectPhoto,
    );
  }

  Button buildTakePhotoButton(RoomTypeImageEditorViewModel viewModel) {
    return Button(
      "Take photo",
      isBusy: false,
      borderRadius: 10,
      backgroundColor: Colors.white,
      color: ColorResources.dark,
      onTap: viewModel.takePhoto,
    );
  }

  Container buildBusyIndicator() {
    return Container(
      color: Colors.black38,
      alignment: Alignment.center,
      child: const BusyIndicator(
        color: Colors.white,
      ),
    );
  }

  @override
  RoomTypeImageEditorViewModel viewModelBuilder(BuildContext context) {
    return RoomTypeImageEditorViewModel(
      roomType,
    );
  }
}

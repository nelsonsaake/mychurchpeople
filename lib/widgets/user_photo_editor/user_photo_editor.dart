import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:hostels/resources/color_resources.dart';
import 'package:hostels/widgets/busy_indicator/busy_indicator.dart';
import 'package:hostels/widgets/buttons/button.dart';
import 'package:hostels/widgets/space/space.dart';
import 'package:hostels/widgets/user_photo_editor/user_photo_editor_viewmodel.dart';
import 'package:stacked/stacked.dart';

class UserProfileEditor extends StackedView<UserPhotoEditorViewModel> {
  const UserProfileEditor({super.key});

  @override
  Widget builder(
    BuildContext context,
    UserPhotoEditorViewModel viewModel,
    Widget? child,
  ) {
    //...

    ImageProvider backgroundImageProvider = const AssetImage(
      "assets/avatars/1.png",
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

    if (viewModel.doesUserHavePhoto) {
      photoView = CachedNetworkImage(
        imageUrl: viewModel.user?.photoURL ?? "",
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

        SizedBox.square(
          dimension: 2 * 90,
          child: Container(
            clipBehavior: Clip.antiAlias,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
            ),
            child: photoView,
          ),
        ),

        const Space.vertical(32),

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
    UserPhotoEditorViewModel viewModel,
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
        ),
      ),
      child: child,
    );
  }

  Button buildSelectPhotoButton(UserPhotoEditorViewModel viewModel) {
    return Button(
      "Select Photo",
      isBusy: false,
      borderRadius: 10,
      backgroundColor: ColorResources.green,
      color: Colors.white,
      onTap: viewModel.selectPhoto,
    );
  }

  Button buildTakePhotoButton(UserPhotoEditorViewModel viewModel) {
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
  UserPhotoEditorViewModel viewModelBuilder(BuildContext context) {
    return UserPhotoEditorViewModel();
  }
}

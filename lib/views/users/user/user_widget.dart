import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:hostels/models/user.dart';
import 'package:hostels/views/users/users_viewmodel.dart';
import 'package:hostels/widgets/g_card/g_card.dart';
import 'package:hostels/widgets/space/space.dart';
import 'package:stacked/stacked.dart';

class UserWidget extends ViewModelWidget<UsersViewModel> {
  const UserWidget(this.user, {super.key});

  final AppUser user;

  @override
  Widget build(BuildContext context, viewModel) {
    return GestureDetector(
      onDoubleTap: () => viewModel.toggleAdminStatus(context, user),
      child: GCard(
        emphasize: user.isAdmin,
        isBusy: viewModel.isAppUserUpdating(user),
        child: Container(
          width: double.maxFinite,
          padding: const EdgeInsets.all(16.0).copyWith(left: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              buildUserPhoto(),
              const Space.vertical(4),
              if (user.isAdmin) const Text("Admin"),
              Text(user.name ?? "Name N/A"),
              Text("${user.email}"),
            ],
          ),
        ),
      ),
    );
  }

  CircleAvatar buildUserPhoto() {
    return CircleAvatar(
      backgroundColor: Colors.grey,
      radius: 36,
      child: CachedNetworkImage(
        imageUrl: user.photoURL ?? "",
        errorWidget: (context, url, error) {
          return Image.asset(
            "assets/avatars/1.png",
            fit: BoxFit.cover,
          );
        },
      ),
    );
  }
}

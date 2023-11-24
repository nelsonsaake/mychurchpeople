import 'package:flutter/material.dart';
import 'package:hostels/models/user.dart';
import 'package:hostels/resources/string_resources.dart';
import 'package:hostels/views/_layouts/view_layout.dart';
import 'package:hostels/views/users/user/user_widget.dart';
import 'package:hostels/widgets/search/search_input.dart';
import 'package:hostels/widgets/space/space.dart';
import 'package:stacked/stacked.dart';

import 'users_viewmodel.dart';

class UsersView extends StackedView<UsersViewModel> {
  const UsersView({super.key});

  @override
  Widget builder(BuildContext context, viewModel, child) {
    return ViewLayout(
      //...

      title: StringResources.users,

      applyPadding: true,

      isBusy: viewModel.isBusy,

      children: [
        //...

        const Space(16),

        ...[
          //...

          buildSectionTitle("Search"),

          const Space(8),

          SearchInput(
            key: viewModel.searchKey,
            controller: viewModel.search,
            hint: "name, email",
          ),

          const Space(64),

          Text(
            [
              "Double tap on a user to make that user an admin.",
              "Double tap on an admin to make admin a regular user.",
            ].join(
              "\n",
            ),
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.white,
            ),
          ),

          const Space(64),

          buildSectionTitle("Users"),

          const Space(16),

          for (AppUser user in viewModel.filteredUsers) ...[
            //...

            UserWidget(user),

            const Space(16),
          ],
        ],
      ],
    );
  }

  Padding buildUserWidget(AppUser user) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: UserWidget(user),
    );
  }

  Widget buildSectionTitle(String title) {
    return Text(
      title,
      style: const TextStyle(
        color: Colors.white,
      ),
    );
  }

  @override
  UsersViewModel viewModelBuilder(BuildContext context) {
    return UsersViewModel();
  }

  @override
  void onViewModelReady(UsersViewModel viewModel) {
    viewModel.init();
    super.onViewModelReady(viewModel);
  }
}

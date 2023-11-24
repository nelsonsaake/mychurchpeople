import 'package:flutter/material.dart';
import 'package:hostels/app/app.router.dart';
import 'package:hostels/factory/scaffold_keys.dart';
import 'package:hostels/resources/color_resources.dart';
import 'package:hostels/views/_layouts/view_layout_viewmodel.dart';
import 'package:hostels/widgets/busy_indicator/busy_indicator.dart';
import 'package:hostels/widgets/space/space.dart';
import 'package:stacked/stacked.dart';

class ViewLayout extends StackedView<ViewLayoutViewModel> {
  const ViewLayout({
    super.key,
    this.child,
    this.children,
    this.title,
    this.applyPadding,
    this.isBusy = false,
    this.noScroll = false,
    this.fab,
  });

  final Widget? child;
  final Widget? fab;
  final List<Widget>? children;
  final String? title;
  final bool? applyPadding;
  final bool isBusy;
  final bool noScroll;

  EdgeInsets padding() {
    if (applyPadding != true) return EdgeInsets.zero;
    return const EdgeInsets.symmetric(vertical: 32, horizontal: 16);
  }

  AppBar? buildAppBar() {
    //...

    if (title == null) return null;

    return AppBar(
      title: Text(
        title!,
        style: const TextStyle(
          color: Colors.white,
        ),
      ),
      actions: [
        if (isBusy) const BusyIndicator(),
        if (isBusy) const Space.horizontal(16),
      ],
      backgroundColor: ColorResources.dark,
      elevation: 2,
      shape: const Border(
        bottom: BorderSide(
          width: 1,
          color: ColorResources.dark,
        ),
      ),
    );
  }

  Widget buildBody() {
    return Container(
      decoration: BoxDecoration(
        gradient: ColorResources.darkBackgroundGradient,
      ),
      child: Builder(
        builder: (context) {
          final children = <Widget>[
            //...

            Container(child: child),

            ...(this.children ?? []),
          ];

          if (noScroll) {
            return Column(
              children: children,
            );
          }

          return ListView(
            padding: padding(),
            children: [
              ...children,
              const Space.vertical(120),
            ],
          );
        },
      ),
    );
  }

  UserAccountsDrawerHeader buildDrawerHeader(ViewLayoutViewModel viewModel) {
    return UserAccountsDrawerHeader(
      decoration: const BoxDecoration(color: Colors.white10),
      accountName: Text(viewModel.userName),
      accountEmail: Text(viewModel.userEmail),
      currentAccountPicture: const CircleAvatar(
        backgroundImage: AssetImage('assets/avatars/1.png'),
      ),
    );
  }

  List<Widget> buildDrawerSectionHeader(String text) {
    return [
      //...

      const Space.vertical(40),

      ListTile(
        title: Text(
          text.toUpperCase(),
          style: const TextStyle(
            fontSize: 13,
            color: Colors.grey,
          ),
        ),
      ),
    ];
  }

  Widget buildDrawerTile(String text, [VoidCallback? onTap]) {
    return ListTile(
      title: Text(
        text,
        style: const TextStyle(
          color: Colors.white,
        ),
      ),
      trailing: const Icon(Icons.arrow_right),
      onTap: onTap,
    );
  }

  NavigationDrawer buildDrawer(ViewLayoutViewModel viewModel) {
    return NavigationDrawer(
      children: [
        //...

        if (viewModel.isLoggedIn) buildDrawerHeader(viewModel),

        ...buildDrawerSectionHeader("About"),

        buildDrawerTile(
          "About",
          viewModel.nav.navigateToAboutView,
        ),

        ...buildDrawerSectionHeader("Account"),

        // if logged in show profile, logout button
        // if not logged in show login or register button
        if (viewModel.isLoggedIn) ...[
          buildDrawerTile(
            "Profile",
            viewModel.nav.navigateToProfileView,
          ),
          buildDrawerTile(
            "Logout",
            viewModel.logout,
          ),
        ] else ...[
          buildDrawerTile(
            "Login",
            viewModel.nav.navigateToLoginView,
          ),
          buildDrawerTile(
            "Register",
            viewModel.nav.navigateToRegisterView,
          ),
        ],

        ...buildDrawerSectionHeader("Rooms"),

        if (viewModel.isLoggedIn)
          buildDrawerTile(
            "My Room",
            viewModel.nav.navigateToMyRoomView,
          ),

        buildDrawerTile(
          "Available Rooms",
          viewModel.nav.navigateToStoreView,
        ),

        if (viewModel.isAdminLoggedIn) ...[
          //...

          ...buildDrawerSectionHeader("Admin"),

          ...[
            {
              "Users": viewModel.nav.navigateToUsersView,
            },
            {
              "Payments": viewModel.nav.navigateToPaymentsView,
            },
            {
              "Rooms": viewModel.nav.navigateToRoomsView,
            },
            {
              "Floors": viewModel.nav.navigateToFloorsView,
            },
            {
              "RoomTypes": viewModel.nav.navigateToRoomTypesView,
            },
          ].map(
            (v) {
              String title = v.entries.first.key;
              VoidCallback action = v.entries.first.value;
              return buildDrawerTile(
                title,
                action,
              );
            },
          )
        ],

        const Space.vertical(120),
      ],
    );
  }

  @override
  Widget builder(
    BuildContext context,
    ViewLayoutViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      appBar: buildAppBar(),
      backgroundColor: ColorResources.dark,
      key: ScaffoldKeys.newKey,
      drawer: buildDrawer(viewModel),
      body: SafeArea(child: buildBody()),
      floatingActionButton: fab,
    );
  }

  @override
  ViewLayoutViewModel viewModelBuilder(BuildContext context) {
    return ViewLayoutViewModel();
  }

  @override
  void onViewModelReady(ViewLayoutViewModel viewModel) {
    viewModel.init();
    super.onViewModelReady(viewModel);
  }
}

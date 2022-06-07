import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc_example/ui/screen/main_screens/chatbot_screen.dart';
import 'package:flutter_bloc_example/ui/screen/main_screens/home_screen.dart';
import 'package:flutter_bloc_example/ui/screen/main_screens/saved_screen.dart';
import 'package:flutter_bloc_example/ui/screen/main_screens/user_screen.dart';
import 'package:flutter_bloc_example/ui/ui_constant/app_color.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

class RootScreen extends StatelessWidget {
  RootScreen({Key? key}) : super(key: key);

  final PersistentTabController _controller = PersistentTabController(initialIndex: 0);

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      context,
      controller: _controller,
      screens: _buildScreens(),
      items: _navBarsItems(),
      confineInSafeArea: true,
      backgroundColor: Colors.white, // Default is Colors.white.
      handleAndroidBackButtonPress: true, // Default is true.
      resizeToAvoidBottomInset:
          true, // This needs to be true if you want to move up the screen when keyboard appears. Default is true.
      stateManagement: true, // Default is true.
      hideNavigationBarWhenKeyboardShows:
          true, // Recommended to set 'resizeToAvoidBottomInset' as true while using this argument. Default is true.
      decoration: NavBarDecoration(
        border: const Border(top: BorderSide(width: 0.25, color: Colors.black38)),
        colorBehindNavBar: AppColor.mainColor.shade100,
      ),
      popAllScreensOnTapOfSelectedTab: true,
      popActionScreens: PopActionScreensType.all,
      itemAnimationProperties: const ItemAnimationProperties(
        // Navigation Bar's items animation properties.
        duration: Duration(milliseconds: 200),
        curve: Curves.fastLinearToSlowEaseIn,
      ),
      screenTransitionAnimation: const ScreenTransitionAnimation(
        // Screen transition animation on change of selected tab.
        animateTabTransition: true,
        curve: Curves.fastLinearToSlowEaseIn,
        duration: Duration(milliseconds: 200),
      ),
      navBarStyle: NavBarStyle.style14, // Choose the nav bar style with this property.
    );
  }

  List<Widget> _buildScreens() {
    return [
      const HomeScreen(),
      const SavedScreen(),
      const ChatBotScreen(),
      const UserScreen(),
    ];
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.home),
        title: ('Trang chủ'),
        activeColorPrimary: AppColor.mainColor,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.bookmark),
        title: ('Đã lưu'),
        activeColorPrimary: AppColor.mainColor,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.forum),
        title: ('Chatbot'),
        activeColorPrimary: AppColor.mainColor,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.account_circle),
        title: ("Tài khoản"),
        activeColorPrimary: AppColor.mainColor,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
    ];
  }
}

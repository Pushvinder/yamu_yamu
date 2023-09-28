import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart' as c;
import 'package:get/get.dart';
import 'package:yamu/constants/ColorRes.dart';
import 'package:yamu/routes/Routes.dart';
import 'package:yamu/screens/dashboard/bottom_nav/dashboard_controller.dart';
import 'package:yamu/screens/dashboard/home/my_home/home_view.dart';
import 'package:yamu/screens/dashboard/orders/orders_view.dart';
import 'package:yamu/screens/dashboard/profile/my_profile/profile_view.dart';
import 'package:yamu/screens/dashboard/wishlist/wishlist_view.dart';

class DashboardView extends StatelessWidget {
  DashboardView({Key? key}) : super(key: key);
  final iconList = <IconData>[
    Icons.home_outlined,
    c.CupertinoIcons.doc_plaintext,
    c.CupertinoIcons.suit_heart,
    c.CupertinoIcons.profile_circled,
  ];

  final viewsList = <Widget>[
    HomeView(),
    OrderView(),
    WishlistView(),
    ProfileView(),
  ];

  @override
  Widget build(BuildContext context) {
    return GetX(builder: (DashboardController controller) {
      return Scaffold(
        body: viewsList[controller.bottomTabIndex.value], //destination screen
        floatingActionButton: FloatingActionButton(
          backgroundColor: ColorRes.colorPrimary,
          child: const Icon(Icons.shopping_basket_outlined),
          onPressed: () {
            Get.toNamed(Routes().cart);
          },
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: AnimatedBottomNavigationBar(
          icons: iconList,
          activeIndex: controller.bottomTabIndex.value,
          activeColor: ColorRes.colorPrimary,
          gapLocation: GapLocation.center,
          notchSmoothness: NotchSmoothness.sharpEdge,
          leftCornerRadius: 15,
          rightCornerRadius: 15,
          onTap: (index) {
            controller.bottomTabIndex.value = index;
            controller.onBottomTap(index);
          },
        ),
      );
    });
  }
}

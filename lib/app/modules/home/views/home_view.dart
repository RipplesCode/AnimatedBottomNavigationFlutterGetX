import 'package:fancy_bottom_navigation/fancy_bottom_navigation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Animated Bottom Bar'),
        centerTitle: true,
      ),
      body: SizedBox.expand(
        child: PageView(
          physics: ScrollPhysics(parent: NeverScrollableScrollPhysics()),
          children: [
            Container(
              child: Center(
                child: Text(
                  'Home',
                  style: TextStyle(fontSize: 30),
                ),
              ),
            ),
            Container(
              child: Center(
                child: Text(
                  'Wishlist',
                  style: TextStyle(fontSize: 30),
                ),
              ),
            ),
            Container(
              child: Center(
                child: Text(
                  'Cart',
                  style: TextStyle(fontSize: 30),
                ),
              ),
            ),
            Container(
              child: Center(
                child: Text(
                  'Profile',
                  style: TextStyle(fontSize: 30),
                ),
              ),
            )
          ],
          controller: controller.pageController,
        ),
      ),
      bottomNavigationBar: Obx(
        () => FancyBottomNavigation(
          tabs: [
            TabData(
              iconData: Icons.home,
              title: 'Home',
            ),
            TabData(
              iconData: Icons.favorite,
              title: 'Wishlist',
            ),
            TabData(
              iconData: Icons.shopping_cart,
              title: 'Cart',
            ),
            TabData(
              iconData: Icons.account_box,
              title: 'Profile',
            ),
          ],
          onTabChangedListener: (position) {
            controller.currentIndex.value = position;
            controller.pageController.jumpToPage(position);
          },
          initialSelection: controller.currentIndex.value,
          key: controller.bottomNavigationKey,
          inactiveIconColor: Colors.grey,
        ),
      ),
    );
  }
}

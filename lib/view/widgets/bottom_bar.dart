import 'package:ebazar/controller/bottom_bar_controller.dart';
import 'package:ebazar/view/app_colors/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';



class BottomNavigateBar extends StatelessWidget {
  BottomBarController bottomController = Get.find();
  @override
  Widget build(BuildContext context) {
    return GetX<BottomBarController>(
        builder: (controller) {
          return  BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            showUnselectedLabels: true,
            currentIndex: controller.currentBNBIndex.value,
            onTap: controller.indexChanged,
            selectedItemColor: AppColors.pink,
            unselectedItemColor: Colors.black54,
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.favorite_outlined),
                label: 'Favourite',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.shopping_cart),
                label: 'Cart',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: 'Account',
              ), BottomNavigationBarItem(
                icon: Icon(Icons.menu_outlined),
                label: 'More',
              ),

            ],
          );
        }
    );
  }
}
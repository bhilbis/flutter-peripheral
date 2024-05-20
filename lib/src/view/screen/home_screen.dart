import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter_peripheral/core/app_color.dart';
import 'package:flutter_peripheral/core/app_data.dart';
import 'package:flutter_peripheral/src/view/screen/cart_screen.dart';
import 'package:flutter_peripheral/src/view/screen/favorite_screen.dart';
import 'package:flutter_peripheral/src/controller/office_peripheral_controller.dart';
import 'package:flutter_peripheral/src/view/screen/office_peripheral_list_screen.dart';

final OfficePeripheralController controller =
    Get.put(OfficePeripheralController());

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  final List<Widget> screens = const [
    OfficePeripheralListScreen(),
    CartScreen(),
    FavoriteScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Obx(
        () {
          return BottomNavigationBar(
            unselectedItemColor: Colors.grey,
            currentIndex: controller.currentBottomNavItemIndex.value,
            showUnselectedLabels: true,
            onTap: controller.switchBetweenBottomNavigationItems,
            fixedColor: AppColor.lightBlack,
            items: AppData.bottomNavigationItems
                .map(
                  (element) => BottomNavigationBarItem(
                      icon: element.icon, label: element.label),
                )
                .toList(),
          );
        },
      ),
      body: Obx(() => screens[controller.currentBottomNavItemIndex.value]),
    );
  }
}

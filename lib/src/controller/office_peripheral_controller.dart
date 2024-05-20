import 'package:get/get.dart';
import 'package:flutter_peripheral/core/app_extension.dart';
import 'package:flutter_peripheral/src/model/peripheral.dart';

class OfficePeripheralController extends GetxController {
  RxInt currentBottomNavItemIndex = 0.obs;
  RxInt currentPageViewItemIndicator = 0.obs;
  RxList<Peripheral> cartPeripheral = <Peripheral>[].obs;
  RxList<Peripheral> favoritePeripheralList = <Peripheral>[].obs;
  RxDouble totalPrice = 0.0.obs;

  switchBetweenBottomNavigationItems(int currentIndex) {
    currentBottomNavItemIndex.value = currentIndex;
  }

  switchBetweenPageViewItems(int currentIndex) {
    currentPageViewItemIndicator.value = currentIndex;
  }

  isFavoritePeripheral(Peripheral peripheral) {
    peripheral.isFavorite = !peripheral.isFavorite;
    update();
    if (peripheral.isFavorite) {
      favoritePeripheralList.add(peripheral);
    }
    if (!peripheral.isFavorite) {
      favoritePeripheralList.removeWhere((element) => element == peripheral);
    }
  }

  void increaseItem(Peripheral peripheral) {
    peripheral.quantity++;
    update();
    calculateTotalPrice();
  }

  void decreaseItem(Peripheral peripheral) {
    if (peripheral.quantity > 0) {
      peripheral.quantity--;
      update();
      if (peripheral.quantity == 0) {
        cartPeripheral.remove(peripheral);
      }
      calculateTotalPrice();
    }
  }

  void addToCart(Peripheral peripheral) {
    if (peripheral.quantity > 0) {
      cartPeripheral.add(peripheral);
      cartPeripheral.assignAll(cartPeripheral.distinctBy((item) => item));
      calculateTotalPrice();
    }
  }

  // calculateTotalPrice() {
  //   totalPrice.value = 0;
  //   for (var element in cartPeripheral) {
  //     totalPrice.value += element.quantity * element.price;
  //   }
  // }

  void calculateTotalPrice() {
    totalPrice.value = cartPeripheral.fold(
        0, (total, item) => total + item.quantity * item.price);
  }

  void clearCart() {
    cartPeripheral.clear();
    totalPrice.value = 0;
    update();
  }
}

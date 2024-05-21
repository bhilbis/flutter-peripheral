import 'package:get/get.dart';
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
    if (peripheral.quantity > 1) {
      peripheral.quantity--;
      if (peripheral.quantity == 0) {
        cartPeripheral.remove(peripheral);
      }
      update();
      calculateTotalPrice();
    }
  }

  void addToCart(Peripheral peripheral) {
    if (peripheral.quantity > 0) {
      final existingPeripheral =
          cartPeripheral.firstWhereOrNull((p) => p.title == peripheral.title);
      if (existingPeripheral != null) {
        existingPeripheral.quantity += peripheral.quantity;
      } else {
        cartPeripheral.add(peripheral);
      }
      calculateTotalPrice();
    }
  }

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

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
      Get.snackbar('Favorite', '${peripheral.title} added to favorites');
    } else {
      favoritePeripheralList.remove(peripheral);
      Get.snackbar('Favorite', '${peripheral.title} removed from favorites');
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
    } else {
      cartPeripheral.remove(peripheral);
    }
    update();
    calculateTotalPrice();
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
      Get.snackbar('Cart', '${peripheral.title} added to cart');
    }
  }

  void calculateTotalPrice() {
    totalPrice.value = cartPeripheral.fold(
        0, (total, item) => total + item.quantity * item.price);
  }

  void clearCart() {
    if (cartPeripheral.isNotEmpty) {
      cartPeripheral.clear();
      totalPrice.value = 0;
      update();
      Get.snackbar('Cart', 'Cart cleared');
    } else {
      Get.snackbar('Cart', 'Cart is already empty');
    }
  }

  void removeItem(Peripheral peripheral) {
    if (cartPeripheral.contains(peripheral)) {
      cartPeripheral.remove(peripheral);
      calculateTotalPrice();
      update();
      Get.snackbar('Cart', '${peripheral.title} removed from cart');
    } else {
      Get.snackbar('Cart', 'Item is not in the cart');
    }
  }
}

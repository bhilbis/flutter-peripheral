import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter_peripheral/core/app_color.dart';
import 'package:flutter_peripheral/core/app_style.dart';
import 'package:flutter_peripheral/src/view/widget/bottom_bar.dart';
import 'package:flutter_peripheral/src/view/widget/empty_widget.dart';
import 'package:flutter_peripheral/src/view/widget/counter_button.dart';
import 'package:flutter_peripheral/src/view/widget/cart_list_view.dart';
import 'package:flutter_peripheral/src/controller/office_peripheral_controller.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  PreferredSizeWidget _appBar(OfficePeripheralController controller) {
    return AppBar(
      title: const Text("Cart", style: h2Style),
      actions: [
        IconButton(
          splashRadius: 20.0,
          onPressed: controller.clearCart,
          icon: const Icon(Icons.delete, color: AppColor.lightBlack),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OfficePeripheralController>(
      builder: (controller) {
        return Scaffold(
          appBar: _appBar(controller),
          bottomNavigationBar: Obx(
            () {
              return BottomBar(
                priceLabel: "Total price",
                priceValue:
                    "\$${controller.totalPrice.value.toStringAsFixed(2)}",
                buttonLabel: "Checkout",
                onTap: controller.totalPrice > 0 ? () {} : null,
              );
            },
          ),
          body: controller.cartPeripheral.isNotEmpty
              ? Padding(
                  padding: const EdgeInsets.all(15),
                  child: CartListView(
                    peripheralItems: controller.cartPeripheral,
                    counterButton: (peripheral) {
                      return CounterButton(
                        orientation: Axis.horizontal,
                        onIncrementSelected: () =>
                            controller.increaseItem(peripheral),
                        onDecrementSelected: () =>
                            controller.decreaseItem(peripheral),
                        label: peripheral.quantity,
                      );
                    },
                    onRemoveItem: (peripheral) =>
                        controller.removeItem(peripheral),
                  ),
                )
              : const EmptyWidget(title: "Empty"),
        );
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_peripheral/core/app_style.dart';
import 'package:flutter_peripheral/src/view/widget/empty_widget.dart';
import 'package:flutter_peripheral/src/view/widget/peripheral_list_view.dart';
import 'package:flutter_peripheral/src/controller/office_peripheral_controller.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Favorites", style: h2Style)),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: GetBuilder<OfficePeripheralController>(
          builder: (controller) {
            return SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  controller.favoritePeripheralList.isNotEmpty
                      ? PeripheralListView(
                          isHorizontal: false,
                          peripheralList: controller.favoritePeripheralList,
                          onFavoriteToggle: (peripheral) {
                            controller.isFavoritePeripheral(peripheral);
                          },
                        )
                      : const EmptyWidget(
                          type: EmptyWidgetType.favorite,
                          title: "Empty",
                        ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

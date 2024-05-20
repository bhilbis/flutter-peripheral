import 'package:flutter/material.dart';
import 'package:flutter_peripheral/core/app_style.dart';
import 'package:flutter_peripheral/src/view/screen/home_screen.dart';
import 'package:flutter_peripheral/src/view/widget/empty_widget.dart';
import 'package:flutter_peripheral/src/view/widget/peripheral_list_view.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Favorites", style: h2Style)),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              controller.favoritePeripheralList.isNotEmpty
                  ? PeripheralListView(
                      isHorizontal: false,
                      peripheralList: controller.favoritePeripheralList,
                    )
                  : const EmptyWidget(
                      type: EmptyWidgetType.favorite,
                      title: "Empty",
                    )
            ],
          ),
        ),
      ),
    );
  }
}

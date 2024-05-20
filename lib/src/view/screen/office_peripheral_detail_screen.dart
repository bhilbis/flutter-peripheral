import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter_peripheral/core/app_color.dart';
import 'package:flutter_peripheral/core/app_style.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_peripheral/core/app_extension.dart';
import 'package:flutter_peripheral/src/model/peripheral.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:flutter_peripheral/src/view/widget/rating_bar.dart';
import 'package:flutter_peripheral/src/view/screen/home_screen.dart';
import 'package:flutter_peripheral/src/view/widget/counter_button.dart';
import 'package:flutter_peripheral/src/controller/office_peripheral_controller.dart';

class OfficePeripheralDetailScreen extends StatelessWidget {
  final Peripheral peripheral;

  const OfficePeripheralDetailScreen({
    super.key,
    required this.peripheral,
  });

  PreferredSizeWidget _appBar(BuildContext context) {
    return AppBar(
      actions: [
        GetBuilder(
          builder: (OfficePeripheralController controller) {
            return IconButton(
              splashRadius: 18.0,
              onPressed: () => controller.isFavoritePeripheral(peripheral),
              icon: peripheral.isFavorite
                  ? const Icon(Icons.bookmark, color: Colors.black)
                  : const Icon(Icons.bookmark_border, color: Colors.black),
            );
          },
        )
      ],
      leading: IconButton(
        icon: const Icon(FontAwesomeIcons.arrowLeft, color: Colors.black),
        onPressed: () {
          controller.currentPageViewItemIndicator.value = 0;
          Navigator.pop(context);
        },
      ),
      title: Text(peripheral.title, style: h2Style),
    );
  }

  Widget bottomBar() {
    return Container(
      padding: const EdgeInsets.all(15),
      height: 90,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const FittedBox(
                child: Text(
                  'Price',
                  style: TextStyle(
                    color: Colors.black45,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 5),
              FittedBox(child: Text("\$${peripheral.price}", style: h2Style))
            ],
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColor.lightBlack,
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            onPressed: () => controller.addToCart(peripheral),
            child: const Text("Add to cart"),
          )
        ],
      ),
    ).fadeAnimation(1.3);
  }

  Widget peripheralImageSlider(double height) {
    return Container(
      padding: const EdgeInsets.only(left: 15, right: 15, bottom: 10),
      height: height * 0.35,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          PageView.builder(
            onPageChanged: controller.switchBetweenPageViewItems,
            itemCount: peripheral.images.length,
            itemBuilder: (_, index) {
              return Padding(
                padding: const EdgeInsets.only(left: 15),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Hero(
                    tag: index,
                    child: Image.asset(
                      peripheral.images[index],
                      width: 150,
                      height: 150,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              );
            },
          ),
          Positioned(
            bottom: 20,
            child: Obx(
              () {
                return AnimatedSmoothIndicator(
                  effect: const WormEffect(
                    dotColor: Colors.white38,
                    activeDotColor: Colors.white,
                  ),
                  activeIndex: controller.currentPageViewItemIndicator.value,
                  count: peripheral.images.length,
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return WillPopScope(
      onWillPop: () async {
        controller.currentPageViewItemIndicator.value = 0;
        return Future.value(true);
      },
      child: Scaffold(
        bottomNavigationBar: bottomBar(),
        appBar: _appBar(context),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                peripheralImageSlider(height),
                Center(
                  child: StarRatingBar(
                    score: peripheral.score,
                    itemSize: 20,
                  ).fadeAnimation(0.4),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20, bottom: 10),
                  child: const Text(
                    "Description",
                    style: h2Style,
                    textAlign: TextAlign.end,
                  ).fadeAnimation(0.6),
                ),
                Text(
                  peripheral.description,
                  maxLines: 5,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(color: Colors.black45),
                ).fadeAnimation(0.8),
                const SizedBox(height: 20),
                Row(
                  children: [
                    Expanded(child: GetBuilder(
                      builder: (OfficePeripheralController controller) {
                        return CounterButton(
                          label: peripheral.quantity,
                          onIncrementSelected: () =>
                              controller.increaseItem(peripheral),
                          onDecrementSelected: () =>
                              controller.decreaseItem(peripheral),
                        );
                      },
                    ))
                  ],
                ).fadeAnimation(1.0)
              ],
            ),
          ),
        ),
      ),
    );
  }
}

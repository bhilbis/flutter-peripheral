import 'package:flutter/material.dart';
import 'package:flutter_peripheral/core/app_style.dart';
import 'package:flutter_peripheral/core/app_extension.dart';
import 'package:flutter_peripheral/src/model/peripheral.dart';

class CartListView extends StatelessWidget {
  const CartListView({
    super.key,
    required this.counterButton,
    required this.peripheralItems,
    required this.onRemoveItem,
  });

  final Widget Function(Peripheral peripheral) counterButton;
  final List<Peripheral> peripheralItems;
  final void Function(Peripheral peripheral) onRemoveItem;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: peripheralItems.length,
      itemBuilder: (_, index) {
        Peripheral peripheral = peripheralItems[index];
        return Padding(
          padding: const EdgeInsets.all(15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Expanded(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15.0),
                  child: Image.asset(peripheral.images[0]),
                ),
              ),
              const SizedBox(width: 5),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(peripheral.title.addOverFlow, style: h4Style),
                  const SizedBox(height: 5),
                  Text("\$${peripheral.price}", style: h2Style),
                  const SizedBox(height: 5),
                  counterButton(peripheral),
                  IconButton(
                    icon: const Icon(Icons.delete),
                    onPressed: () => onRemoveItem(peripheral),
                  ),
                ],
              ),
              // Spacer(),
              // counterButton(peripheral)
            ],
          ).fadeAnimation(0.4 * index),
        );
      },
      separatorBuilder: (_, __) {
        return const Padding(padding: EdgeInsets.only(bottom: 15));
      },
    );
  }
}

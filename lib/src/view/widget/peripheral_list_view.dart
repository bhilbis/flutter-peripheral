import 'package:flutter/material.dart';
import 'package:flutter_peripheral/core/app_style.dart';
import 'package:flutter_peripheral/core/app_extension.dart';
import 'package:flutter_peripheral/src/model/peripheral.dart';
import 'package:flutter_peripheral/src/view/widget/rating_bar.dart';

class PeripheralListView extends StatelessWidget {
  final bool isHorizontal;
  final Function(Peripheral peripheral)? onTap;
  final List<Peripheral> peripheralList;
  final void Function(Peripheral peripheral) onFavoriteToggle;

  const PeripheralListView({
    super.key,
    this.isHorizontal = true,
    this.onTap,
    required this.peripheralList,
    required this.onFavoriteToggle,
  });

  Widget _peripheralScore(Peripheral peripheral) {
    return Row(
      children: [
        StarRatingBar(score: peripheral.score),
        const SizedBox(width: 10),
        Text(peripheral.score.toString(), style: h4Style),
      ],
    ).fadeAnimation(1.0);
  }

  Widget _peripheralImage(String image) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(15.0),
      child: Image.asset(image, width: 150, height: 150),
    ).fadeAnimation(0.4);
  }

  Widget _listViewItem(Peripheral peripheral, int index) {
    Widget widget;
    widget = isHorizontal == true
        ? Column(
            children: [
              Hero(tag: index, child: _peripheralImage(peripheral.images[0])),
              const SizedBox(height: 10),
              Text(peripheral.title.addOverFlow, style: h4Style)
                  .fadeAnimation(0.8),
              _peripheralScore(peripheral),
            ],
          )
        : Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _peripheralImage(peripheral.images[0]),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(peripheral.title, style: h4Style).fadeAnimation(0.8),
                      const SizedBox(height: 5),
                      _peripheralScore(peripheral),
                      const SizedBox(height: 5),
                      Text(
                        peripheral.description,
                        style: h5Style.copyWith(fontSize: 12),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ).fadeAnimation(1.4)
                    ],
                  ),
                ),
              ),
              IconButton(
                icon: Icon(
                  peripheral.isFavorite
                      ? Icons.bookmark
                      : Icons.bookmark_border,
                  color: peripheral.isFavorite ? Colors.black : Colors.black,
                ),
                onPressed: () => onFavoriteToggle(peripheral),
              ),
            ],
          );

    return GestureDetector(
      onTap: () => onTap?.call(peripheral),
      child: widget,
    );
  }

  @override
  Widget build(BuildContext context) {
    return isHorizontal == true
        ? SizedBox(
            height: 220,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: peripheralList.length,
              itemBuilder: (_, index) {
                Peripheral peripheral = peripheralList[index];
                return _listViewItem(peripheral, index);
              },
              separatorBuilder: (BuildContext context, int index) {
                return const Padding(padding: EdgeInsets.only(left: 15));
              },
            ),
          )
        : ListView.builder(
            shrinkWrap: true,
            reverse: true,
            physics: const ClampingScrollPhysics(),
            itemCount: peripheralList.length,
            itemBuilder: (_, index) {
              Peripheral peripheral = peripheralList[index];
              return Padding(
                padding: const EdgeInsets.only(bottom: 15, top: 10),
                child: _listViewItem(peripheral, index),
              );
            },
          );
  }
}

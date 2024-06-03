import 'package:flutter/material.dart';
import 'package:flutter_peripheral/core/app_asset.dart';
import 'package:flutter_peripheral/src/model/peripheral.dart';
// import 'package:flutter_peripheral/src/model/peripheral_color.dart';
import 'package:flutter_peripheral/src/model/bottom_navigation_item.dart';

class AppData {
  const AppData._();

  static List<Peripheral> peripheralList = [
    Peripheral(
      id: '1',
      quantity: 1,
      isFavorite: false,
      title: 'Epomaker TH66 Pro',
      description:
          'The Epomaker TH66 Pro is a 65% mechanical keyboard with a bunch of features that enthusiasts love.'
          'It\'s hot-swappable, so you can easily change the switches to match your typing preference.'
          'It\'s also wireless with Bluetooth and 2.4 GHz connectivity, or you can use the included USB-C cable.'
          'The TH66 Pro has south-facing LEDs for vibrant RGB lighting, and it even has a knob for volume control.'
          'Check it out if you\'re looking for a feature-packed and customizable mechanical keyboard.',
      price: 299.99,
      score: 3.5,
      images: [
        AppAsset.epomakerTh66Keyboard1,
        AppAsset.epomakerTh66Keyboard2,
        AppAsset.epomakerTh66Keyboard3,
        AppAsset.epomakerTh66Keyboard4,
        AppAsset.epomakerTh66Keyboard5,
      ],
      // colors: <PeripheralColor>[
      //   PeripheralColor(color: const Color(0xFF616161), isSelected: true),
      //   PeripheralColor(color: const Color(0xFF424242)),
      // ],
    ),
    Peripheral(
      isFavorite: false,
      id: '2',
      quantity: 1,
      title: 'Ergonomic Gaming Desk with Mouse Pad',
      description:
          'Upgrade your gaming setup with the Ergonomic Gaming Desk, featuring a spacious surface and an integrated mouse pad for ultimate precision.'
          'Designed for comfort, this desk offers a sleek, durable design with ample space for all your gear. The ergonomic layout ensures you can game for hours without strain,'
          'while the high-quality mouse pad enhances your control and accuracy. Elevate your gaming experience with the perfect blend of style, functionality, and comfort.',
      price: 900.99,
      score: 4.5,
      images: [
        AppAsset.ergonomicGamingDesk1,
        AppAsset.ergonomicGamingDesk2,
        AppAsset.ergonomicGamingDesk3,
        AppAsset.ergonomicGamingDesk4,
        AppAsset.ergonomicGamingDesk5,
      ],
      // colors: <PeripheralColor>[
      //   PeripheralColor(color: const Color(0xFF5d4037), isSelected: true),
      //   PeripheralColor(color: const Color(0xFF424242)),
      // ],
    ),
    Peripheral(
      id: '3',
      quantity: 1,
      isFavorite: false,
      title: 'Pulsefire Dart - Wireless Gaming Mouse',
      description:
          'Elevate your gaming with the Pulsefire Dart Wireless Gaming Mouse. Enjoy the freedom of 2.4GHz wireless connectivity for seamless,'
          'lag-free play. Featuring the precision Pixart 3389 sensor with up to 16,000 DPI, customizable settings, and ergonomic design with'
          'padded grips for comfort during long sessions. The adjustable RGB lighting adds a personal touch, while the 50-hour battery life and '
          'Qi wireless charging keep you powered up. Includes a USB cable for versatile use. Perfect for both casual and competitive gamers, the Pulsefire Dart combines performance, comfort, and style.',
      price: 50.99,
      score: 4.5,
      images: [
        AppAsset.hyperxPulsefireDesk1,
        AppAsset.hyperxPulsefireDesk2,
        AppAsset.hyperxPulsefireDesk3,
        AppAsset.hyperxPulsefireDesk4,
        AppAsset.hyperxPulsefireDesk5,
        AppAsset.hyperxPulsefireDesk6,
      ],
      // colors: <PeripheralColor>[
      //   PeripheralColor(color: const Color(0xFF616161), isSelected: true),
      //   PeripheralColor(color: const Color(0xFF212121)),
      // ],
    ),
    Peripheral(
      id: '4',
      quantity: 1,
      isFavorite: false,
      title: 'Fantech AGILE MP453 Size L Mousepad Gaming',
      description:
          'Enhance your gameplay with the Fantech AGILE MP453 Size L Mousepad. Designed for precision and speed,'
          'this large mousepad provides ample space for smooth, unrestricted movements. Its high-quality surface '
          'ensures accurate tracking, while the anti-slip base keeps it securely in place. Durable and easy to clean,'
          'the AGILE MP453 is perfect for gamers seeking both performance and comfort. Upgrade your setup with this essential gaming accessory!',
      price: 2.99,
      score: 3.8,
      images: [
        AppAsset.mousepadGaming1,
        AppAsset.mousepadGaming3,
        AppAsset.mousepadGaming4,
        AppAsset.mousepadGaming5,
        AppAsset.mousepadGaming6,
      ],
      // colors: <PeripheralColor>[
      //   PeripheralColor(color: const Color(0xFF455a64), isSelected: true),
      //   PeripheralColor(color: const Color(0xFF263238)),
      // ],
    ),
    Peripheral(
      id: '5',
      quantity: 1,
      isFavorite: false,
      title: 'Cloud Stinger - Comfortable Gaming Headsets',
      description:
          'Experience gaming in comfort with the Cloud Stinger Gaming Headset. Lightweight and ergonomically designed,'
          'it features memory foam ear cushions for long-lasting wear. The 50mm directional drivers deliver crisp,'
          'immersive sound, while the swivel-to-mute noise-cancellation microphone ensures clear communication. '
          'Perfect for long gaming sessions, the Cloud Stinger combines superior comfort and high-quality audio for an unbeatable gaming experience.',
      price: 98.69,
      score: 4.0,
      images: [
        AppAsset.hyperxCloudStinger1,
        AppAsset.hyperxCloudStinger2,
        AppAsset.hyperxCloudStinger3,
        AppAsset.hyperxCloudStinger4,
        AppAsset.hyperxCloudStinger5,
      ],
      // colors: <PeripheralColor>[
      //   PeripheralColor(color: const Color(0xFF5d4037), isSelected: true),
      //   PeripheralColor(color: const Color(0xFF455a64)),
      // ],
    ),
    Peripheral(
      id: '6',
      quantity: 1,
      isFavorite: false,
      title: 'VORTEXSERIES S SERIES GAMING CHAIR',
      description:
          'The VortexSeries S Series Gaming Chair offers unparalleled comfort and support for avid gamers. Featuring ergonomic design,'
          'adjustable armrests, lumbar support, and a reclining backrest, this chair ensures optimal posture during long gaming sessions.'
          'Built with high-quality materials and a sleek, modern aesthetic, the VortexSeries S Series is the ultimate addition to any gaming setup.',
      price: 113.42,
      score: 4.2,
      images: [
        AppAsset.vortexChairSeries1,
        AppAsset.vortexChairSeries2,
        AppAsset.vortexChairSeries3,
        AppAsset.vortexChairSeries4,
        AppAsset.vortexChairSeries5,
        AppAsset.vortexChairSeries6,
        AppAsset.vortexChairSeries7,
      ],
      // colors: <PeripheralColor>[
      //   PeripheralColor(color: const Color(0xFF5d4037), isSelected: true),
      //   PeripheralColor(color: const Color(0xFF455a64)),
      // ],
    ),
  ];

  static List<BottomNavigationItem> bottomNavigationItems = [
    const BottomNavigationItem(Icon(Icons.home), 'Home'),
    const BottomNavigationItem(
        Icon(Icons.add_shopping_cart_rounded), 'Shopping cart'),
    const BottomNavigationItem(Icon(Icons.bookmark), 'Favorite'),
  ];
}

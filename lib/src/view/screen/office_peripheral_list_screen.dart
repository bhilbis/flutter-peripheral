import 'package:flutter/material.dart';
import 'package:flutter_peripheral/core/app_data.dart';
import 'package:flutter_peripheral/core/app_style.dart';
import 'package:flutter_peripheral/src/model/peripheral.dart';
import 'package:flutter_peripheral/src/view/widget/peripheral_list_view.dart';
import 'package:flutter_peripheral/src/view/screen/office_peripheral_detail_screen.dart';

class OfficePeripheralListScreen extends StatelessWidget {
  const OfficePeripheralListScreen({super.key});

  PreferredSize _appBar() {
    return PreferredSize(
      preferredSize: const Size.fromHeight(105),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Hello Bilbis", style: h2Style),
                  Text("Buy Your favorite desk Here", style: h3Style),
                ],
              ),
              // IconButton(onPressed: () {}, icon: const Icon(Icons.menu))
            ],
          ),
        ),
      ),
    );
  }

  Widget _searchBar() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 30),
      child: TextField(
        decoration: InputDecoration(
          hintText: 'Search',
          prefixIcon: const Icon(Icons.search, color: Colors.grey),
          suffixIcon: const Icon(Icons.menu, color: Colors.grey),
          contentPadding: const EdgeInsets.all(20),
          border: textFieldStyle,
          focusedBorder: textFieldStyle,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Future<Widget?> navigate(Peripheral peripheral) {
      return Navigator.push(
        context,
        PageRouteBuilder(
          transitionDuration: const Duration(seconds: 1),
          pageBuilder: (_, __, ___) =>
              OfficePeripheralDetailScreen(peripheral: peripheral),
        ),
      );
    }

    return Scaffold(
      appBar: _appBar(),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: ListView(
          children: [
            _searchBar(),
            PeripheralListView(
              peripheralList: AppData.peripheralList,
              onTap: navigate,
            ),
            const Text("Popular", style: h2Style),
            PeripheralListView(
              peripheralList: AppData.peripheralList,
              isHorizontal: false,
              onTap: navigate,
            ),
          ],
        ),
      ),
    );
  }
}

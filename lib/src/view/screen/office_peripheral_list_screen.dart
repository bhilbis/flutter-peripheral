import 'package:flutter/material.dart';
import 'package:flutter_peripheral/core/app_data.dart';
import 'package:flutter_peripheral/core/app_style.dart';
import 'package:flutter_peripheral/src/model/peripheral.dart';
import 'package:flutter_peripheral/src/view/widget/peripheral_list_view.dart';
import 'package:flutter_peripheral/src/view/screen/office_peripheral_detail_screen.dart';
import 'package:get/get.dart';
import 'package:flutter_peripheral/src/controller/office_peripheral_controller.dart';
import 'package:firebase_auth/firebase_auth.dart';

class OfficePeripheralListScreen extends StatefulWidget {
  const OfficePeripheralListScreen({Key? key}) : super(key: key);

  @override
  _OfficePeripheralListScreenState createState() =>
      _OfficePeripheralListScreenState();
}

class _OfficePeripheralListScreenState
    extends State<OfficePeripheralListScreen> {
  late String username;

  @override
  void initState() {
    super.initState();
    username = ''; // Initialize the username variable
    fetchUserName();
  }

  Future<void> fetchUserName() async {
    final User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      setState(() {
        username = user.displayName ?? '';
      });
    }
  }

  PreferredSizeWidget _appBar() {
    return PreferredSize(
      preferredSize: const Size.fromHeight(105),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Hello $username", style: h2Style),
                  const Text("Buy Your favorite desk Here", style: h3Style),
                ],
              ),
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
          contentPadding: const EdgeInsets.all(20),
          border: textFieldStyle,
          focusedBorder: textFieldStyle,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Future<void> navigate(Peripheral peripheral) {
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
        child: GetBuilder<OfficePeripheralController>(
          builder: (controller) {
            return ListView(
              children: [
                _searchBar(),
                PeripheralListView(
                  peripheralList: AppData.peripheralList,
                  onTap: navigate,
                  onFavoriteToggle: (peripheral) {
                    controller.isFavoritePeripheral(peripheral);
                  },
                ),
                const Text("Popular", style: h2Style),
                PeripheralListView(
                  peripheralList: AppData.peripheralList,
                  isHorizontal: false,
                  onTap: navigate,
                  onFavoriteToggle: (peripheral) {
                    controller.isFavoritePeripheral(peripheral);
                  },
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

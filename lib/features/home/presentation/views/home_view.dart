import 'package:flutter/material.dart';
import 'package:pharmazon_web/constants.dart';
import 'package:pharmazon_web/features/home/presentation/views/widgets/add_item.dart';
import 'package:pharmazon_web/features/order/presentation/views/widgets/clients_view_body.dart';
import 'package:pharmazon_web/features/search/presentation/views/widgets/search_view_body.dart';
import 'package:pharmazon_web/features/settings/presentation/views/widgets/settings_view_body.dart';

import 'widgets/home_view_body.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int currentIndex = 0;
  final List<Widget> _pages = [
    const HomeViewBody(),
    const SearchViewBody(),
    const ClientsViewBody(),
    const AddItem(),
    const SettingsViewBody()
  ];

  PreferredSizeWidget? buildAppBar() {
    return MediaQuery.of(context).size.width > 640 ? null : AppBar(
      title: const Text('Pharmazon'),
    );
  }

  Widget? buildBottomNavigationBar() {
    return MediaQuery.of(context).size.width > 640
        ? null
        : Theme(
            data: ThemeData(
              canvasColor: kAppColor,
            ),
            child: BottomNavigationBar(
              backgroundColor: kAppColor,
              selectedItemColor: Colors.black,
              unselectedItemColor: Colors.white,
              currentIndex: currentIndex,
              onTap: (index) {
                setState(() {
                  currentIndex = index;
                });
              },
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.search),
                  label: 'Search',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.shopping_cart),
                  label: 'Cart',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.add_box),
                  label: 'Add Item',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.settings),
                  label: 'Settings',
                ),
              ],
            ),
          );
  }

  Widget? buildDrawer() {
    return MediaQuery.of(context).size.width > 640
        ? Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width * .2,
            decoration: const BoxDecoration(
              color: kAppColor,
            ),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  buildDrawerItem(Icons.home, "Home", 0),
                  buildDrawerItem(Icons.search, "Search", 1),
                  buildDrawerItem(Icons.shopping_cart, "Orders", 2),
                  buildDrawerItem(Icons.add_box, "Add Item", 3),
                  buildDrawerItem(Icons.settings, "Settings", 4),
                ],
              ),
            ),
          )
        : null;
  }

  Widget buildDrawerItem(IconData icon, String title, int index) {
    return ListTile(
      onTap: () {
        setState(() {
          currentIndex = index;
        });
      },
      leading: Icon(
        icon,
        color: currentIndex == index ? Colors.black : Colors.white,
      ),
      contentPadding: const EdgeInsets.only(left: 40, top: 20, right: 40),
      title: Text(
        title,
        style: TextStyle(
            color: currentIndex == index ? Colors.black : Colors.white,
            fontSize: 20,
            overflow: TextOverflow.ellipsis),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      bottomNavigationBar: buildBottomNavigationBar(),
      body: Row(
        children: [
          buildDrawer() ?? Container(),
          _pages[currentIndex],
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:pharmazon_web/constants.dart';
import 'package:pharmazon_web/features/home/presentation/views/widgets/add_item.dart';
import 'package:pharmazon_web/features/order/presentation/views/widgets/clients_view_body.dart';
import 'package:pharmazon_web/features/search/presentation/views/widgets/search_view_body.dart';
import 'package:pharmazon_web/features/settings/presentation/views/widgets/settings_view_body.dart';
import 'package:pharmazon_web/generated/l10n.dart';

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
    return MediaQuery.of(context).size.width > 640
        ? null
        : AppBar(
            title: Text(S.of(context).pharmazon),
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
              items: [
                BottomNavigationBarItem(
                  icon: const Icon(Icons.home),
                  label: S.of(context).home,
                ),
                BottomNavigationBarItem(
                  icon: const Icon(Icons.search),
                  label: S.of(context).search,
                ),
                BottomNavigationBarItem(
                  icon: const Icon(Icons.shopping_cart),
                  label: S.of(context).orders,
                ),
                BottomNavigationBarItem(
                  icon: const Icon(Icons.add_box),
                  label: S.of(context).addItem,
                ),
                BottomNavigationBarItem(
                  icon: const Icon(Icons.settings),
                  label: S.of(context).settings,
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
                  buildDrawerItem(Icons.home, S.of(context).home, 0),
                  buildDrawerItem(Icons.search, S.of(context).search, 1),
                  buildDrawerItem(Icons.shopping_cart, S.of(context).orders, 2),
                  buildDrawerItem(Icons.add_box, S.of(context).addItem, 3),
                  buildDrawerItem(Icons.settings, S.of(context).settings, 4),
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

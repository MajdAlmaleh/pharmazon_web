import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:pharmazon_web/features/home/presentation/views/widgets/add_item.dart';
import 'package:pharmazon_web/features/order/presentation/views/widgets/clients_view_body.dart';
import 'package:pharmazon_web/features/search/presentation/views/widgets/search_view_body.dart';

import 'widgets/home_drawer.dart';
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
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        //       appBar: AppBar(),
        body: Row(
          children: [
            Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width * .2,
              decoration: BoxDecoration(
                  color: const Color(0xFF2AEBA4),
                  borderRadius: BorderRadius.circular(30)
                  // borderRadius: BorderRadius.only(
                  //     bottomRight: Radius.circular(30),
                  //     topRight: Radius.circular(30),
                  //     ),
                  ),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    ListTile(
                      onTap: () {
                        setState(() {
                          currentIndex = 0;
                        });
                      },
                      leading:  Icon(
                        Icons.home,
                        color: currentIndex==0?Colors.black :Colors.white,
                      ),
                      contentPadding:
                          const EdgeInsets.only(left: 40, top: 20, right: 40),
                      title:  Text(
                        "home",
                        style: TextStyle(
                            color: currentIndex==0?Colors.black :Colors.white,
                            fontSize: 20,
                            overflow: TextOverflow.ellipsis),
                      ),
                    ),
                    ListTile(
                      onTap: () {
                        setState(() {
                          currentIndex = 1;
                        });
                      },
                      leading:  Icon(
                        Icons.search,
                        color:currentIndex==1?Colors.black :Colors.white,
                      ),
                      contentPadding:
                          const EdgeInsets.only(left: 40, top: 20, right: 40),
                      title:  Text(
                        "Search",
                            overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            color:currentIndex==1?Colors.black :Colors.white,
                            fontSize: 20,
                            ),
                      ),
                    ),
                    ListTile(
                      onTap: () {
                        setState(() {
                          currentIndex = 2;
                        });
                      },
                      leading:  Icon(
                        Icons.shopping_cart,
                        color: currentIndex==2?Colors.black :Colors.white,
                      ),
                      contentPadding:
                          const EdgeInsets.only(left: 40, top: 20, right: 40),
                      title:  Text(
                        "Orders",
                        style: TextStyle(
                            color: currentIndex==2?Colors.black :Colors.white,
                            fontSize: 20,
                            overflow: TextOverflow.ellipsis),
                      ),
                    ),
                    ListTile(
                      onTap: () {
                        setState(() {
                          currentIndex = 3;
                        });
                      },
                      leading:  Icon(
                        Icons.add,
                        color:currentIndex==3?Colors.black :Colors.white,
                      ),
                      contentPadding:
                          const EdgeInsets.only(left: 40, top: 20, right: 40),
                      title:  Text(
                        "Add Item",
                        style: TextStyle(
                            color:currentIndex==3?Colors.black :Colors.white,
                            fontSize: 20,
                            overflow: TextOverflow.ellipsis),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            _pages[currentIndex],
          ],
        ),
        drawer: const HomeDrawrer());
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'widgets/home_drawer.dart';
import 'widgets/home_view_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar:  AppBar(
        title: const Text('classification'),
      ),
        body: const HomeViewBody(),
        drawer: const HomeDrawrer());
  }
}

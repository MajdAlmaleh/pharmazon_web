import 'package:flutter/material.dart';
import 'package:pharmazon_web/features/order/presentation/views/widgets/quantity_report.dart';
import 'package:pharmazon_web/features/order/presentation/views/widgets/sales_report.dart';
import 'package:pharmazon_web/features/order/presentation/views/widgets/tab_bar_widget.dart';

import 'all_clients.dart';

class ClientsViewBody extends StatefulWidget {
  const ClientsViewBody({
    super.key,
  });

  @override
  State<ClientsViewBody> createState() => _ClientsViewBodyState();
}

class _ClientsViewBodyState extends State<ClientsViewBody> {
  int bodyIndex = 0;

  final List<Widget> body = [
    const AllClients(),
    const SalesReport(),
    const QuantityReport(),
  ];

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          TabBarWidget(
              onTabChange: (value) => setState(() => bodyIndex = value)),
              body[bodyIndex]
        ],
      ),
    );
  }
}

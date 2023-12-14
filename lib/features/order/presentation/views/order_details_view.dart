import 'package:flutter/material.dart';
import 'package:pharmazon_web/features/order/data/models/date_model.dart';

import 'widgets/order_details_view_body.dart';

class OrderDetailsView extends StatelessWidget {
  final DateModel dateModel;
  const OrderDetailsView({super.key, required this.dateModel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(dateModel.date!),
      ),
      body: const OrderDetailsViewBody(),
    );
  }
}

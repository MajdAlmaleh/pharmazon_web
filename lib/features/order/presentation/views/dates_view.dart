import 'package:flutter/material.dart';
import 'package:pharmazon_web/features/order/data/models/client_model.dart';

import 'widgets/dates_view_body.dart';

class DatesView extends StatelessWidget {
  final ClientModel clientModel;
  const DatesView({super.key, required this.clientModel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Dates for ${clientModel.clientName} '),
        ),      
        body: const DatesViewBody());
  }
}

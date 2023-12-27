import 'package:flutter/material.dart';
import 'package:pharmazon_web/generated/l10n.dart';

import 'widgets/quantity_report_view_body.dart';

class QuantityReportView extends StatelessWidget {
  final String date;
  const QuantityReportView({super.key, required this.date});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${S.of(context).quantityReportOf} $date'),
      ),
      body: const QuantityReportViewBody(),
    );
  }
}

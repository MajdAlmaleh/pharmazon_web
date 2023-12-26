import 'package:flutter/material.dart';

import 'widgets/quantity_report_view_body.dart';

class QuantityReportView extends StatelessWidget {
  const QuantityReportView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: QuantityReportViewBody(),
    );
  }
}

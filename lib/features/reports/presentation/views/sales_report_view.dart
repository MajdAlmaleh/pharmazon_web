import 'package:flutter/material.dart';

import 'widgets/sales_report_view_body.dart';

class SalesReportView extends StatelessWidget {
  const SalesReportView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SalesReportViewBody(),
    );
  }
}

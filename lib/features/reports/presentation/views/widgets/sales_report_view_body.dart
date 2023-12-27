import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharmazon_web/core/widgets/custom_error.dart';
import 'package:pharmazon_web/core/widgets/custom_loading.dart';
import 'package:pharmazon_web/features/reports/presentation/manager/sales_cubit/sales_report_cubit.dart';
import 'package:pharmazon_web/features/reports/presentation/views/widgets/date_report_list_view_item.dart';
import 'package:pharmazon_web/generated/l10n.dart';

class SalesReportViewBody extends StatelessWidget {
  const SalesReportViewBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SalesReportCubit, SalesReportState>(
      builder: (context, state) {
        if (state is SalesReportLoading) {
          return const CustomLoading();
        }
        if (state is SalesReportFailure) {
          return CustomError(errMessage: state.errMessage);
        }
        if (state is SalesReportSuccess) {
          if (state.saleReportModel.orders!.isEmpty) {
            return CustomError(
                errMessage: S.of(context).thereIsNoMedicinesForThisMonth);
          }
          return Column(
            children: [
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Row(
                    children: [
                      const Spacer(),
                      Text(
                        S.of(context).totalPaidForThisMonth,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      const Spacer(),
                      Text(double.parse(
                              (state.saleReportModel.totalSales).toString())
                          .toString()),
                      const Spacer(),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: state.saleReportModel.orders!.length,
                  itemBuilder: (context, index) {
                    return DateReportListViewItem(
                      order: state.saleReportModel.orders![
                          state.saleReportModel.orders!.length - index - 1],
                    );
                  },
                ),
              ),
            ],
          );
        }
        return Container();
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharmazon_web/core/widgets/custom_error.dart';
import 'package:pharmazon_web/core/widgets/custom_loading.dart';
import 'package:pharmazon_web/features/reports/presentation/manager/sales_cubit/sales_report_cubit.dart';

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
          return Column(
            children: [
              Text(state.saleReportModel.totalSales.toString()),
              Expanded(
                  child: ListView.builder(
                itemCount: state.saleReportModel.orders!.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(state.saleReportModel.orders![index].createdAt
                        .toString()),
                  );
                },
              ))
            ],
          );
        }
        return Container();
      },
    );
  }
}

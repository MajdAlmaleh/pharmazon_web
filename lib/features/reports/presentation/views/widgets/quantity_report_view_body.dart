import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharmazon_web/core/widgets/custom_error.dart';
import 'package:pharmazon_web/core/widgets/custom_loading.dart';
import 'package:pharmazon_web/features/reports/presentation/manager/quantity_report_cubit/quantity_report_cubit.dart';

class QuantityReportViewBody extends StatelessWidget {
  const QuantityReportViewBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<QuantityReportCubit, QuantityReportState>(
      builder: (context, state) {
        if (state is QuantityReportLoading) {
          return const CustomLoading();
        }
        if (state is QuantityReportFailure) {
          return CustomError(errMessage: state.errMessage);
        }
        if (state is QuantityReportSuccess) {
          return Column(
            children: [
             
              Expanded(
                  child: ListView.builder(
                itemCount: state.quantityReport.data!.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title:  Text(state.quantityReport.data![index].commercialName.toString()),
                    trailing: Text(state.quantityReport.data![index].totalOrderedQuantity.toString()),
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
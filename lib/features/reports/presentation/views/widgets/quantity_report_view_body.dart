import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharmazon_web/core/widgets/custom_error.dart';
import 'package:pharmazon_web/core/widgets/custom_loading.dart';
import 'package:pharmazon_web/features/reports/presentation/manager/quantity_report_cubit/quantity_report_cubit.dart';
import 'package:pharmazon_web/generated/l10n.dart';

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

    if (state.quantityReport.data!.isEmpty) {
            return CustomError(
                errMessage: S.of(context).thereIsNoQuantitiesForThisMonth);
          }

          return Column(
            children: [
              Expanded(
                  child: ListView.builder(
                itemCount: state.quantityReport.data!.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      height: 60,
                      child: Card(
                        child: ListTile(
                          leading: const Icon(
                            Icons.medical_information,
                            color: Colors.black,
                            size: 40,
                          ),
                          title: Text(state
                              .quantityReport.data![index].commercialName
                              .toString(),style: TextStyle(fontWeight: FontWeight.bold),),
                          trailing: Text(state
                              .quantityReport.data![index].totalOrderedQuantity
                              .toString()),
                        ),
                      ),
                    ),
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

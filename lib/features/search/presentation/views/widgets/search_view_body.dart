import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:pharmazon_web/core/shared_models/medicine_model.dart';
import 'package:pharmazon_web/core/utils/app_router.dart';
import 'package:pharmazon_web/core/widgets/classification_item.dart';
import 'package:pharmazon_web/core/widgets/custom_error.dart';
import 'package:pharmazon_web/core/widgets/custom_loading.dart';
import 'package:pharmazon_web/features/search/presentation/manager/Classifications_search_cubit/classifications_search_cubit.dart';
import 'package:pharmazon_web/features/search/presentation/manager/commercial_name_cubit/commercial_name_search_cubit.dart';

final controller = TextEditingController();

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          SearchBar(
            controller: controller,
            leading: IconButton(
                // onPressed: () {
                //   if (controller.text.trim().isEmpty) {
                //     return;
                //   }
                //   BlocProvider.of<CommercialNameSearchCubit>(context)
                //       .searchByCommercialName(commercialName: controller.text);
                // },
                onPressed: () {
                  if (controller.text.trim().isEmpty) {
                    return;
                  }
                  BlocProvider.of<ClassificationsSearchCubit>(context)
                      .searchByClassifications(classification: controller.text);
                },
                icon: const Icon(Icons.abc)),
          ),
          // BlocBuilder<CommercialNameSearchCubit, CommercialNameSearchState>(
          //   builder: (context, state) {
          //     if (state is CommercialNameSearchLoading) {
          //       return const CustomLoading();
          //     }
          //     if (state is CommercialNameSearchFailure) {
          //       return CustomError(errMessage: state.errMessage);
          //     }
          //     if (state is CommercialNameSearchSuccess) {
          //       return Expanded(
          //         child: ListView.builder(
          //           itemCount: state.medicines.length,
          //           itemBuilder: (context, index) {
          //             return MedicineBubble(
          //               medicineModel: state.medicines[index],

          //               // return ClassificationItem(
          //               //     classificotionName:
          //               //         state.medicines[index].commercialName!);
          //             );
          //           },
          //         ),
          //       );
          //     }

          //     return const Text('data');
          //   },
          // )
          BlocBuilder<ClassificationsSearchCubit, ClassificationsSearchState>(
            builder: (context, state) {
              if (state is ClassificationsSearchLoading) {
                return const CustomLoading();
              }
              if (state is ClassificationsSearchFailure) {
                return  CustomError(errMessage: state.errMessage=='Your request not found, Please try later!'?'no data matches your search' : state.errMessage);
              }
              if (state is ClassificationsSearchSuccess) {
                return Expanded(
                  child: ListView.builder(
                    itemCount: state.classifications.length,
                    itemBuilder: (context, index) {
                      return ClassificationItem(
                          classificotionName:
                              state.classifications[index].clssification!);
                    },
                  ),
                );
              }

              return const Text('data');
            },
          )
        ],
      ),
    );
  }
}

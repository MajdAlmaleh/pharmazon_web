import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharmazon_web/core/widgets/custom_error.dart';
import 'package:pharmazon_web/core/widgets/custom_loading.dart';
import 'package:pharmazon_web/features/order/presentation/manager/dates_cubit/dates_cubit.dart';
import 'package:pharmazon_web/features/order/presentation/manager/order_details_cubit/order_details_cubit.dart';

class OrderDetailsViewBody extends StatelessWidget {
  const OrderDetailsViewBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        BlocBuilder<OrderDetailsCubit, OrderDetailsState>(
          builder: (context, state) {
            if (state is OrderDetailsLoading) {
              return const CustomLoading();
            }
            if (state is OrderDetailsFailure) {
              return CustomError(errMessage: state.errMessage);
            }
            if (state is OrderDetailsSuccess) {
              return Card(
                  child: Column(
                children: [
                  Text(state.orderDetailsModel.expireDate!)
                ],
              ));

          
            }
            return const Center(child: Text('there is no clients'));

            // return Expanded(
            //   child: ListView.builder(
            //     itemCount: 5,
            //     itemBuilder: (context, index) {
            //       return Card(
            //         child: ListTile(
            //           title: const Text('state.clients[index].clientName!'),
            //           onTap: () {
            //             //todo navigate to detalis
            //           //  context.go('location');
            //           },
            //         ),
            //       );
            //     },
            //   ),
            // );
          },
        ),
      ],
    );
  }
}

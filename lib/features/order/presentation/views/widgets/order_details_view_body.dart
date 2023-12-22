import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharmazon_web/core/widgets/custom_error.dart';
import 'package:pharmazon_web/core/widgets/custom_loading.dart';
import 'package:pharmazon_web/features/home/presentation/views/widgets/medicines_list_view.dart';
import 'package:pharmazon_web/features/order/presentation/manager/order_details_cubit/order_details_cubit.dart';
import 'package:pharmazon_web/features/order/presentation/manager/payment_cubit/payment_cubit.dart';
import 'package:pharmazon_web/features/order/presentation/manager/proccess_cubit/proccess_state_cubit.dart';

import 'stateful_button.dart';

class OrderDetailsViewBody extends StatefulWidget {
  const OrderDetailsViewBody({
    super.key,
  });

  @override
  State<OrderDetailsViewBody> createState() => _OrderDetailsViewBodyState();
}

class _OrderDetailsViewBodyState extends State<OrderDetailsViewBody> {
  var firstChange = false;

  String? finalState;
  String? finalPayment;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OrderDetailsCubit, OrderDetailsState>(
      builder: (context, state) {
        if (state is OrderDetailsLoading) {
          return const CustomLoading();
        }
        if (state is OrderDetailsFailure) {
          return CustomError(errMessage: state.errMessage);
        }
        if (state is OrderDetailsSuccess) {
          if (state.orderDetails.pharmaceuticals!.isEmpty) {
            return const Text('empty');
          }
          var orderState = state.orderDetails.order!.status;

          var orderPayment = state.orderDetails.order!.payment;

          if (!firstChange) {
            finalState = orderState;
            finalPayment = orderPayment;
            firstChange = true;
          }

          return Card(
              child: Column(
            children: [
              if (finalState == 'send')
                const Text(
                  'Order delivered successfully',
                  style: TextStyle(fontSize: 24, color: Colors.green),
                ),
              if (finalState == 'cancel')
                const Text(
                  'Order cancelled',
                  style: TextStyle(fontSize: 24, color: Colors.red),
                ),
              if (finalState != 'send' && finalState != 'cancel')
                Row(
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: ElevatedButton(
                          onPressed: null, child: Text("in process")),
                    ),
                    StatefulButton(
                      disableOnStates: const [
                        'in preparation',
                        'send',
                        'cancel'
                      ],
                      label: "in preparation",
                      finalState: finalState!,
                      toState: 'in preparation',
                      onPressed: () {
                        BlocProvider.of<ProccessStateCubit>(context)
                            .changeOrderState(
                                toState: 'in preparation',
                                id: state.orderDetails.order!.orderId
                                    .toString());
                      },
                    ),
                    StatefulButton(
                        disableOnStates: const ['send', 'cancel'],
                        label: "Sent",
                        finalState: finalState!,
                        toState: 'send',
                        onPressed: () {
                          setState(() {
                            finalState = 'send';
                          });
                          BlocProvider.of<ProccessStateCubit>(context)
                              .changeOrderState(
                                  toState: 'send',
                                  id: state.orderDetails.order!.orderId
                                      .toString());
                        }),
                    const Spacer(),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor: finalState == 'in process'
                                ? MaterialStateProperty.all(Colors.red)
                                : null,
                          ),
                          onPressed: finalState == 'in process'
                              ? () {
                                  BlocProvider.of<ProccessStateCubit>(context)
                                      .changeOrderState(
                                          toState: 'cancel',
                                          id: state.orderDetails.order!.orderId
                                              .toString());
                                  setState(() {
                                    finalState = 'cancel';
                                  });
                                }
                              : null,
                          child: const Text("cancel")),
                    ),
                  ],
                ),
              if (finalState != 'cancel')
                finalPayment == 'paid' || finalState == 'cancel'
                    ? const Text(
                        'Order payment done successfully',
                        style: TextStyle(fontSize: 20, color: Colors.green),
                      )
                    : Row(
                        children: [
                          const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: ElevatedButton(
                                onPressed: null, child: Text("un paid")),
                          ),

                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ElevatedButton(
                                onPressed: finalState != 'cancel' &&
                                        finalPayment == 'unpaid'
                                    ? () {
                                        setState(() {
                                          finalPayment = 'paid';
                                        });
                                        BlocProvider.of<PaymentCubit>(context)
                                            .changePayment(
                                                toState: 'paid',
                                                id: state
                                                    .orderDetails.order!.orderId
                                                    .toString());
                                      }
                                    : null,
                                child: const Text("paid")),
                          ),

                          // StatefulButton(
                          //     label: 'paid',
                          //     finalState: finalPayment!,
                          //     toState: 'paid',
                          //     onPressed:finalState== 'cancle'? null: () {
                          //       BlocProvider.of<PaymentCubit>(context).changePayment(
                          //           toState: 'paid',
                          //           id: state.orderDetails.order!.orderId.toString());
                          //     },
                          //     disableOnStates: const ['paid','cancel']),
                        ],
                      ),
              Expanded(
                  child: MedicinesListView(
                medicines: state.orderDetails.pharmaceuticals!,
                isOrder: true,
              )),
              const Text(
                '',
              ),
            ],
          ));
        }
        return const Center(child: Text('there is no clients'));
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:pharmazon_web/core/utils/app_router.dart';
import 'package:pharmazon_web/core/widgets/custom_error.dart';
import 'package:pharmazon_web/core/widgets/custom_loading.dart';
import 'package:pharmazon_web/features/order/presentation/manager/clients_cubit/clients_cubit.dart';
import 'package:pharmazon_web/generated/l10n.dart';

class ClientsViewBody extends StatefulWidget {
  const ClientsViewBody({
    super.key,
  });

  @override
  State<ClientsViewBody> createState() => _ClientsViewBodyState();
}

class _ClientsViewBodyState extends State<ClientsViewBody> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          BlocBuilder<ClientsCubit, ClientsState>(
            builder: (context, state) {
              if (state is ClientsLoading) {
                return const CustomLoading();
              }
              if (state is ClientsFailure) {
                return CustomError(errMessage: state.errMessage);
              }
              if (state is ClientsSuccess) {
                if (state.clients.isEmpty) {
                  return  Center(
                      child: Center(child: Text(S.of(context).thereIsNoClients)));
                }
    
                return Expanded(
                  child: ListView.builder(
                    itemCount: state.clients.length,
                    itemBuilder: (context, index) {
                      return Card(
                        child: ListTile(
                          title: Text(state.clients[index].clientName!),
                          onTap: () {
                            context.push(AppRouter.kDatesFromClient,
                                extra: state.clients[index]);
                          },
                        ),
                      );
                    },
                  ),
                );
              }
              return  Center(child: Text(S.of(context).thereIsNoClients));
    
        
            },
          ),
        ],
      ),
    );
  }
}

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:pharmazon_web/features/order/data/models/client_model.dart';
import 'package:pharmazon_web/features/order/data/repos/order_repo.dart';

part 'clients_state.dart';

class ClientsCubit extends Cubit<ClientsState> {
    final OrderRepo orderRepo;

  ClientsCubit(this.orderRepo) : super(ClientsInitial());


 Future<void> fetchClients() async {
    emit(ClientsLoading());

    final result = await orderRepo.getClients();

    result.fold((failure) {
      emit(ClientsFailure(errMessage: failure.errMessage));
    }, (clients) {
      emit(ClientsSuccess(clients));
    });
  }



}

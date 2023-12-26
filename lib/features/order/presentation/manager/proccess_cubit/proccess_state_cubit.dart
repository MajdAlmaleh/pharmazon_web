import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:pharmazon_web/features/order/data/repos/order_repo.dart';

part 'proccess_state_state.dart';

class ProccessStateCubit extends Cubit<ProccessStateState> {
  final OrderRepo orderRepo;

  ProccessStateCubit(this.orderRepo) : super(ProccessStateInitial());

  Future<void> changeOrderState(
      {required String toState, required String id}) async {
    emit(ProccessStateLoading());

    final result = await orderRepo.changeState(toState: toState, id: id);

    result.fold((failure) {
      emit(ProccessStateFailure(errMessage: failure.errMessage));
    }, (success) {
      emit(ProccessStateSuccess(success['message']));
    });
  }
}

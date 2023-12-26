import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:pharmazon_web/features/order/data/repos/order_repo.dart';

part 'payment_state.dart';

class PaymentCubit extends Cubit<PaymentState> {
  final OrderRepo orderRepo;
  PaymentCubit(this.orderRepo) : super(PaymentInitial());

  Future<void> changePayment(
      {required String toState, required String id}) async {
    emit(PaymentLoading());

    final result = await orderRepo.changePayment(toState: toState, id: id);

    result.fold((failure) {
      emit(PaymentFailure(errMessage: failure.errMessage));
    }, (success) {
      emit(PaymentSuccess(success['message']));
    });
  }
}

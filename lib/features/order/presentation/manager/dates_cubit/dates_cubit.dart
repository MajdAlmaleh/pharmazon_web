import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:pharmazon_web/features/order/data/models/client_model.dart';
import 'package:pharmazon_web/features/order/data/models/date_model.dart';
import 'package:pharmazon_web/features/order/data/repos/order_repo.dart';

part 'dates_state.dart';

class DatesCubit extends Cubit<DatesState> {
  final OrderRepo orderRepo;

  DatesCubit(this.orderRepo) : super(DatesInitial());

  Future<void> fetchDateFromClient({required ClientModel clientModel}) async {
    emit(DatesLoading());

    final result = await orderRepo.getDatesFromClient(clientModel: clientModel);

    result.fold((failure) {
      emit(DatesFailure(errMessage: failure.errMessage));
    }, (dates) {
      emit(DatesSuccess(dates));
    });
  }
}

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:pharmazon_web/features/home/data/repos/home_repo.dart';

part 'edit_quantity_state.dart';

class EditQuantityCubit extends Cubit<EditQuantityState> {
  final HomeRepo homeRepo;
  EditQuantityCubit(this.homeRepo) : super(EditQuantityInitial());

  Future<void> editQuantity(
      {required String id, required dynamic quantity}) async {
    emit(EditQuantityLoading());

    final result = await homeRepo.editQuantity(id: id, quantity: quantity);

    result.fold((failure) {
      emit(EditQuantityFailure(errMessage: failure.errMessage));
    }, (success) {
      emit(EditQuantitySuccess(success));
    });
  }
}

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:pharmazon_web/features/order/data/models/order/pharmaceutical.details.dart';
import 'package:pharmazon_web/features/home/data/repos/home_repo.dart';

part 'medicine_from_class_state.dart';

class MedicineFromClassCubit extends Cubit<MedicineFromClassState> {
  final HomeRepo homeRepo;
  MedicineFromClassCubit(this.homeRepo) : super(MedicineFromClassInitial());

  Future<void> fetchMedicineOfClassification(
      {required String classification}) async {
    emit(MedicineFromClassLoading());

    final result = await homeRepo.fetchMedicineOfClassification(
        classification: classification);

    result.fold((failure) {
      emit(MedicineFromClassFailure(errMessage: failure.errMessage));
    }, (medicines) {
      emit(MedicineFromClassSuccess(medicines));
    });
  }
}

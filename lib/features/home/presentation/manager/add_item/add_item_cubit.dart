import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:pharmazon_web/features/home/data/repos/home_repo.dart';

part 'add_item_state.dart';

class AddItemCubit extends Cubit<AddItemState> {
  AddItemCubit(this.homeRepo) : super(AddItemInitial());

  final HomeRepo homeRepo;

  Future<void> addMedicine(
      {required String scientificName,
      required String commerialName,
      required String calssification,
      required String manufactureCompany,
      required int quantityAvailable,
      required String expireDate,
      required int price}) async {
    emit(AddItemLoading());

    final result = await homeRepo.addMedicine(
      scientificName: scientificName,
      commerialName: commerialName,
      calssification: calssification,
      manufactureCompany: manufactureCompany,
      quantityAvailable: quantityAvailable,
      expireDate: expireDate,
      price: price,
      

    );
    result.fold((failure) {
      emit(AddItemFailure(errMessage: failure.errMessage));
    }, (success) {
      emit(AddItemSuccess(success['message']));
    });
  }
}

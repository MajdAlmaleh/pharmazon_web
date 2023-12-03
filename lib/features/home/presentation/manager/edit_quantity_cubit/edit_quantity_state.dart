part of 'edit_quantity_cubit.dart';

sealed class EditQuantityState extends Equatable {
  const EditQuantityState();

  @override
  List<Object> get props => [];
}

final class EditQuantityInitial extends EditQuantityState {}

final class EditQuantityLoading extends EditQuantityState {}

final class EditQuantityFailure extends EditQuantityState {
  final String errMessage;
  const EditQuantityFailure({required this.errMessage});
}

final class EditQuantitySuccess extends EditQuantityState {
  final MedicineModel editedMedicine;
  const EditQuantitySuccess(this.editedMedicine);
}
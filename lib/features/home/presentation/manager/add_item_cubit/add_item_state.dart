part of 'add_item_cubit.dart';

@immutable
sealed class AddItemState {}

final class AddItemInitial extends AddItemState {}

final class AddItemLoading extends AddItemState {}

final class AddItemFailure extends AddItemState {
  final String errMessage;
  AddItemFailure({required this.errMessage});
}

final class AddItemSuccess extends AddItemState {
  final String success;
  AddItemSuccess(this.success);
}

part of 'proccess_state_cubit.dart';

sealed class ProccessStateState extends Equatable {
  const ProccessStateState();

  @override
  List<Object> get props => [];
}

final class ProccessStateInitial extends ProccessStateState {}

final class ProccessStateLoading extends ProccessStateState {}

final class ProccessStateFailure extends ProccessStateState {
  final String errMessage;
  const ProccessStateFailure({required this.errMessage});
}

final class ProccessStateSuccess extends ProccessStateState {
  final String proccessState;

  const ProccessStateSuccess(this.proccessState);
}

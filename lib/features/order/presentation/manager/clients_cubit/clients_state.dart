part of 'clients_cubit.dart';

sealed class ClientsState extends Equatable {
  const ClientsState();

  @override
  List<Object> get props => [];
}

final class ClientsInitial extends ClientsState {}

final class ClientsLoading extends ClientsState {}

final class ClientsFailure extends ClientsState {
  final String errMessage;
  const ClientsFailure({required this.errMessage});
}

final class ClientsSuccess extends ClientsState {
  final List<ClientModel> clients;

  const ClientsSuccess(this.clients);
}

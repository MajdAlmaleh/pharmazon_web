part of 'payment_cubit.dart';

sealed class PaymentState extends Equatable {
  const PaymentState();

  @override
  List<Object> get props => [];
}

final class PaymentInitial extends PaymentState {}

final class PaymentLoading extends PaymentState {}

final class PaymentFailure extends PaymentState {
  final String errMessage;
  const PaymentFailure({required this.errMessage});
}


final class PaymentSuccess extends PaymentState {
 
  final String payment;


  const PaymentSuccess(this.payment);
}


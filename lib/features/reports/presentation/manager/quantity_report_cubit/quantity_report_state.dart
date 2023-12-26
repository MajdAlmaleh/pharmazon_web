part of 'quantity_report_cubit.dart';

sealed class QuantityReportState extends Equatable {
  const QuantityReportState();

  @override
  List<Object> get props => [];
}

final class QuantityReportInitial extends QuantityReportState {}

final class QuantityReportLoading extends QuantityReportState {}

final class QuantityReportFailure extends QuantityReportState {
  final String errMessage;
  const QuantityReportFailure({required this.errMessage});
}

final class QuantityReportSuccess extends QuantityReportState {
  final QuantityReport quantityReport;

  const QuantityReportSuccess(this.quantityReport);
}

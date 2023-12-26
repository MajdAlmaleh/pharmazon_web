import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:pharmazon_web/features/reports/data/models/sale_report_model/sale_report_model.dart';
import 'package:pharmazon_web/features/reports/data/repos/report_repo.dart';

part 'sales_report_state.dart';

class SalesReportCubit extends Cubit<SalesReportState> {
  final ReportRepo reportRepo;

  SalesReportCubit(this.reportRepo) : super(SalesReportInitial());

  Future<void> getSalesReportFromDate(
      {required int month, required int year}) async {
    emit(SalesReportLoading());

    final result =
        await reportRepo.getSalesReportFromDate(month: month, year: year);

    result.fold((failure) {
      emit(SalesReportFailure(errMessage: failure.errMessage));
    }, (salesReport) {
      emit(SalesReportSuccess(salesReport));
    });
  }
}

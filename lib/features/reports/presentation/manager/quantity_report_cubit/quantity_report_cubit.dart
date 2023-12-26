import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:pharmazon_web/features/reports/data/models/quantity_report/quantity_report.dart';
import 'package:pharmazon_web/features/reports/data/repos/report_repo.dart';

part 'quantity_report_state.dart';

class QuantityReportCubit extends Cubit<QuantityReportState> {
    final ReportRepo reportRepo;

  QuantityReportCubit(this.reportRepo) : super(QuantityReportInitial());


  Future<void> getQuantityReportFromDate(
      {required int month, required int year}) async {
    emit(QuantityReportLoading());

    final result =
        await reportRepo.getQuantityReportFromDate(month: month, year: year);

    result.fold((failure) {
      emit(QuantityReportFailure(errMessage: failure.errMessage));
    }, (quantityReport) {
      emit(QuantityReportSuccess(quantityReport));
    });
  }


}

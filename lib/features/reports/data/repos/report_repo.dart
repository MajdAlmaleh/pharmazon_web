import 'package:dartz/dartz.dart';
import 'package:pharmazon_web/core/errors/failures.dart';
import 'package:pharmazon_web/features/reports/data/models/quantity_report/quantity_report.dart';
import 'package:pharmazon_web/features/reports/data/models/sale_report_model/sale_report_model.dart';

abstract class ReportRepo {
  Future<Either<Failure, SaleReportModel>> getSalesReportFromDate(
      {required int month, required int year});
  Future<Either<Failure, QuantityReport>> getQuantityReportFromDate(
      {required int month, required int year});
}

import 'package:dartz/dartz.dart';
import 'package:pharmazon_web/core/errors/failures.dart';
import 'package:pharmazon_web/features/reports/data/models/sales_data.dart';

abstract class ReportRepo {
  Future<Either<Failure,  SalesData>> getOrderDetailsFromDate({required  int month,required int year});


}

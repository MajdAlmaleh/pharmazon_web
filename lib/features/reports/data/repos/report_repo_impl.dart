import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:pharmazon_web/blocs/token_cubit/token_cubit.dart';
import 'package:pharmazon_web/constants.dart';
import 'package:pharmazon_web/core/errors/failures.dart';
import 'package:pharmazon_web/core/utils/api_service.dart';
import 'package:pharmazon_web/features/reports/data/models/quantity_report/quantity_report.dart';
import 'package:pharmazon_web/features/reports/data/models/sale_report_model/sale_report_model.dart';
import 'package:pharmazon_web/features/reports/data/repos/report_repo.dart';

class ReportRepoImpl implements ReportRepo {
  final ApiService _apiService;
  final TokenCubit tokenCubit;

  ReportRepoImpl(this._apiService) : tokenCubit = GetIt.instance<TokenCubit>();

  @override
  Future<Either<Failure, SaleReportModel>> getSalesReportFromDate(
      {required int month, required int year}) async {
    try {
      final data = await _apiService
          .post(url: '$kBaseUrl/Report', token: tokenCubit.state, body: {
        "month": month,
        "year": year,
      });
      final salesData = SaleReportModel.fromJson(data);
      print(salesData);
      // for (var item in data['users']) {
      //   //clients.add(ClientModel.fromJson(item));
      // }

      return Right(salesData);
    } on Exception catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioException(e));
      }
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, QuantityReport>> getQuantityReportFromDate({required int month, required int year}) async{
     try {
      final data = await _apiService
          .post(url: '$kBaseUrl/quan-rep', token: tokenCubit.state, body: {
        "month": month,
        "year": year,
      });
      final salesData = QuantityReport.fromJson(data);
      print(salesData);
      // for (var item in data['users']) {
      //   //clients.add(ClientModel.fromJson(item));
      // }

      return Right(salesData);
    } on Exception catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioException(e));
      }
      return Left(ServerFailure(e.toString()));
    }
  }
}

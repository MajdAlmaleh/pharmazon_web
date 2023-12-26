import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:pharmazon_web/blocs/token_cubit/token_cubit.dart';
import 'package:pharmazon_web/constants.dart';
import 'package:pharmazon_web/core/errors/failures.dart';
import 'package:pharmazon_web/core/utils/api_service.dart';
import 'package:pharmazon_web/features/reports/data/models/sales_data.dart';
import 'package:pharmazon_web/features/reports/data/repos/report_repo.dart';

class ReportRepoImpl implements ReportRepo {
  final ApiService _apiService;
  final TokenCubit tokenCubit;

  ReportRepoImpl(this._apiService) : tokenCubit = GetIt.instance<TokenCubit>();

  @override
  Future<Either<Failure, SalesData>> getOrderDetailsFromDate(
      {required int month, required int year}) async {
    try {
      final data = await _apiService
          .post(url: '$kBaseUrl/salesReport', token: tokenCubit.state, body: {
        "month": month,
        "year": year,
      });
      SalesData salesData = data;
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

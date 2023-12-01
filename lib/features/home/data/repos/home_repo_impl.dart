import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:pharmazon_web/blocs/token_cubit/token_cubit.dart';
import 'package:pharmazon_web/constants.dart';
import 'package:pharmazon_web/core/errors/failures.dart';
import 'package:pharmazon_web/core/utils/api_service.dart';
import 'package:pharmazon_web/features/home/data/repos/home_repo.dart';

class HomeRepoImpl implements HomeRepo {
  final ApiService _apiService;
  final TokenCubit tokenCubit;

  HomeRepoImpl(this._apiService) : tokenCubit = GetIt.instance<TokenCubit>();
  @override
  Future<void> logOut() async {
    try {
      await _apiService.delete(
          urlEndPoint: '$kBaseUrl/logout',
          body: {
            'api_token': tokenCubit.state,
          },
          token: null

          // Replace with your token if needed
          );
      tokenCubit.deleteSavedToken();
    } on Exception catch (e) {
      print(e);
    }
  }

  @override
  Future<Either<Failure, Map<String, dynamic>>> addMedicine(
      {required String scientificName,
      required String commerialName,
      required String calssification,
      required String manufactureCompany,
      required int quantityAvailable,
      required String expireDate,
      required int price}) async {
    try {
      final response = await _apiService.post(
          url: '$kBaseUrl/store',
          body: {
            'scientific_name': scientificName,
            'commercial_name': commerialName,
            'calssification': calssification,
            'manufacture_company': manufactureCompany,
            'quantity_available': quantityAvailable,
            'expire_date': expireDate,
            'price': price,
          },
          token: tokenCubit.state);
      print(response);
      return right(response);
    } on Exception catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioException(e));
      }
      return Left(ServerFailure(e.toString()));
    }
  }
}

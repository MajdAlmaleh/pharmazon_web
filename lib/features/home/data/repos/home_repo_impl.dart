import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:pharmazon_web/blocs/token_cubit/token_cubit.dart';
import 'package:pharmazon_web/constants.dart';
import 'package:pharmazon_web/core/errors/failures.dart';
import 'package:pharmazon_web/core/shared_models/classifications_model.dart';
import 'package:pharmazon_web/features/order/data/models/order/pharmaceutical.details.dart';
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
          url: '$kBaseUrl/logout',
          body: {
            'api_token': tokenCubit.state,
          },
          token: tokenCubit.state

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
      return right(response);
    } on Exception catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioException(e));
      }
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<ClassificationsModel>>>
      fetchClassifications() async {
    //make the token with the token cubit
    await tokenCubit.fetchSavedToken();

    try {
      final data = await _apiService.get(
        url: '$kBaseUrl/getAll',
        token: tokenCubit.state,
      );
      List<ClassificationsModel> classifications = [];
      for (var item in data['classifications']) {
        classifications.add(ClassificationsModel(clssification: item));
      }

      return Right(classifications);
    } on Exception catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioException(e));
      }
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<Pharmaceutical>>> fetchMedicineOfClassification(
      {required String classification}) async {
    try {
      final data = await _apiService.post(
        url: '$kBaseUrl/getAllMedicine?calssification=$classification',
        token: tokenCubit.state,
        body: null,
      );
      List<Pharmaceutical> medicines = [];
      for (var item in data['medicines']) {
        medicines.add(Pharmaceutical.fromJson(item));
      }

      return Right(medicines);
    } on Exception catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioException(e));
      }
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, Map<String,dynamic>>> editQuantity(
      {required String id, required dynamic quantity}) async {
    try {
      final response = await _apiService.post(
          url: '$kBaseUrl/edit',
          body: {
            "id": id,
            "quantity": quantity,
          },
          token: tokenCubit.state);
//Pharmaceutical.fromJson(response['medicine'])
    //  String medicines =response ;

      return right(response);
    } on Exception catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioException(e));
      }
      return Left(ServerFailure(e.toString()));
    }
  }
}

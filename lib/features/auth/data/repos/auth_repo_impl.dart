import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:pharmazon_web/blocs/token_cubit/token_cubit.dart';
import 'package:pharmazon_web/constants.dart';
import 'package:pharmazon_web/core/errors/failures.dart';
import 'package:pharmazon_web/core/utils/api_service.dart';
import 'package:pharmazon_web/features/auth/data/repos/auth_repo.dart';
import 'package:universal_platform/universal_platform.dart';
class AuthRepoImpl implements AuthRepo {
  final ApiService _apiService;
  final TokenCubit tokenCubit = TokenCubit();
  AuthRepoImpl(this._apiService);

  @override
  Future<Either<Failure, Map<String, dynamic>>> signInWithEmailAndPassword(
      {required String phoneNumber, required String password}) async {

    try {
      final response = await _apiService.post(
        url: '$kBaseUrl/login',
        body: {
          'phone': phoneNumber,
          'password': password,
          'ispharmacy': UniversalPlatform.isAndroid,
          'iswarehouse': !UniversalPlatform.isAndroid,
        },
        token: null, // Replace with your token if needed
      );

      await tokenCubit.storeToken(response['token']);
      return right(response);
    } on Exception catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioException(e));
      }
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, Map<String, dynamic>>> signUpWithEmailAndPassword(
      {required String username,
      required String phoneNumber,
      required String password}) async {

    try {
      final response = await _apiService.post(
        url: '$kBaseUrl/signup', // Replace with your register endpoint
        body: {
          'name': username,
          'phone': phoneNumber,
          'password': password,
          'ispharmacy': UniversalPlatform.isAndroid,
          'iswarehouse': !UniversalPlatform.isAndroid,
        },
        token: null,
        // Replace with your token if needed
      );
      await tokenCubit.storeToken(response['token']);
      return right(response);
    } on Exception catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioException(e));
      }
      return Left(ServerFailure(e.toString()));
    }
  }
}

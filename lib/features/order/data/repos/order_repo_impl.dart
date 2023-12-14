import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:pharmazon_web/blocs/token_cubit/token_cubit.dart';
import 'package:pharmazon_web/constants.dart';
import 'package:pharmazon_web/core/errors/failures.dart';
import 'package:pharmazon_web/core/utils/api_service.dart';
import 'package:pharmazon_web/features/order/data/models/client_model.dart';
import 'package:pharmazon_web/features/order/data/models/date_model.dart';
import 'package:pharmazon_web/features/order/data/models/order_details_model.dart';
import 'package:pharmazon_web/features/order/data/repos/order_repo.dart';

class OrderRepoImpl implements OrderRepo {
  final ApiService _apiService;
  final TokenCubit tokenCubit;

  OrderRepoImpl(this._apiService) : tokenCubit = GetIt.instance<TokenCubit>();

  @override
  Future<Either<Failure, List<ClientModel>>> getClients() async {
    try {
      final data = await _apiService.get(
        url: '$kBaseUrl/getClients',
        token: tokenCubit.state,
        //  body: {"order": orderIgetClientstems}
      );
      List<ClientModel> clients = [];
      print(data);
      for (var item in data['users']) {
        clients.add(ClientModel.fromJson(item));
      }

      return Right(clients);
    } on Exception catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioException(e));
      }
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<DateModel>>> getDatesFromClient({required ClientModel clientModel}) async {
      try {
      final data = await _apiService.post(
        url: '$kBaseUrl/getDate',
        token: tokenCubit.state,
          body: {
            "id": clientModel.clientId
          }
      );
      List<DateModel> clients = [];
      print(data);
      for (var item in data['order_dates']) {
        clients.add(DateModel.fromJson(item));
      }

      return Right(clients);
    } on Exception catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioException(e));
      }
      return Left(ServerFailure(e.toString()));
    }
  }
  
  @override
  Future<Either<Failure, OrderDetailsModel>> getOrderDetailsFromDate({required DateModel dateModel}) async{
        try {
      final data = await _apiService.post(
        url: '$kBaseUrl/getOrder',
        token: tokenCubit.state,
          body: {
            "date": dateModel.date
          }
      );
      OrderDetailsModel orderDetailsModel= OrderDetailsModel.fromJson(data['order']) ;
      print(data);   
      return Right(orderDetailsModel);
    } on Exception catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioException(e));
      }
      return Left(ServerFailure(e.toString()));
    }
  }
}

import 'package:dartz/dartz.dart';
import 'package:pharmazon_web/core/errors/failures.dart';
import 'package:pharmazon_web/features/order/data/models/client_model.dart';
import 'package:pharmazon_web/features/order/data/models/date_model.dart';
import 'package:pharmazon_web/features/order/data/models/order_details_model.dart';
//import 'package:pharmazon_web/features/order/data/models/order_item_model.dart';

abstract class OrderRepo {
  Future<Either<Failure,  List<ClientModel>>> getClients();
  Future<Either<Failure,  List<DateModel>>> getDatesFromClient({required ClientModel clientModel});
  Future<Either<Failure,  OrderDetailsModel>> getOrderDetailsFromDate({required  DateModel dateModel});

//Future<Either<Failure,String> > getOrders();
//List<OrderItemModel>

}

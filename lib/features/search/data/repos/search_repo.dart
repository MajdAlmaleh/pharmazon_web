import 'package:dartz/dartz.dart';
import 'package:pharmazon_web/core/errors/failures.dart';
import 'package:pharmazon_web/core/shared_models/classifications_model.dart';
import 'package:pharmazon_web/features/order/data/models/order/pharmaceutical.details.dart';

abstract class SearchRepo {
  Future<Either<Failure, List<ClassificationsModel>>> searchByClassifications(
      {required String classification});
  Future<Either<Failure, List<Pharmaceutical>>> searchByCommercialName(
      {required String commercialName});
}

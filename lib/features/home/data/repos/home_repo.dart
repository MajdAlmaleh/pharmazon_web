import 'package:dartz/dartz.dart';
import 'package:pharmazon_web/core/errors/failures.dart';
import 'package:pharmazon_web/core/shared_models/classifications_model.dart';
import 'package:pharmazon_web/features/order/data/models/order/pharmaceutical.details.dart';

abstract class HomeRepo {
  Future<void> logOut();
  Future<Either<Failure, Map<String, dynamic>>> addMedicine({
    required String scientificName,
    required String commerialName,
    required String calssification,
    required String manufactureCompany,
    required int quantityAvailable,
    required String expireDate,
    required int price,
  });
  Future<Either<Failure, List<ClassificationsModel>>> fetchClassifications();
  Future<Either<Failure, List<Pharmaceutical>>> fetchMedicineOfClassification(
      {required String classification});
  Future<Either<Failure, Map<String,dynamic>>> editQuantity(
      {required String id, required dynamic quantity});
}

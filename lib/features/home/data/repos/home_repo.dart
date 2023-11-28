import 'package:dartz/dartz.dart';
import 'package:pharmazon_web/core/errors/failures.dart';

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
}

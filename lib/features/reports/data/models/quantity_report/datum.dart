import 'package:equatable/equatable.dart';

class Datum extends Equatable {
  final int? id;
  final String? commercialName;
  final String? totalOrderedQuantity;

  const Datum({this.id, this.commercialName, this.totalOrderedQuantity});

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json['id'] as int?,
        commercialName: json['commercial_name'] as String?,
        totalOrderedQuantity: json['total_ordered_quantity'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'commercial_name': commercialName,
        'total_ordered_quantity': totalOrderedQuantity,
      };

  @override
  List<Object?> get props => [id, commercialName, totalOrderedQuantity];
}

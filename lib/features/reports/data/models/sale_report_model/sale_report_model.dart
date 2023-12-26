import 'package:equatable/equatable.dart';

import 'order.dart';

class SaleReportModel extends Equatable {
  final int? totalSales;
  final List<Order>? orders;

  const SaleReportModel({this.totalSales, this.orders});

  factory SaleReportModel.fromJson(Map<String, dynamic> json) {
    return SaleReportModel(
      totalSales: json['total_sales'] as int?,
      orders: (json['orders'] as List<dynamic>?)
          ?.map((e) => Order.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() => {
        'total_sales': totalSales,
        'orders': orders?.map((e) => e.toJson()).toList(),
      };

  @override
  List<Object?> get props => [totalSales, orders];
}


import 'package:equatable/equatable.dart';
import 'package:pharmazon_web/features/order/data/models/order/order.dart';

class SalesData extends Equatable {
  final int? totalSales;
  final List<OrderData>? orders;

  const SalesData({
    this.totalSales,
    this.orders,
  });

  factory SalesData.fromJson(Map<String, dynamic> json) {
    return SalesData(
      totalSales: json['total_sales'] as int?,
      orders: (json['orders'] as List<dynamic>?)
          ?.map((e) => OrderData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() => {
    'total_sales': totalSales,
    'orders': orders?.map((e) => e.toJson()).toList(),
  };

  @override
  List<Object?> get props {
    return [
      totalSales,
      orders,
    ];
  }
}
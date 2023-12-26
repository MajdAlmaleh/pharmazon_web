import 'package:flutter/material.dart';
import 'package:pharmazon_web/features/order/data/models/order/pharmaceutical.details.dart';
import 'package:pharmazon_web/core/widgets/medicine_bubble.dart';

class MedicinesListView extends StatelessWidget {
  final List<Pharmaceutical> medicines;
  final bool isOrder;

  const MedicinesListView({
    super.key,
    required this.medicines,
    this.isOrder = false,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: medicines.length,
      itemBuilder: (context, index) {
        return MedicineBubble(
          medicineModel: medicines[index],
          isOrder: isOrder,
        );
      },
    );
  }
}

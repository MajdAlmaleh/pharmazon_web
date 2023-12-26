import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pharmazon_web/features/order/data/models/order/pharmaceutical.details.dart';
import 'package:pharmazon_web/core/utils/app_router.dart';

class MedicineBubble extends StatelessWidget {
 final bool isOrder;
  const MedicineBubble({
    super.key,
    required this.medicineModel,
    this.isOrder=false
  });

  final Pharmaceutical medicineModel;

  @override
  Widget build(BuildContext context) {
    return
       

        Card(
          child: InkWell(
              onTap:isOrder?null: () {
          GoRouter.of(context)
              .push(AppRouter.kMedicineDetail, extra: medicineModel);
              },
              child: SizedBox(
          child: ListTile(
            leading: const Icon(
              Icons.medical_information,
              color: Colors.black,
              size: 40,
            ),
            trailing:isOrder?Text(medicineModel.pivot!.quantity.toString()): Text(medicineModel.price.toString()),
            title: Text(
              medicineModel.scientificName!,
              style: const TextStyle(color: Colors.black, fontSize: 20),
            ),
            subtitle: Text(
              medicineModel.commercialName!,
              style: const TextStyle(color: Colors.grey, fontSize: 10),
            ),
          ),
              ),
            ),
        );
  }
}

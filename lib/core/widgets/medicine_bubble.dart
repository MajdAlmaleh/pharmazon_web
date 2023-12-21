import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pharmazon_web/core/shared_models/medicine_model.dart';
import 'package:pharmazon_web/core/utils/app_router.dart';

class MedicineBubble extends StatelessWidget {
  const MedicineBubble({
    super.key,
    required this.medicineModel,
  });

  final MedicineModel medicineModel;

  @override
  Widget build(BuildContext context) {
    return
        //  Card(
        //   child: ListTile(
        //     leading: Text(medicineModel.price.toString()),
        //     title: Text(medicineModel.commercialName!),
        //     onTap: () {
        //       GoRouter.of(context)
        //           .push(AppRouter.kMedicineDetail, extra: medicineModel);
        //     },
        //   ),
        // );

        InkWell(
      onTap: () {
        GoRouter.of(context)
            .push(AppRouter.kMedicineDetail, extra: medicineModel);
      },
      child: SizedBox(
        height: 100,
        child: ListTile(
          leading: const Icon(
            Icons.medical_information,
            color: Colors.black,
            size: 40,
          ),
          trailing: Text(medicineModel.price.toString()),
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
    );
  }
}

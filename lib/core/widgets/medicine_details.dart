import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharmazon_web/core/shared_models/medicine_model.dart';
import 'package:pharmazon_web/features/home/presentation/manager/edit_quantity_cubit/edit_quantity_cubit.dart';

final controller = TextEditingController();

class MedicineDetails extends StatelessWidget {
  const MedicineDetails({super.key, required this.medicineModel});
  final MedicineModel medicineModel;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Card(
        child: Column(
          children: [
            Text(medicineModel.commercialName!),
            Text(medicineModel.calssification!),
            Text(medicineModel.expireDate!),
            Text(medicineModel.id.toString()),
            Text(medicineModel.price.toString()),
            Text(medicineModel.manufactureCompany!),
            Text(medicineModel.quantityAvailable.toString()),
            TextField(
              decoration: const InputDecoration(),
              controller: controller,
            ),
            FloatingActionButton(
              onPressed: () {
                controller.clear();
                BlocProvider.of<EditQuantityCubit>(context).editQuantity(
                    id: (medicineModel.id).toString(),
                    quantity: controller.text);
              },
              child: const Icon(Icons.abc_outlined),
            )
          ],
        ),
      ),
    ));
  }
}

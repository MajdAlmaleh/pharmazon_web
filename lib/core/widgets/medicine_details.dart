import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharmazon_web/features/order/data/models/order/pharmaceutical.details.dart';
import 'package:pharmazon_web/features/home/presentation/manager/edit_quantity_cubit/edit_quantity_cubit.dart';
import 'package:pharmazon_web/features/home/presentation/views/widgets/AddTextField.dart';

final controller = TextEditingController();

class MedicineDetails extends StatelessWidget {
  const MedicineDetails({super.key, required this.medicineModel});
  final Pharmaceutical medicineModel;
  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text('medicine details for ${medicineModel.commercialName}'),
      ),
      body: Center(
        child: Container(
          margin: EdgeInsets.only(left: screenWidth * 0.05),
          height: screenHeight * .7,
          width: screenWidth * .5,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(30),
              boxShadow: const [
                BoxShadow(
                    offset: Offset(20, 20),
                    blurRadius: 10,
                    color: Color(0xFF2AEBA4))
              ]),
          child: ListView(
            children: [
              Padding(
                padding: EdgeInsets.only(
                    right: screenWidth * 0.1, top: screenHeight * 0.05),
                child: Text(
                  style: const TextStyle(fontSize: 25, fontFamily: 'Pacifico'),
                  "Scientafic Name : ${medicineModel.scientificName}",
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    right: screenWidth * 0.1, top: screenHeight * 0.05),
                child: Text(
                  style: const TextStyle(fontSize: 25, fontFamily: 'Pacifico'),
                  "Commirical Name : ${medicineModel.commercialName}",
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    right: screenWidth * 0.1, top: screenHeight * 0.05),
                child: Text(
                  style: const TextStyle(fontSize: 25, fontFamily: 'Pacifico'),
                  "Company Name : ${medicineModel.manufactureCompany}",
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    right: screenWidth * 0.1, top: screenHeight * 0.05),
                child: Text(
                  style: const TextStyle(fontSize: 25, fontFamily: 'Pacifico'),
                  "Quntity : ${medicineModel.quantityAvailable}",
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    right: screenWidth * 0.1, top: screenHeight * 0.05),
                child: Text(
                  style: const TextStyle(fontSize: 25, fontFamily: 'Pacifico'),
                  "Date : ${medicineModel.expireDate}",
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    right: screenWidth * 0.1, top: screenHeight * 0.05),
                child: Text(
                  style: const TextStyle(fontSize: 25, fontFamily: 'Pacifico'),
                  "price : ${medicineModel.price}",
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    right: screenWidth * 0.1, top: screenHeight * 0.05),
                child: Text(
                  style: const TextStyle(fontSize: 25, fontFamily: 'Pacifico'),
                  "Classification : ${medicineModel.calssification}",
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    right: screenWidth * 0.1, top: screenHeight * 0.05),
                child: AddTextField(
                   textInputType: TextInputType.number,
                  controller: controller,
                  onTap: () {
                    BlocProvider.of<EditQuantityCubit>(context).editQuantity(
                        id: (medicineModel.id).toString(),
                        quantity: controller.text);
                    controller.clear();

                  },
                  hintext: 'Edit the quantity',
                ),
              ),
            ],
          ),
        ),
      ),

    );
  }
}

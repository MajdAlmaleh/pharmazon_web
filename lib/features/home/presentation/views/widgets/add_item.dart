import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharmazon_web/blocs/language_cubit/language_cubit.dart';
import 'package:pharmazon_web/core/utils/functions/custom_snack_bar.dart';
import 'package:pharmazon_web/core/widgets/auth_button.dart';
import 'package:pharmazon_web/core/widgets/custom_loading.dart';
import 'package:pharmazon_web/features/home/presentation/manager/add_item_cubit/add_item_cubit.dart';
import 'package:pharmazon_web/features/home/presentation/views/widgets/home_view_body.dart';
import 'package:pharmazon_web/generated/l10n.dart';

class AddItem extends StatelessWidget {
  const AddItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    late String scientificName;
late String commerialName;
late String calssification;
late String manufactureCompany;
late int quantityAvailable;
late String expireDate;
late int price;

    return Expanded(
      child: BlocConsumer<AddItemCubit, AddItemState>(
        listener: (context, state) {
          if (state is AddItemFailure) {
            customSnackBar(context, state.errMessage);
          }
          if (state is AddItemSuccess) {
            //TODO use toast
            customSnackBar(context, 'Added Successfully!');
          }
        },
        builder: (context, state) {
          if (state is AddItemLoading) {
            return const CustomLoading();
          }
          return Form(
            key: formKey,
            child: Column(
              children: [
                AuthButton(
                    onPressed: () {
                      BlocProvider.of<LanguageCubit>(context).changeLanguage();
                    },
                    text: S.of(context).language),
                TextFormField(
                  onSaved: (newValue) {
                    scientificName = newValue!;
                  },
                ),
                TextFormField(
                  onSaved: (newValue) {
                    commerialName = newValue!;
                  },
                ),
                TextFormField(
                  onSaved: (newValue) {
                    calssification = newValue!;
                  },
                ),
                TextFormField(
                  onSaved: (newValue) {
                    manufactureCompany = newValue!;
                  },
                ),
                TextFormField(
                  onSaved: (newValue) {
                    quantityAvailable = int.parse(newValue!);
                  },
                ),
                TextFormField(
                  onSaved: (newValue) {
                    expireDate = newValue!;
                  },
                ),
                TextFormField(
                  onSaved: (newValue) {
                    price = int.parse(newValue!);
                  },
                ),
                AuthButton(
                    onPressed: () {
                      formKey.currentState!.save();
                      BlocProvider.of<AddItemCubit>(context).addMedicine(
                          scientificName: scientificName,
                          commerialName: commerialName,
                          calssification: calssification,
                          manufactureCompany: manufactureCompany,
                          quantityAvailable: quantityAvailable,
                          expireDate: expireDate,
                          price: price);
                    },
                    text: 'add'),
              ],
            ),
          );
        },
      ),
    );
  }
}

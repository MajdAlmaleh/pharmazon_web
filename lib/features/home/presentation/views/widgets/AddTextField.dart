import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pharmazon_web/constants.dart';
import 'package:pharmazon_web/generated/l10n.dart';

class AddTextField extends StatelessWidget {
  final String hintext;
  final void Function() onTap;
  final TextInputType textInputType;
  final TextEditingController controller;

  const AddTextField(
      {super.key,
      required this.hintext,
      required this.onTap,
      required this.controller,
      required this.textInputType});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: TextFormField(
        controller: controller,
        keyboardType: textInputType,
        inputFormatters: [
          FilteringTextInputFormatter.allow(RegExp(r'^-?[0-9]*')),
        ],
        decoration: InputDecoration(
          hintText: hintext,
          label: Text(
            hintext,
            style: const TextStyle(color: Colors.grey),
          ),
          prefixIcon: IconButton(
            icon: const Icon(Icons.edit),
            color: kAppColor,
            onPressed: onTap,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(40),
            borderSide: const BorderSide(
              color: kAppColor,
              width: 2,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(40),
            borderSide: const BorderSide(
              color: kAppColor,
              width: 2,
            ),
          ),
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return S.of(context).pleaseEnterSomeText;
          }
          return null;
        },
      ),
    );
  }
}

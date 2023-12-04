import 'package:flutter/material.dart';
import 'package:pharmazon_web/features/auth/presentation/views/variables/variables.dart';
import 'package:pharmazon_web/features/auth/presentation/views/widgets/auth_text_field.dart';

class PasswordTextField extends StatelessWidget {
  const PasswordTextField({
    super.key,
    required this.viewPasswordState,
  });
  final void Function() viewPasswordState;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 40, right: 10, left: 10, bottom: 40),
      child: AuthTextField(
          obscureText: viewPassword,
          prefixIcon: const Icon(
            Icons.password,
            color: Color(0xFF2AEBA4),
          ),
          suffixIcon: IconButton(
            icon: Icon(
              viewPassword ?Icons.visibility_off: Icons.visibility  ,
              color: const Color(0xFF2AEBA4),
            ),
            onPressed: viewPasswordState,
          ),
          textInputType: TextInputType.visiblePassword,
          phoneNumberValidator: passwordValidator,
          onSave: (newValue) {
            password = newValue!;
          },
          formatter: passwordFormatter,
          hintText: "Enter your password"),
    );
  }
}

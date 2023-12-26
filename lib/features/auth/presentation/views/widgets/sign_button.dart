import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharmazon_web/core/widgets/auth_button.dart';
import 'package:pharmazon_web/features/auth/presentation/manager/auth_cubit/auth_cubit.dart';
import 'package:pharmazon_web/features/auth/presentation/views/variables/variables.dart';

class SignButton extends StatelessWidget {
  final String text;
  const SignButton({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 30, right: 30),
      child: AuthButton(
        onPressed: () {
          if (formKey.currentState!.validate()) {
            formKey.currentState!.save();
            if (isSignIn) {
              BlocProvider.of<AuthCubit>(context)
                  .signInWithEmailAndPassword(phoneNumber, password);
            } else {
              BlocProvider.of<AuthCubit>(context)
                  .signUpWithEmailAndPassword(phoneNumber, password, username);
            }
          }
        },
        text: text,
      ),
    );
  }
}

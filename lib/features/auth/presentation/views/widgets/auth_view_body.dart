import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:pharmazon_web/constants.dart';
import 'package:pharmazon_web/core/utils/app_router.dart';
import 'package:pharmazon_web/core/utils/assets.dart';
import 'package:pharmazon_web/core/utils/functions/custom_snack_bar.dart';
import 'package:pharmazon_web/core/widgets/auth_button.dart';
import 'package:pharmazon_web/core/widgets/custom_loading.dart';
import 'package:pharmazon_web/features/auth/presentation/manager/auth_cubit/auth_cubit.dart';
import 'package:pharmazon_web/features/auth/presentation/views/variables/variables.dart';
import 'package:pharmazon_web/features/auth/presentation/views/widgets/password_text_field.dart';
import 'package:pharmazon_web/features/auth/presentation/views/widgets/phone_number_text_field.dart';
import 'package:pharmazon_web/features/auth/presentation/views/widgets/sign_button.dart';
import 'package:pharmazon_web/features/auth/presentation/views/widgets/username_text_field.dart';

import 'auth_text_field.dart';

class AuthViewBody extends StatefulWidget {
  const AuthViewBody({
    super.key,
    required this.authType,
  });
  final String authType;
  @override
  State<AuthViewBody> createState() => _AuthViewBodyState();
}

class _AuthViewBodyState extends State<AuthViewBody> {
  @override
  void initState() {
    isSignIn = widget.authType == kSignIn ? true : false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocConsumer<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state is AuthSuccess) {
            GoRouter.of(context).push(AppRouter.kHomeView);
          }
          if (state is AuthFailure) {
            customSnackBar(context, state.errMessage);
          }
        },
        builder: (context, state) {
          if (state is AuthLoading) {
            return const CustomLoading();
          }
          return Row(
            children: [
              Container(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width * .3,
                  decoration: const BoxDecoration(color: Color(0xFF2AEBA4)),
                  child: Image.asset(AssetsData.authPic)),
              Padding(
                padding: EdgeInsets.only(
                    left: MediaQuery.of(context).size.width * .1),
                child: Container(
                  height: MediaQuery.of(context).size.height * .7,
                  width: MediaQuery.of(context).size.width * .5,
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
                        padding: const EdgeInsets.only(
                          top: 10,
                          bottom: 40,
                        ),
                        child: Text(
                          isSignIn ? 'Sign In' : 'Sign Up',
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                              color: Color(0xFF2AEBA4),
                              fontSize: 40,
                              fontWeight: FontWeight.bold,
                              fontFamily: "Pacifico"),
                        ),
                      ),
                      Form(
                        key: formKey,
                        child: Column(
                          children: [
                            if (!isSignIn) const UsernameTextField(),
                            const Padding(
                              padding: EdgeInsets.only(right: 10, left: 10),
                              child: PhoneNumberTextField(),
                            ),
                            PasswordTextField(viewPasswordState: () {
                              setState(() {
                                hidePassword = !hidePassword;
                              });
                            }),
                             SignButton(text: isSignIn ? 'Sign In' : 'Sign Up'),
                            Padding(
                              padding: const EdgeInsets.only(
                                top: 50,
                              ),
                              child: SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Text(
                                      "Do not have an account ?",
                                      style: TextStyle(fontSize: 20),
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          isSignIn = !isSignIn;
                                          formKey.currentState!.reset();
                                        });
                                      },
                                      child: Text(
                                        !isSignIn ? 'Sign In' : 'Sign Up',
                                        style: const TextStyle(
                                            color: Colors.green, fontSize: 20),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

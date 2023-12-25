import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pharmazon_web/constants.dart';
import 'package:pharmazon_web/core/utils/app_router.dart';
import 'package:pharmazon_web/core/utils/assets.dart';

import '../../../../core/widgets/auth_button.dart';

class WelcomeViewBody extends StatelessWidget {
  const WelcomeViewBody({super.key});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 30, top: 100),
      child: Row(
        children: [
          Container(
            width: MediaQuery.of(context).size.width * .4,
            height: MediaQuery.of(context).size.height * .7,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(50)),
            child:
                Image.asset(AssetsData.welcomePic),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * .4,
            height: MediaQuery.of(context).size.height * .7,
            child: Card(
              elevation: 20,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(23),
                side: const BorderSide(color: Colors.black, width: 2),
              ),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Welcome to pharmazon",
                      style: TextStyle(fontSize: 30, fontFamily: "Pacifico"),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 40, top: 60),
                      child: AuthButton(
                          onPressed: () {
                            GoRouter.of(context).push(
                              AppRouter.kAuthView,
                              extra: kSignIn,
                            );
                          },
                          text: kSignIn),
                    ),
                    AuthButton(
                        onPressed: () {
                          GoRouter.of(context).pushReplacement(
                              AppRouter.kAuthView,
                              extra: kSignUp);
                        },
                        text: kSignUp),
                  ]),
            ),
          ),
        ],
      ),
    );
  }
}

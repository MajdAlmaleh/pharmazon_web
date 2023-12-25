import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:pharmazon_web/blocs/language_cubit/language_cubit.dart';
import 'package:pharmazon_web/constants.dart';
import 'package:pharmazon_web/core/utils/api_service.dart';
import 'package:pharmazon_web/core/utils/app_router.dart';
import 'package:pharmazon_web/core/utils/service_locator.dart';
import 'package:pharmazon_web/features/home/data/repos/home_repo_impl.dart';
import 'package:pharmazon_web/generated/l10n.dart';

class SettingsViewBody extends StatefulWidget {
  const SettingsViewBody({super.key});

  @override
  SettingsViewBodyState createState() => SettingsViewBodyState();
}

class SettingsViewBodyState extends State<SettingsViewBody> {
  List<bool> isSelected = [true, false];
 
  @override
  Widget build(BuildContext context) {
    isSelected = [
    
      S.of(context).language == 'english',
      S.of(context).language == 'عربي'
    ];
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 20,
            ),
            const Text('Language:'),
            const SizedBox(
              height: 5,
            ),
            SizedBox(
              height: 3,
              width: MediaQuery.of(context).size.width * .4,
              child: Container(
                color: const Color.fromARGB(255, 5, 243, 151),
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            ToggleButtons(
              borderColor: const Color.fromARGB(255, 3, 228, 142),
              fillColor: const Color.fromARGB(255, 3, 228, 142),
              borderWidth: 2,
              selectedBorderColor: const Color.fromARGB(255, 3, 228, 142),
              selectedColor: Colors.white,
              borderRadius: BorderRadius.circular(0),
              onPressed: (int index) {
                setState(() {
                  for (int i = 0; i < isSelected.length; i++) {
                    isSelected[i] = i == index;
                  }
                });
                if (index == 1) {
                  BlocProvider.of<LanguageCubit>(context)
                      .changeLanguage(toLanguage: kArabic);
                } else if (index == 0) {
                  BlocProvider.of<LanguageCubit>(context)
                      .changeLanguage(toLanguage: kEnglish);
                }
                // BlocProvider.of<LanguageCubit>(context).changeLanguage();

                //     },
                //     text: S.of(context).language),
              },
              isSelected: isSelected,
              children: const <Widget>[
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text('English', style: TextStyle(fontSize: 16)),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text('Arabic', style: TextStyle(fontSize: 16)),
                ),
              ],
            ),
            const SizedBox(
              height: 50,
            ),
            const Text('Log out:'),
            const SizedBox(
              height: 5,
            ),
            SizedBox(
              height: 3,
              width: MediaQuery.of(context).size.width * .4,
              child: Container(
                color: const Color.fromARGB(255, 5, 243, 151),
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            ListTile(
              onTap: () {
                GoRouter.of(context).go(AppRouter.kWelcomeView);
                HomeRepoImpl(getIt<ApiService>()).logOut();
              },
              leading: const Icon(
                Icons.logout,
              ),
              title: const Text(
                'Logout',
                style: TextStyle(fontSize: 15),
              ),
            )
          ],
        ),
      ),
    );
  }
}

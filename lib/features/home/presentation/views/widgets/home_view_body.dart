import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:pharmazon_web/blocs/language_cubit/language_cubit.dart';
import 'package:pharmazon_web/core/utils/api_service.dart';
import 'package:pharmazon_web/core/utils/app_router.dart';
import 'package:pharmazon_web/core/utils/service_locator.dart';
import 'package:pharmazon_web/core/widgets/auth_button.dart';
import 'package:pharmazon_web/features/home/data/repos/home_repo_impl.dart';
import 'package:pharmazon_web/generated/l10n.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            AuthButton(
                onPressed: () async {
                  await HomeRepoImpl(getIt<ApiService>()).logOut();
                  // ignore: use_build_context_synchronously
                  GoRouter.of(context).go(AppRouter.kWelcomeView);
                },
                text: 'logout'),
            AuthButton(
                onPressed: () async {
                  BlocProvider.of<LanguageCubit>(context).changeLanguage();
                },
                text: S.of(context).language),
          ],
        ),
      ),
    );
  }
}

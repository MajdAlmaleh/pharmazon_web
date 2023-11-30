import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:go_router/go_router.dart';
import 'package:pharmazon_web/blocs/language_cubit/language_cubit.dart';
import 'package:pharmazon_web/blocs/token_cubit/token_cubit.dart';
import 'package:pharmazon_web/core/utils/app_router.dart';
import 'package:pharmazon_web/core/utils/service_locator.dart';
import 'package:pharmazon_web/generated/l10n.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setupServiceLocator();
final languageCubit = getIt<LanguageCubit>();
final tokenCubit = getIt<TokenCubit>();
  await Future.wait([languageCubit.loadLanguage(),tokenCubit.fetchSavedToken()]);

  final router =  AppRouter.setupRouter(tokenCubit.state);
  runApp(MultiBlocProvider(
    providers: [  BlocProvider(create:  (context) => getIt<LanguageCubit>()),BlocProvider(create:  (context) => getIt<TokenCubit>())],
   
    child: Pharmazon(
      router: router,
    ),
  ));
}

class Pharmazon extends StatelessWidget {
  const Pharmazon({super.key, required this.router});
  final GoRouter router;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LanguageCubit, String>(
      builder: (context, state) {
        return MaterialApp.router(
          locale: Locale(state),
          localizationsDelegates: const [
            S.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: S.delegate.supportedLocales,
          routerConfig: router,
          debugShowCheckedModeBanner: false,
        );
      },
    );
  }
}

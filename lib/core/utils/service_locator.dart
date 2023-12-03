import 'package:get_it/get_it.dart';
import 'package:dio/dio.dart';
import 'package:pharmazon_web/blocs/language_cubit/language_cubit.dart';
import 'package:pharmazon_web/blocs/token_cubit/token_cubit.dart';
import 'package:pharmazon_web/core/utils/api_service.dart';
import 'package:pharmazon_web/features/auth/data/repos/auth_repo_impl.dart';
import 'package:pharmazon_web/features/home/data/repos/home_repo_impl.dart';
import 'package:pharmazon_web/features/search/data/repos/search_repo_impl.dart';

GetIt getIt = GetIt.instance;

void setupServiceLocator() {
 getIt.registerLazySingleton<Dio>(() => Dio());
 getIt.registerLazySingleton<ApiService>(() => ApiService(getIt<Dio>()));
 getIt.registerLazySingleton<AuthRepoImpl>(
     () => AuthRepoImpl(getIt<ApiService>()));
  getIt.registerLazySingleton<HomeRepoImpl>(
      () => HomeRepoImpl(getIt<ApiService>()));
        getIt.registerLazySingleton<SearchRepoImpl>(
      () => SearchRepoImpl(getIt<ApiService>()));
      getIt.registerLazySingleton<TokenCubit>(() => TokenCubit());
      getIt.registerLazySingleton<LanguageCubit>(() => LanguageCubit());
}

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:pharmazon_web/features/order/data/models/order/pharmaceutical.details.dart';
import 'package:pharmazon_web/core/utils/service_locator.dart';
import 'package:pharmazon_web/core/widgets/medicine_details.dart';
import 'package:pharmazon_web/features/auth/data/repos/auth_repo_impl.dart';
import 'package:pharmazon_web/features/auth/presentation/manager/auth_cubit/auth_cubit.dart';
import 'package:pharmazon_web/features/auth/presentation/views/auth_view.dart';
import 'package:pharmazon_web/features/home/data/repos/home_repo_impl.dart';
import 'package:pharmazon_web/features/home/presentation/manager/add_item_cubit/add_item_cubit.dart';
import 'package:pharmazon_web/features/home/presentation/manager/classifications_cubit/classifications_cubit.dart';
import 'package:pharmazon_web/features/home/presentation/manager/edit_quantity_cubit/edit_quantity_cubit.dart';
import 'package:pharmazon_web/features/home/presentation/manager/medicine_from_class_cubit/medicine_from_class_cubit.dart';
import 'package:pharmazon_web/features/home/presentation/views/home_view.dart';
import 'package:pharmazon_web/features/home/presentation/views/medicines_view.dart';
import 'package:pharmazon_web/features/order/data/models/client_model.dart';
import 'package:pharmazon_web/features/order/data/models/date_model.dart';
import 'package:pharmazon_web/features/order/data/repos/order_repo_impl.dart';
import 'package:pharmazon_web/features/order/presentation/manager/clients_cubit/clients_cubit.dart';
import 'package:pharmazon_web/features/order/presentation/manager/payment_cubit/payment_cubit.dart';
import 'package:pharmazon_web/features/order/presentation/manager/proccess_cubit/proccess_state_cubit.dart';
import 'package:pharmazon_web/features/order/presentation/manager/dates_cubit/dates_cubit.dart';
import 'package:pharmazon_web/features/order/presentation/manager/order_details_cubit/order_details_cubit.dart';
import 'package:pharmazon_web/features/order/presentation/views/clinets_view.dart';
import 'package:pharmazon_web/features/order/presentation/views/dates_view.dart';
import 'package:pharmazon_web/features/order/presentation/views/order_details_view.dart';
import 'package:pharmazon_web/features/search/data/repos/search_repo_impl.dart';
import 'package:pharmazon_web/features/search/presentation/manager/Classifications_search_cubit/classifications_search_cubit.dart';
import 'package:pharmazon_web/features/search/presentation/manager/commercial_name_cubit/commercial_name_search_cubit.dart';
import 'package:pharmazon_web/features/search/presentation/views/search_view.dart';
import 'package:pharmazon_web/features/welcome/views/welcome_view.dart';

abstract class AppRouter {
  static const kWelcomeView = '/welcomeView';
  static const kAuthView = '/authView';
  static const kHomeView = '/HomeView';
  static const kMedicinesView = '/medicinesView';

  static const kSearchView = '/searchView';
  static const kMedicineDetail = '/medicineDetail';
  static const kClientsOrders = '/clientsOrders';
  static const kDatesFromClient = '/datesFromClient';
  static const kOrderDetailsFromDate = '/orderDetailsFromDate';

  static GoRouter setupRouter(String? token) {
    // Create storage

    return GoRouter(routes: [
      if (token == null)
        GoRoute(
          path: '/',
          builder: (context, state) => const WelcomeView(),
        ),
      if (token != null)
        GoRoute(
          path: '/',
          builder: (context, state) => MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) => AddItemCubit(getIt<HomeRepoImpl>()),
              ),
              BlocProvider(
                  create: (context) =>
                      ClassificationsCubit(getIt<HomeRepoImpl>())
                        ..fetchClassifications()),
              BlocProvider(
                  create: (context) =>
                      MedicineFromClassCubit(getIt<HomeRepoImpl>())),
              BlocProvider(
                create: (context) => ClassificationsSearchCubit(
                  getIt<SearchRepoImpl>(),
                ),
              ),
              BlocProvider(
                create: (context) => CommercialNameSearchCubit(
                  getIt<SearchRepoImpl>(),
                ),
              ),
              BlocProvider(
                create: (context) =>
                    ClientsCubit(getIt<OrderRepoImpl>())..fetchClients(),
              ),
            ],
            child: const HomeView(),
          ),
        ),
      GoRoute(
        path: kWelcomeView,
        builder: (context, state) => const WelcomeView(),
      ),
      GoRoute(
        path: kAuthView,
        builder: (context, state) => BlocProvider(
          create: (context) => AuthCubit(getIt<AuthRepoImpl>()),
          child: AuthView(
            authType: state.extra as String,
          ),
        ),
      ),
      GoRoute(
        path: kHomeView,
        builder: (context, state) => MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) => AddItemCubit(getIt<HomeRepoImpl>()),
            ),
            BlocProvider(
                create: (context) => ClassificationsCubit(getIt<HomeRepoImpl>())
                  ..fetchClassifications()),
            BlocProvider(
                create: (context) =>
                    MedicineFromClassCubit(getIt<HomeRepoImpl>())),
            BlocProvider(
              create: (context) => ClassificationsSearchCubit(
                getIt<SearchRepoImpl>(),
              ),
            ),
            BlocProvider(
              create: (context) => CommercialNameSearchCubit(
                getIt<SearchRepoImpl>(),
              ),
            ),
            BlocProvider(
              create: (context) =>
                  ClientsCubit(getIt<OrderRepoImpl>())..fetchClients(),
            ),
          ],
          child: const HomeView(),
        ),
      ),
      GoRoute(
        path: kSearchView,
        builder: (context, state) => MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) => ClassificationsSearchCubit(
                getIt<SearchRepoImpl>(),
              ),
            ),
            BlocProvider(
              create: (context) => CommercialNameSearchCubit(
                getIt<SearchRepoImpl>(),
              ),
            ),
          ],
          child: const SearchView(),
        ),
      ),
      GoRoute(
        path: kMedicineDetail,
        builder: (context, state) => BlocProvider(
          create: (context) => EditQuantityCubit(
            getIt<HomeRepoImpl>(),
          ),
          child: MedicineDetails(
            medicineModel: state.extra as Pharmaceutical,
          ),
        ),
      ),
      GoRoute(
        path: kMedicinesView,
        builder: (context, state) => BlocProvider(
          create: (context) => MedicineFromClassCubit(getIt<HomeRepoImpl>()),
          child: MedicinesView(classificationName: state.extra as String),
        ),
      ),
      GoRoute(
        path: kMedicinesView,
        builder: (context, state) => BlocProvider(
          create: (context) => MedicineFromClassCubit(getIt<HomeRepoImpl>()),
          child: MedicinesView(classificationName: state.extra as String),
        ),
      ),
      GoRoute(
        path: kClientsOrders,
        builder: (context, state) => BlocProvider(
          create: (context) =>
              ClientsCubit(getIt<OrderRepoImpl>())..fetchClients(),
          child: const ClientsView(),
        ),
      ),
      GoRoute(
        path: kDatesFromClient,
        builder: (context, state) => BlocProvider(
          create: (context) => DatesCubit(getIt<OrderRepoImpl>())
            ..fetchDateFromClient(clientModel: state.extra as ClientModel),
          child: DatesView(
            clientModel: state.extra as ClientModel,
          ),
        ),
      ),
      GoRoute(
        path: kOrderDetailsFromDate,
        builder: (context, state) => MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) => OrderDetailsCubit(getIt<OrderRepoImpl>())
                ..fetchOrderDetailsFromDate(
                    dateModel: state.extra as DateModel),
            ),
            BlocProvider(
              create: (context) => ProccessStateCubit(getIt<OrderRepoImpl>()),
            ),
            BlocProvider(
              create: (context) => PaymentCubit(getIt<OrderRepoImpl>()),
            ),
          ],
          child: OrderDetailsView(
            dateModel: state.extra as DateModel,
          ),
        ),
      ),
    ]);
  }

  // static final router = GoRouter(routes: [
  //   GoRoute(
  //     path: '/',
  //     builder: (context, state) => const WelcomeView(),
  //   ),
  //   GoRoute(
  //     path: kAuthView,
  //     builder: (context, state) => BlocProvider(
  //       create: (context) => AuthCubit(getIt<AuthRepoImpl>()),
  //       child: AuthView(
  //         authType: state.extra as String,
  //       ),
  //     ),
  //   ),
  //   // GoRoute(
  //   //     path: kBookDetailsView,
  //   //     builder: (context, state) => BlocProvider(
  //   //           create: (context) => SimilarBooksCubit(getIt<HomeRepoImpl>()),
  //   //           child: BookDetailsView(
  //   //             bookModel: state.extra as BookModel,
  //   //           ),
  //   //         )),
  //   GoRoute(
  //     path: kHomeView,
  //     builder: (context, state) => const HomeView(),
  //   ),
  // ]);
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:pharmazon_web/blocs/language_cubit/language_cubit.dart';
import 'package:pharmazon_web/blocs/token_cubit/token_cubit.dart';
import 'package:pharmazon_web/core/utils/api_service.dart';
import 'package:pharmazon_web/core/utils/app_router.dart';
import 'package:pharmazon_web/core/utils/functions/custom_snack_bar.dart';
import 'package:pharmazon_web/core/utils/service_locator.dart';
import 'package:pharmazon_web/core/widgets/auth_button.dart';
import 'package:pharmazon_web/core/widgets/classification_item.dart';
import 'package:pharmazon_web/core/widgets/custom_error.dart';
import 'package:pharmazon_web/core/widgets/custom_loading.dart';
import 'package:pharmazon_web/core/widgets/medicine_bubble.dart';
import 'package:pharmazon_web/features/home/data/repos/home_repo_impl.dart';
import 'package:pharmazon_web/features/home/presentation/manager/add_item_cubit/add_item_cubit.dart';
import 'package:pharmazon_web/features/home/presentation/manager/classifications_cubit/classifications_cubit.dart';
import 'package:pharmazon_web/features/home/presentation/manager/medicine_from_class_cubit/medicine_from_class_cubit.dart';
import 'package:pharmazon_web/generated/l10n.dart';

final formKey = GlobalKey<FormState>();

class HomeViewBody extends StatefulWidget {
  const HomeViewBody({
    super.key,
  });

  @override
  State<HomeViewBody> createState() => _HomeViewBodyState();
}

late String scientificName;
late String commerialName;
late String calssification;
late String manufactureCompany;
late int quantityAvailable;
late String expireDate;
late int price;

class _HomeViewBodyState extends State<HomeViewBody> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<TokenCubit>(context).fetchSavedToken();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
       // AddItem(),
        AuthButton(
              onPressed: () {
                GoRouter.of(context).go(AppRouter.kWelcomeView);
                HomeRepoImpl(getIt<ApiService>()).logOut();
              },
              text: 'logout'),
          AuthButton(
              onPressed: () {
                GoRouter.of(context).push(AppRouter.kSearchView);
              },
              text: 'search'),
          BlocBuilder<ClassificationsCubit, ClassificationsState>(
            builder: (context, state) {
              if (state is ClassificationsLoading) {
                //todo make shimmer
                return const CustomLoading();
              }
              if (state is ClassificationsSuccess) {
                return Expanded(
                  child: ListView.builder(
                    itemCount: state.classifications.length,
                    itemBuilder: (context, index) {
                      return ClassificationItem(
                          classificotionName:
                              state.classifications[index].clssification!);
                    },
                  ),
                );
              }
              if (state is ClassificationsFailure) {
                return CustomError(errMessage: state.errMessage);
              }

              return Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
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
                          BlocProvider.of<LanguageCubit>(context)
                              .changeLanguage();
                        },
                        text: S.of(context).language),
                  ],
                ),
              );
            },
          ),
          BlocBuilder<MedicineFromClassCubit, MedicineFromClassState>(
            builder: (context, state) {
              if (state is MedicineFromClassLoading) {
                return const CustomLoading();
              }
              if (state is MedicineFromClassFailure) {
                return CustomError(
                  errMessage: state.errMessage,
                );
              }
              if (state is MedicineFromClassSuccess) {
                return Expanded(
                  child: ListView.builder(
                    itemCount: state.medicineFromClass.length,
                    itemBuilder: (context, index) {
                      return MedicineBubble(medicineModel: state.medicineFromClass[index]);
                    },
                  ),
                );
              }
              return Text('dallllllllllllllllllllta');
            },
          ),
      ],
    );
  }
}

class AddItem extends StatelessWidget {
  const AddItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AddItemCubit, AddItemState>(
      listener: (context, state) {
        if (state is AddItemFailure) {
          customSnackBar(context, state.errMessage);
        }
        if (state is AddItemSuccess) {
          //TODO use toast
          customSnackBar(context, 'Added Successfully!');
        }
      },
      builder: (context, state) {
        if (state is AddItemLoading) {
          return const CustomLoading();
        }
        return Form(
          key: formKey,
          child: Column(
            children: [
              AuthButton(
                  onPressed: () {
                    GoRouter.of(context).go(AppRouter.kWelcomeView);
                    HomeRepoImpl(getIt<ApiService>()).logOut();
                  },
                  text: 'logout'),
              AuthButton(
                  onPressed: () {
                    GoRouter.of(context).push(AppRouter.kSearchView);
                  },
                  text: 'search'),
              AuthButton(
                  onPressed: () {
                    BlocProvider.of<LanguageCubit>(context).changeLanguage();
                  },
                  text: S.of(context).language),
              TextFormField(
                onSaved: (newValue) {
                  scientificName = newValue!;
                },
              ),
              TextFormField(
                onSaved: (newValue) {
                  commerialName = newValue!;
                },
              ),
              TextFormField(
                onSaved: (newValue) {
                  calssification = newValue!;
                },
              ),
              TextFormField(
                onSaved: (newValue) {
                  manufactureCompany = newValue!;
                },
              ),
              TextFormField(
                onSaved: (newValue) {
                  quantityAvailable = int.parse(newValue!);
                },
              ),
              TextFormField(
                onSaved: (newValue) {
                  expireDate = newValue!;
                },
              ),
              TextFormField(
                onSaved: (newValue) {
                  price = int.parse(newValue!);
                },
              ),
              AuthButton(
                  onPressed: () {
                    formKey.currentState!.save();
                    BlocProvider.of<AddItemCubit>(context).addMedicine(
                        scientificName: scientificName,
                        commerialName: commerialName,
                        calssification: calssification,
                        manufactureCompany: manufactureCompany,
                        quantityAvailable: quantityAvailable,
                        expireDate: expireDate,
                        price: price);
                  },
                  text: 'add'),
            ],
          ),
        );
      },
    );
  }
}

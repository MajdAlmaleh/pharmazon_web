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
import 'package:pharmazon_web/core/widgets/custom_error.dart';
import 'package:pharmazon_web/core/widgets/custom_loading.dart';
import 'package:pharmazon_web/features/home/data/repos/home_repo_impl.dart';
import 'package:pharmazon_web/features/home/presentation/manager/add_item_cubit/add_item_cubit.dart';
import 'package:pharmazon_web/features/home/presentation/manager/classifications_cubit/classifications_cubit.dart';
import 'package:pharmazon_web/generated/l10n.dart';

import '../../../../../core/widgets/classifications_grid_view.dart';
import 'add_item.dart';

final formKey = GlobalKey<FormState>();

class HomeViewBody extends StatefulWidget {
  const HomeViewBody({
    super.key,
  });

  @override
  State<HomeViewBody> createState() => _HomeViewBodyState();
}


class _HomeViewBodyState extends State<HomeViewBody> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<TokenCubit>(context).fetchSavedToken();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
         // const AddItem(),
          BlocBuilder<ClassificationsCubit, ClassificationsState>(
            builder: (context, state) {
              if (state is ClassificationsLoading) {
                //todo make shimmer
                return const CustomLoading();
              }
              if (state is ClassificationsSuccess) {
                return Expanded(
                  child: ClassificationsGridView(
                    classifications: state.classifications,
                  ),
                );
              }
              if (state is ClassificationsFailure) {
                return CustomError(errMessage: state.errMessage);
              }

              return const Expanded(child: Text('There is no medicines')

                  // AuthButton(
                  //     onPressed: () async {
                  //       BlocProvider.of<LanguageCubit>(context)
                  //           .changeLanguage();
                  //     },
                  //     text: S.of(context).language),
                  );
            },
          ),
        ],
      ),
    );
  }
}

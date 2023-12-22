import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:pharmazon_web/features/order/data/models/order/pharmaceutical.details.dart';
import 'package:pharmazon_web/features/search/data/repos/search_repo.dart';

part 'commercial_name_search_state.dart';

class CommercialNameSearchCubit extends Cubit<CommercialNameSearchState> {
  final SearchRepo searchRepo;
  CommercialNameSearchCubit(this.searchRepo)
      : super(CommercialNameSearchInitial());

  Future<void> searchByCommercialName({required String commercialName}) async {
    emit(CommercialNameSearchLoading());

    final result =
        await searchRepo.searchByCommercialName(commercialName: commercialName);

    result.fold((failure) {
      emit(CommercialNameSearchFailure(errMessage: failure.errMessage));
    }, (medicines) {
      emit(CommercialNameSearchSuccess(medicines));
    });
  }
}

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_phasmohelper/items/items_state.dart';
import 'package:flutter_phasmohelper/models/items_model.dart';

class ItemsCubit extends Cubit<ItemsState> {
  ItemsCubit() : super(ItemsState(isLoading: true, error: null, itemsList: []));

  Future<void> loadInitialData() async {
    final stableState = state;
    try {
      emit(state.copyWith(isLoading: true));

      emit(state.copyWith(
          isLoading: false, itemsList: DatabaseItemsExtension.itemsList));
    } catch (error) {
      emit(state.copyWith(error: error.toString()));
      emit(stableState.copyWith(isLoading: false));
    }
  }
}

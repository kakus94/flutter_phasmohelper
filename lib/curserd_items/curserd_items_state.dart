import 'package:flutter_phasmohelper/models/items_model.dart';

class CurserdItemsState {
  final bool isLoading;
  final String? error;
  final List<ItemsModel> itemsList;

  CurserdItemsState({
    this.isLoading = false,
    this.error,
    required this.itemsList,
  });

  CurserdItemsState copyWith({
    bool? isLoading,
    String? error,
    List<ItemsModel>? itemsList,
  }) {
    return CurserdItemsState(
      isLoading: isLoading ?? this.isLoading,
      error: error ?? this.error,
      itemsList: itemsList ?? this.itemsList,
    );
  }
}

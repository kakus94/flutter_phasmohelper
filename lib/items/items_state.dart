import 'package:flutter_phasmohelper/models/items_model.dart';

class ItemsState {
  final bool isLoading;
  final String? error;
  final List<ItemsModel> itemsList;

  ItemsState({
    this.isLoading = false,
    this.error,
    required this.itemsList,
  });

  ItemsState copyWith({
    bool? isLoading,
    String? error,
    List<ItemsModel>? itemsList,
  }) {
    return ItemsState(
      isLoading: isLoading ?? this.isLoading,
      error: error ?? this.error,
      itemsList: itemsList ?? this.itemsList,
    );
  }
}

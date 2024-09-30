import 'package:flutter_phasmohelper/models/ghost/ghost_model.dart';

class MainState {
  final bool isLoading;
  final String? error;

  final List<GhostModel>? ghostList;

  MainState({
    this.isLoading = false,
    this.error,
    this.ghostList,
  });

  MainState copyWith({
    bool? isLoading,
    String? error,
    List<GhostModel>? ghostList,
  }) {
    return MainState(
      isLoading: isLoading ?? this.isLoading,
      error: error ?? this.error,
      ghostList: ghostList ?? this.ghostList,
    );
  }
}

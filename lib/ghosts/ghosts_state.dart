import 'package:flutter_phasmohelper/models/ghost/ghost_model.dart';

class GhostsState {
  final bool isLoading;
  final String? error;
  final List<GhostModel> ghostsList;

  const GhostsState({
    this.isLoading = false,
    this.error,
    this.ghostsList = const [],
  });

  GhostsState copyWith({
    bool? isLoading,
    String? error,
    List<GhostModel>? ghostsList,
  }) {
    return GhostsState(
      isLoading: isLoading ?? this.isLoading,
      error: error ?? this.error,
      ghostsList: ghostsList ?? this.ghostsList,
    );
  }
}

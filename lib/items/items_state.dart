class ItemsState {
	final bool isLoading;
	final String? error;
	  
	const ItemsState({
		this.isLoading = false,
		this.error,
	});
	  
	ItemsState copyWith({
		bool? isLoading,
		String? error,
	}) {
		return ItemsState(
			isLoading: isLoading ?? this.isLoading,
			error: error ?? this.error,
		);
	}
}

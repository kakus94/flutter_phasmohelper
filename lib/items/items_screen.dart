import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_phasmohelper/items/items_cubit.dart';
import 'package:flutter_phasmohelper/items/items_state.dart';

class ItemsScreen extends StatefulWidget {
  const ItemsScreen({Key? key}) : super(key: key);

  @override
  _ItemsScreenState createState() => _ItemsScreenState();
}

class _ItemsScreenState extends State<ItemsScreen> {
  final screenCubit = ItemsCubit();

  @override
  void initState() {
    screenCubit.loadInitialData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Items'),
      ),
      body: BlocConsumer<ItemsCubit, ItemsState>(
        bloc: screenCubit,
        listener: (BuildContext context, ItemsState state) {
          if (state.error != null) {}
        },
        builder: (BuildContext context, ItemsState state) {
          if (state.isLoading) {
            return Center(child: CircularProgressIndicator());
          }

          return Padding(
            padding: const EdgeInsets.only(top: 110),
            child: buildBody(state),
          );
        },
      ),
    );
  }

  Widget buildBody(ItemsState state) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView(
        children: [],
      ),
    );
  }
}

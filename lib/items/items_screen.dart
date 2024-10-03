import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_phasmohelper/items/item_detail_screen.dart';
import 'package:flutter_phasmohelper/items/items_cubit.dart';
import 'package:flutter_phasmohelper/items/items_state.dart';
import 'package:flutter_phasmohelper/share/app_background.dart';
import 'package:flutter_phasmohelper/share/flexible_space_app_bar.dart';

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
      extendBodyBehindAppBar: true,
      extendBody: true,
      appBar: AppBar(
        flexibleSpace: const FlexibleSpaceAppBar(),
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text('Items', style: TextStyle(color: Colors.white)),
      ),
      body: Container(
        decoration: AppBackground.background_1(),
        child: BlocConsumer<ItemsCubit, ItemsState>(
          bloc: screenCubit,
          listener: (BuildContext context, ItemsState state) {
            if (state.error != null) {}
          },
          builder: (BuildContext context, ItemsState state) {
            if (state.isLoading) {
              return const Center(child: CircularProgressIndicator());
            }

            return Padding(
              padding: const EdgeInsets.only(top: 110),
              child: buildBody(state),
            );
          },
        ),
      ),
    );
  }

  Widget buildBody(ItemsState state) {
    return ListView.builder(
      padding: const EdgeInsets.all(10),
      itemCount: state.itemsList.length,
      itemBuilder: (BuildContext context, int index) {
        return GestureDetector(
          child: Card(
            color: Theme.of(context).colorScheme.surface.withOpacity(0.6),
            child: ListTile(
              trailing: const Icon(Icons.chevron_right),
              title: Text(state.itemsList[index].name['pl'] ?? ""),
            ),
          ),
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (_) =>
                        ItemDetailScreen(model: state.itemsList[index])));
          },
        );
      },
    );
  }
}

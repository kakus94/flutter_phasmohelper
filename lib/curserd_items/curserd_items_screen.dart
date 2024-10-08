// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_phasmohelper/curserd_items/curserd_items_detail_screen.dart';
import 'package:flutter_phasmohelper/curserd_items/curserd_items_cubit.dart';
import 'package:flutter_phasmohelper/curserd_items/curserd_items_state.dart';
import 'package:flutter_phasmohelper/share/app_background.dart';
import 'package:flutter_phasmohelper/share/flexible_space_app_bar.dart';

class CurserdItemsScreen extends StatefulWidget {
  const CurserdItemsScreen({super.key});

  @override
  _CurserdItemsScreenState createState() => _CurserdItemsScreenState();
}

class _CurserdItemsScreenState extends State<CurserdItemsScreen> {
  final screenCubit = CurserdItemsCubit();

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
        child: BlocConsumer<CurserdItemsCubit, CurserdItemsState>(
          bloc: screenCubit,
          listener: (BuildContext context, CurserdItemsState state) {
            if (state.error != null) {}
          },
          builder: (BuildContext context, CurserdItemsState state) {
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

  Widget buildBody(CurserdItemsState state) {
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
                    builder: (_) => CurserdItemsDetailScreen(
                        model: state.itemsList[index])));
          },
        );
      },
    );
  }
}

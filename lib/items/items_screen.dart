import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_phasmohelper/items/items_cubit.dart';
import 'package:flutter_phasmohelper/items/items_state.dart';
import 'package:flutter_gen/gen_l10n/arb_localization.dart';
import 'package:flutter_phasmohelper/share/app_icon.dart';
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
    final titleApp = AppLocalizations.of(context)!.items;
    return Scaffold(
      extendBodyBehindAppBar: true,
      extendBody: true,
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        flexibleSpace: const FlexibleSpaceAppBar(),
        elevation: 0,
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: Text(
          titleApp,
          style: const TextStyle(
            fontSize: 26,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
      ),
      body: BlocConsumer<ItemsCubit, ItemsState>(
        bloc: screenCubit,
        listener: (BuildContext context, ItemsState state) {
          if (state.error != null) {
            // TODO your code here
          }
        },
        builder: (BuildContext context, ItemsState state) {
          if (state.isLoading) {
            return Center(child: CircularProgressIndicator());
          }

          return Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                alignment: Alignment.center,
                fit: BoxFit.fitHeight,
                image: AppIcon.background3.image,
              ),
            ),
            child: buildBody(state),
          );
        },
      ),
    );
  }

  Widget buildBody(ItemsState state) {
    return const Center(
      child: Text("IN PROGRESS",
          style: TextStyle(color: Colors.white, fontSize: 36)),
    );
  }
}

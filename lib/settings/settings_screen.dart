import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_phasmohelper/share/app_background.dart';
import 'package:flutter_phasmohelper/share/flexible_space_app_bar.dart';
import 'package:flutter_phasmohelper/settings/settings_cubit.dart';
import 'package:flutter_phasmohelper/settings/settings_state.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  final screenCubit = SettingsCubit();

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
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: Colors.transparent,
        flexibleSpace: const FlexibleSpaceAppBar(),
        centerTitle: false,
        title: const Text('Settings', style: TextStyle(color: Colors.white)),
      ),
      body: Container(
        decoration: AppBackground.background_1(),
        child: BlocConsumer<SettingsCubit, SettingsState>(
          bloc: screenCubit,
          listener: (BuildContext context, SettingsState state) {
            if (state.error != null) {}
          },
          builder: (BuildContext context, SettingsState state) {
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

  Widget buildBody(SettingsState state) {
    return ListView(
      padding: const EdgeInsets.all(10),
      children: const [
        Card(
          child: ListTile(
            title: Text("Example"),
          ),
        )
      ],
    );
  }
}

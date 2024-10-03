import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_phasmohelper/ghosts/ghost_details_view.dart';
import 'package:flutter_phasmohelper/share/app_background.dart';
import 'package:flutter_phasmohelper/ghosts/ghosts_cubit.dart';
import 'package:flutter_phasmohelper/ghosts/ghosts_state.dart';
import 'package:flutter_phasmohelper/share/flexible_space_app_bar.dart';

class GhostsScreen extends StatefulWidget {
  const GhostsScreen({Key? key}) : super(key: key);

  @override
  _GhostsScreenState createState() => _GhostsScreenState();
}

class _GhostsScreenState extends State<GhostsScreen> {
  final screenCubit = GhostsCubit();

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
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50.0),
        child: AppBar(
          flexibleSpace: const FlexibleSpaceAppBar(),
          iconTheme: const IconThemeData(color: Colors.white),
          elevation: 0,
          backgroundColor: Colors.transparent,
          title: const Text('Ghosts', style: TextStyle(color: Colors.white)),
        ),
      ),
      body: Container(
        decoration: AppBackground.background_1(),
        child: BlocConsumer<GhostsCubit, GhostsState>(
          bloc: screenCubit,
          listener: (BuildContext context, GhostsState state) {
            if (state.error != null) {}
          },
          builder: (BuildContext context, GhostsState state) {
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

  Widget buildBody(GhostsState state) {
    return ListView.builder(
      // shrinkWrap: true,
      padding: const EdgeInsets.all(10),
      itemCount: state.ghostsList.length,
      itemBuilder: (BuildContext context, int index) {
        return GestureDetector(
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => GhostDetailsView(ghost: state.ghostsList[index]),
            ),
          ),
          child: Card(
            color: Theme.of(context).colorScheme.surface.withOpacity(0.6),
            child: ListTile(
              trailing: const Icon(Icons.chevron_right),
              title: Text(state.ghostsList[index].name),
            ),
          ),
        );
      },
      // separatorBuilder: (context, index) => const SizedBox(height: 10),
    );
  }
}

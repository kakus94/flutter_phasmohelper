import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_phasmohelper/share/app_icon.dart';
import 'package:flutter_phasmohelper/share/flexible_space_app_bar.dart';
import 'package:flutter_phasmohelper/start/cubic/start_cubit.dart';
import 'package:flutter_phasmohelper/start/cubic/start_state.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_gen/gen_l10n/arb_localization.dart';

class StartScreen extends StatefulWidget {
  const StartScreen({Key? key}) : super(key: key);

  @override
  _StartScreenState createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {
  final screenCubit = StartCubit();

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
        elevation: 0,
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: const Text(
          "Phasmohelper",
          style: TextStyle(
            fontSize: 26,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
      ),
      body: BlocConsumer<StartCubit, StartState>(
        bloc: screenCubit,
        listener: (BuildContext context, StartState state) {
          if (state.error != null) {}
        },
        builder: (BuildContext context, StartState state) {
          if (state.isLoading) {
            return const Center(child: CircularProgressIndicator());
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

  Widget buildBody(StartState state) {
    final langStart = AppLocalizations.of(context)!.startGame;
    final langGhost = AppLocalizations.of(context)!.ghosts;
    final langItem = AppLocalizations.of(context)!.items;
    final langCurserd = AppLocalizations.of(context)!.curserdPosssession;
    final langSetting = AppLocalizations.of(context)!.settings;

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GridView.count(
        crossAxisCount: 2,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
        children: [
          _CardStart(text: langStart, namePush: 'main'),
          _CardStart(text: langGhost, namePush: 'ghosts'),
          _CardStart(text: langItem, namePush: 'curserdPosssession'),
          _CardStart(text: langCurserd, namePush: 'curserdPosssession'),
          _CardStart(text: langSetting, namePush: 'settings'),
        ],
      ),
    );
  }
}

class _CardStart extends StatelessWidget {
  const _CardStart({
    required this.text,
    required this.namePush,
  });

  final String text;
  final String namePush;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.goNamed(namePush),
      child: Card(
        color: Theme.of(context).colorScheme.surface.withOpacity(0.7),
        child: Container(
          alignment: Alignment.center,
          child: Text(
            text,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Theme.of(context).colorScheme.onSurface,
              fontWeight: FontWeight.bold,
              fontSize: 18,
              letterSpacing: 2,
            ),
          ),
        ),
      ),
    );
  }
}

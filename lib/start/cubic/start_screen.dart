import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_phasmohelper/share/flexible_space_app_bar.dart';
import 'package:flutter_phasmohelper/start/cubic/start_cubit.dart';
import 'package:flutter_phasmohelper/start/cubic/start_state.dart';
import 'package:go_router/go_router.dart';

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
            decoration: const BoxDecoration(
              image: DecorationImage(
                alignment: Alignment.center,
                fit: BoxFit.fitHeight,
                image: AssetImage("assets/background_start.jpg"),
              ),
            ),
            child: buildBody(state),
          );
        },
      ),
    );
  }

  Widget buildBody(StartState state) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GridView.count(
        crossAxisCount: 2,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
        children: const [
          _CardStart(text: "Start", namePush: 'main'),
          _CardStart(text: "Duchy", namePush: 'ghosts'),
          _CardStart(text: "Przedmioty", namePush: 'items'),
          _CardStart(text: "Ustawienia", namePush: 'settings'),
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
        color: Theme.of(context).colorScheme.surface.withOpacity(0.4),
        child: Container(
          alignment: Alignment.center,
          child: Text(
            text,
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

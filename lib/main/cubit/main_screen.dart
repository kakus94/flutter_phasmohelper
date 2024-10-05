// ignore_for_file: must_be_immutable, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_phasmohelper/config/di.dart';
import 'package:flutter_phasmohelper/share/app_background.dart';
import 'package:flutter_phasmohelper/share/flexible_space_app_bar.dart';
import 'package:flutter_phasmohelper/main/cubit/main_cubit.dart';
import 'package:flutter_phasmohelper/main/cubit/main_state.dart';
import 'package:flutter_phasmohelper/main/subview/bottom_navbar.dart';
import 'package:flutter_phasmohelper/main/subview/top_drop_menu.dart';
import 'package:flutter_phasmohelper/models/enums.dart';
import 'package:flutter_phasmohelper/models/ghost/ghost_model.dart';
import 'package:flutter_phasmohelper/stoper/cubit/stoper_cubit.dart';
import 'package:flutter_phasmohelper/stoper/cubit/stoper_screen.dart';
import 'package:flutter_phasmohelper/stoper/cubit/stoper_state.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final screenCubit = getIt<MainCubit>();

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
        preferredSize:
            const Size.fromHeight(125.0), // default height for AppBar
        child: MyAppBar(),
      ),
      bottomNavigationBar: BottomNavbar(),
      body: Container(
        decoration: AppBackground.background_2(),
        child: BlocConsumer<MainCubit, MainState>(
          bloc: screenCubit,
          listener: (BuildContext context, MainState state) {
            if (state.error != null) {}
          },
          builder: (BuildContext context, MainState state) {
            if (state.isLoading) {
              return const Center(child: CircularProgressIndicator());
            }

            return Padding(
              padding: const EdgeInsets.only(top: 180, bottom: 90),
              child: buildBody(state),
            );
          },
        ),
      ),
    );
  }

  Widget buildBody(MainState state) {
    return ListView.builder(
      padding: const EdgeInsets.all(10),
      // shrinkWrap: true,
      itemCount: state.ghostList?.length ?? 0,
      itemBuilder: (BuildContext context, int index) {
        return CardTile(model: state.ghostList![index]);
      },
    );
  }

  Column itemNav(String title, String icon) {
    return Column(
      children: [
        Image.asset(icon),
        Text(title, style: const TextStyle(fontSize: 12)),
      ],
    );
  }
}

class MyAppBar extends StatelessWidget {
  const MyAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<StoperCubit, StoperState>(
      bloc: getIt<StoperCubit>(),
      builder: (context, state) {
        return AppBar(
          elevation: 0,
          iconTheme: IconThemeData(color: Colors.white),
          backgroundColor: Colors.transparent,
          flexibleSpace: FlexibleSpaceAppBar(),
          actions: [
            ElevatedButton(
              onPressed: () {
                getIt<MainCubit>().reset();
                getIt<StoperCubit>().reset();
              },
              child: const Text("Reset"),
            ),
            SizedBox(width: 10),
            ElevatedButton(
              onPressed: () => state.status == StoperStatus.start
                  ? getIt<StoperCubit>().stop()
                  : getIt<StoperCubit>().start(),
              child: state.status == StoperStatus.start
                  ? const Text("Stop")
                  : const Text("Start"),
            ),
            SizedBox(width: 10)
          ],
          // title: const Text(
          //   'PHASMOHELPER',
          //   style: TextStyle(
          //     fontSize: 20,
          //     fontWeight: FontWeight.w700,
          //     color: Colors.white,
          //   ),
          // ),
          centerTitle: false,
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(70),
            child: Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: Column(
                children: [
                  StoperScreen(),
                  TopDropMenu(),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

class _FastHuntNormal extends StatelessWidget {
  const _FastHuntNormal();

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<String>(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      constraints: const BoxConstraints(
        maxHeight: 300,
        maxWidth: 300,
        minWidth: 200,
      ),
      // color: colorDialog,
      onSelected: (value) {},
      itemBuilder: (context) {
        return [
          PopupMenuItem(
            value: "wyloguj",
            child: Text("slow"),
          ),
          PopupMenuItem(
            value: "O aplikacji",
            child: Text("normal"),
          ),
          PopupMenuItem(
            value: "Pomoc",
            child: Text("fast"),
          ),
          PopupMenuItem(
            value: "Pomoc",
            child: Text("very fast"),
          ),
        ];
      },
      // icon: const Icon(Icons.format_align_justify),
      child: const Text('Hunt fast'),
    );
  }
}

class CardTile extends StatefulWidget {
  CardTile({super.key, required this.model});

  GhostModel model;
  bool extend = false;

  @override
  State<CardTile> createState() => _CardTileState();
}

class _CardTileState extends State<CardTile> {
  @override
  Widget build(BuildContext context) {
    final colorText = Theme.of(context).colorScheme.onSurface;
    return Card(
      shadowColor: Colors.black,
      color: Theme.of(context).colorScheme.surface.withOpacity(0.7),
      child: ListTile(
          title: Row(
            children: [
              Text(
                widget.model.name,
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              // if (widget.model.nature != null)
              //   Icon(widget.model.nature!.icon()),
              SizedBox(width: 10),
              Text("${widget.model.huntSanityPrecent}%",
                  style: TextStyle(
                      color: colorText,
                      fontSize: 12,
                      fontWeight: FontWeight.w600)),
              SizedBox(width: 10),
              Text(widget.model.speed,
                  style: TextStyle(
                      color: colorText,
                      fontSize: 12,
                      fontWeight: FontWeight.w600)),
              Spacer(),
              ...widget.model.evidence.map((e) => Image.asset(e.imagePath()))
            ],
          ),
          subtitle: widget.extend ? extend() : noExtend(context),
          onTap: () => setState(() {
                widget.extend = !widget.extend;
              })),
    );
  }

  Column extend() {
    return Column(
      children: [
        ...widget.model.infos.map((e) => _InfosView(model: e)),
      ],
    );
  }

  Text noExtend(BuildContext context) => Text(
        widget.model.infos.first.description.first['pl'] ?? "",
        style: TextStyle(
            fontWeight: FontWeight.w400,
            color: Theme.of(context).colorScheme.onSurface),
      );
}

@immutable
class _InfosView extends StatelessWidget {
  _InfosView({required this.model});

  InfoModel model;

  @override
  Widget build(BuildContext context) {
    final colorText = Theme.of(context).colorScheme.onSurface;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          alignment: Alignment.centerLeft,
          child: Text(
            model.title['pl'] ?? '',
            style: TextStyle(fontWeight: FontWeight.bold, color: colorText),
          ),
        ),
        ...model.description.map((e) => Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "- ${e['pl'] ?? ''}",
                  style:
                      TextStyle(fontWeight: FontWeight.w400, color: colorText),
                ),
                if (e != model.description.last) const Divider()
              ],
            )),
      ],
    );
  }
}

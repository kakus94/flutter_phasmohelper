// ignore_for_file: must_be_immutable, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_phasmohelper/config/di.dart';
import 'package:flutter_phasmohelper/main/cubit/main_cubit.dart';
import 'package:flutter_phasmohelper/main/cubit/main_state.dart';
import 'package:flutter_phasmohelper/main/subview/bottom_navbar.dart';
import 'package:flutter_phasmohelper/main/subview/top_drop_menu.dart';
import 'package:flutter_phasmohelper/models/enums.dart';
import 'package:flutter_phasmohelper/models/ghost/ghost_model.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final screenCubit = getIt<MainCubit>();

  final delegate = const SliverGridDelegateWithFixedCrossAxisCount(
    crossAxisCount: 2,
    mainAxisSpacing: 5,
    crossAxisSpacing: 5,
    childAspectRatio: 0.65,
  );

  @override
  void initState() {
    screenCubit.loadInitialData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PHASMOHELPER',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700)),
        centerTitle: false,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(15),
          child: Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: TopDropMenu(),
          ),
        ),
      ),
      bottomNavigationBar: BottomNavbar(),
      body: BlocConsumer<MainCubit, MainState>(
        bloc: screenCubit,
        listener: (BuildContext context, MainState state) {
          if (state.error != null) {}
        },
        builder: (BuildContext context, MainState state) {
          if (state.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          return buildBody(state);
        },
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
        Text(
          title,
          style: const TextStyle(fontSize: 12),
        ),
      ],
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
    return Card(
      child: ListTile(
          title: Row(
            children: [
              Text(
                widget.model.name,
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              if (widget.model.nature != null)
                Icon(widget.model.nature!.icon()),
              SizedBox(width: 10),
              Text(widget.model.speed,
                  style: const TextStyle(
                      fontSize: 12, fontWeight: FontWeight.w600)),
              Spacer(),
              ...widget.model.evidence.map((e) => Image.asset(e.imagePath()))
            ],
          ),
          subtitle: widget.extend
              ? Column(
                  children: [
                    ...widget.model.infos.map((e) => _InfosView(model: e)),
                  ],
                )
              : noExtend(),
          onTap: () => setState(() {
                widget.extend = !widget.extend;
              })),
    );
  }

  Text noExtend() => Text(
        widget.model.infos.first.description.first['pl'] ?? "",
      );
}

@immutable
class _InfosView extends StatelessWidget {
  _InfosView({required this.model});

  InfoModel model;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          alignment: Alignment.centerLeft,
          child: Text(
            model.title['pl'] ?? '',
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        ...model.description.map((e) => Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("- ${e['pl'] ?? ''}",
                    style: const TextStyle(fontSize: 12)),
                if (e != model.description.last) const Divider()
              ],
            )),
      ],
    );
  }
}

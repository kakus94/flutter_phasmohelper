import 'package:flutter/material.dart';
import 'package:flutter_phasmohelper/models/items_model.dart';
import 'package:flutter_phasmohelper/share/app_background.dart';
import 'package:flutter_phasmohelper/share/flexible_space_app_bar.dart';

class ItemDetailScreen extends StatelessWidget {
  const ItemDetailScreen({super.key, required this.model});

  final ItemsModel model;

  @override
  Widget build(BuildContext context) {
    Map<String, List<String>> desc = model.description['pl'] ?? {};
    final keys = desc.keys;
    return Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        flexibleSpace: const FlexibleSpaceAppBar(),
        backgroundColor: Colors.transparent,
        title: Text(model.name['pl'] ?? "",
            style: const TextStyle(color: Colors.white)),
      ),
      body: Container(
        decoration: AppBackground.background_2(),
        child: Padding(
          padding: const EdgeInsets.only(top: 110),
          child: ListView.builder(
            padding: const EdgeInsets.all(8.0),
            itemCount: keys.length,
            itemBuilder: (context, index) {
              return _Row(
                title: keys.elementAt(index),
                notes: desc[keys.elementAt(index)] ?? [],
              );
            },
          ),
        ),
      ),
    );
  }
}

class _Row extends StatelessWidget {
  const _Row({required this.title, required this.notes});

  final String title;
  final List<String> notes;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Theme.of(context).colorScheme.surface.withOpacity(0.7),
      child: ListTile(
        title: Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ...notes.map((e) => Text(e, style: const TextStyle(fontSize: 14)))
          ],
        ),
      ),
    );
  }
}

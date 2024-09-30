import 'package:flutter/material.dart';

class TopDropMenu extends StatelessWidget {
  const TopDropMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [_FastHuntNormal(), _BehaviorHunt(), _HuntTime()],
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
      constraints:
          const BoxConstraints(maxHeight: 300, maxWidth: 300, minWidth: 100),
      // color: colorDialog,
      onSelected: (value) {},
      itemBuilder: (context) {
        return [
          const PopupMenuItem(
            value: "wyloguj",
            child: Text("slow"),
          ),
          const PopupMenuItem(
            value: "O aplikacji",
            child: Text("normal"),
          ),
          const PopupMenuItem(
            value: "Pomoc",
            child: Text("fast"),
          ),
          const PopupMenuItem(
            value: "Pomoc",
            child: Text("very fast"),
          ),
        ];
      },
      child: const Text('Szybkość'),
    );
  }
}

class _BehaviorHunt extends StatelessWidget {
  const _BehaviorHunt();

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<String>(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      constraints: const BoxConstraints(
        maxHeight: 300,
        maxWidth: 200,
        minWidth: 75,
      ),
      // color: colorDialog,
      onSelected: (value) {},
      itemBuilder: (context) {
        return [
          const PopupMenuItem(
            value: "wyloguj",
            child: Text("Zwalnia"),
          ),
          const PopupMenuItem(
            value: "O aplikacji",
            child: Text("bez zmian"),
          ),
          const PopupMenuItem(
            value: "Pomoc",
            child: Text("Przyspiesza"),
          ),
        ];
      },
      // icon: const Icon(Icons.format_align_justify),
      child: const Text('Zachowanie'),
    );
  }
}

class _HuntTime extends StatelessWidget {
  const _HuntTime();

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<String>(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      constraints: const BoxConstraints(
        maxHeight: 300,
        maxWidth: 200,
        minWidth: 75,
      ),
      // color: colorDialog,
      onSelected: (value) {},
      itemBuilder: (context) {
        return [
          const PopupMenuItem(
            value: "wyloguj",
            child: Text("Wczesnie"),
          ),
          const PopupMenuItem(
            value: "O aplikacji",
            child: Text("Normalnie"),
          ),
          const PopupMenuItem(
            value: "Pomoc",
            child: Text("Poźno"),
          ),
        ];
      },
      // icon: const Icon(Icons.format_align_justify),
      child: const Text('Pierwszy Hunt'),
    );
  }
}

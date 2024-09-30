

import 'package:flutter/material.dart';

class TopDropMenu extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return          
           Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _FastHuntNormal(),
              _FastHuntNormal(),
              _FastHuntNormal(),
              _FastHuntNormal(),
            ],
          )
        ;
  }


}


class _FastHuntNormal extends StatelessWidget {
  const _FastHuntNormal({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<String>(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      // icon: const Icon(Icons.format_align_justify),
      child: const Text('Hunt fast'),
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
    );
  }
}
import 'package:flutter/material.dart';
import 'package:flutter_phasmohelper/database/database.dart';
import 'package:flutter_phasmohelper/models/enums.dart';
import 'package:flutter_phasmohelper/models/ghost/ghost_model.dart';
import 'package:flutter_phasmohelper/share/app_background.dart';
import 'package:flutter_phasmohelper/share/flexible_space_app_bar.dart';

class GhostDetailsView extends StatelessWidget {
  const GhostDetailsView({
    super.key,
    required this.ghost,
  });

  final GhostModel ghost;

  @override
  Widget build(BuildContext context) {
    final name = ghost.name;

    return Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        iconTheme: const IconThemeData(color: Colors.white),
        elevation: 0,
        flexibleSpace: const FlexibleSpaceAppBar(),
        title: Text(name, style: const TextStyle(color: Colors.white)),
      ),
      body: Container(
        decoration: AppBackground.background_2(),
        child: Padding(
          padding: const EdgeInsets.only(top: 110),
          child: ListView(
            padding: const EdgeInsets.all(8.0),
            children: [
              _EvidendeCard(evidences: ghost.evidence),
              if (ghost.evidenceRequired != null)
                _EvidenceRequiredCard(evidence: ghost.evidenceRequired!),
            ],
          ),
        ),
      ),
    );
  }
}

class _EvidendeCard extends StatelessWidget {
  const _EvidendeCard({required this.evidences});

  final List<Evidence> evidences;

  @override
  Widget build(BuildContext context) {
    return Card(
        color: Theme.of(context).colorScheme.surface.withOpacity(0.7),
        child: Padding(
          padding: const EdgeInsets.all(0),
          child: ListTile(
            title: const Text(
              "Evidences",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
            subtitle: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ...evidences.map(
                  (ev) => _row(ev),
                ),
              ],
            ),
          ),
        ));
  }

  Row _row(Evidence ev) {
    return Row(
      children: [
        Image.asset(ev.imagePath()),
        Text(ev.name, style: const TextStyle(fontWeight: FontWeight.w600)),
      ],
    );
  }
}

class _EvidenceRequiredCard extends StatelessWidget {
  const _EvidenceRequiredCard({required this.evidence});

  final Evidence evidence;

  @override
  Widget build(BuildContext context) {
    return Card(
        color: Theme.of(context).colorScheme.surface.withOpacity(0.7),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              const Text("Wymagane dowody:",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
              Spacer(),
              Image.asset(evidence.imagePath()),
              Text(evidence.name,
                  style: const TextStyle(fontWeight: FontWeight.w600)),
            ],
          ),
        ));
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_phasmohelper/models/enums.dart';
import 'package:flutter_phasmohelper/models/ghost/ghost_model.dart';
import 'package:flutter_phasmohelper/share/app_background.dart';
import 'package:flutter_phasmohelper/share/flexible_space_app_bar.dart';
import 'package:flutter_gen/gen_l10n/arb_localization.dart';

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
              _EvidendeCard(ghost: ghost),
              if (ghost.evidenceRequired != null)
                _EvidenceRequiredCard(ghost: ghost),
              _SanityHuntCard(ghost: ghost),
              _NormalSpeedCard(ghost: ghost),
              _CanRecognizeCard(ghost: ghost),
              _DificulltyWithNoEvidenceCard(ghost: ghost),
              _InfoCard(ghost: ghost),
            ],
          ),
        ),
      ),
    );
  }
}

class _EvidendeCard extends StatelessWidget {
  const _EvidendeCard({required this.ghost});

  final GhostModel ghost;

  @override
  Widget build(BuildContext context) {
    final evidences = ghost.evidence;
    return Card(
        color: Theme.of(context).colorScheme.surface.withOpacity(0.7),
        child: ListTile(
          title: Text(
            AppLocalizations.of(context)?.evidence ?? "lang error",
          ),
          subtitle: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ...evidences.map(
                (ev) => _row(ev),
              ),
            ],
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
  const _EvidenceRequiredCard({required this.ghost});

  final GhostModel ghost;

  @override
  Widget build(BuildContext context) {
    return Card(
        color: Theme.of(context).colorScheme.surface.withOpacity(0.7),
        child: ListTile(
            title: Text(
                AppLocalizations.of(context)?.evidenceRequired ?? "lang error"),
            subtitle: Row(
              children: [
                Image.asset(ghost.evidenceRequired!.imagePath()),
                Text(ghost.evidenceRequired!.name,
                    style: const TextStyle(fontWeight: FontWeight.w600)),
              ],
            )));
  }
}

class _SanityHuntCard extends StatelessWidget {
  const _SanityHuntCard({required this.ghost});

  final GhostModel ghost;

  @override
  Widget build(BuildContext context) {
    return Card(
        color: Theme.of(context).colorScheme.surface.withOpacity(0.7),
        child: ListTile(
          title: Text(AppLocalizations.of(context)?.huntSanity ?? "lang error"),
          subtitle: Text('${ghost.huntSanityPrecent}%'),
        ));
  }
}

class _NormalSpeedCard extends StatelessWidget {
  const _NormalSpeedCard({required this.ghost});

  final GhostModel ghost;

  @override
  Widget build(BuildContext context) {
    return Card(
        color: Theme.of(context).colorScheme.surface.withOpacity(0.7),
        child: ListTile(
          subtitle: Text(ghost.speed),
          title: Text(
              AppLocalizations.of(context)?.speedNormalNull ?? "lang error"),
        ));
  }
}

class _CanRecognizeCard extends StatelessWidget {
  const _CanRecognizeCard({required this.ghost});

  final GhostModel ghost;

  @override
  Widget build(BuildContext context) {
    return Card(
        color: Theme.of(context).colorScheme.surface.withOpacity(0.7),
        child: ListTile(
          subtitle: Text(ghost.canRecognizedHunting.name(context)),
          title: Text(AppLocalizations.of(context)?.canRecognizeWithHunt ??
              "lang error"),
        ));
  }
}

class _DificulltyWithNoEvidenceCard extends StatelessWidget {
  const _DificulltyWithNoEvidenceCard({required this.ghost});

  final GhostModel ghost;

  @override
  Widget build(BuildContext context) {
    return Card(
        color: Theme.of(context).colorScheme.surface.withOpacity(0.7),
        child: ListTile(
          subtitle: Text(ghost.difficultyWithoutEvidence.name(context)),
          title: Text(AppLocalizations.of(context)?.dificulltyWithNoEvidence ??
              "lang error"),
        ));
  }
}

class _InfoCard extends StatelessWidget {
  const _InfoCard({required this.ghost});

  final GhostModel ghost;

  @override
  Widget build(BuildContext context) {
    return Card(
        color: Theme.of(context).colorScheme.surface.withOpacity(0.7),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              ...ghost.infos.map((e) => _row(e)),
            ],
          ),
        ));
  }

  _row(InfoModel e) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text((e.title['pl'] ?? '').toUpperCase(),
            style: const TextStyle(fontWeight: FontWeight.bold)),
        ...e.description.map((e) => Text("- ${e['pl'] ?? ''}")),
      ],
    );
  }
}

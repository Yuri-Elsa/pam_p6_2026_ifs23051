// lib/features/flowers/flowers_detail_screen.dart

import 'package:flutter/material.dart';
import '../../data/dummy_data.dart';
import '../../data/models/flower_model.dart';
import '../../shared/widgets/loading_widget.dart';
import '../../shared/widgets/top_app_bar_widget.dart';

class FlowersDetailScreen extends StatefulWidget {
  const FlowersDetailScreen({super.key, required this.flowerName});
  final String flowerName;

  @override
  State<FlowersDetailScreen> createState() => _FlowersDetailScreenState();
}

class _FlowersDetailScreenState extends State<FlowersDetailScreen> {
  FlowerModel? _flower;

  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      final result = DummyData.getFlowersData()
          .where((f) => f.nama == widget.flowerName)
          .firstOrNull;
      if (mounted) {
        setState(() => _flower = result);
        if (result == null && mounted) Navigator.of(context).pop();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_flower == null) {
      return Scaffold(
        appBar: TopAppBarWidget(title: widget.flowerName, showBackButton: true),
        body: const LoadingWidget(),
      );
    }
    return Scaffold(
      appBar: TopAppBarWidget(title: _flower!.nama, showBackButton: true),
      body: _FlowersDetailBody(flower: _flower!),
    );
  }
}

class _FlowersDetailBody extends StatelessWidget {
  const _FlowersDetailBody({required this.flower});
  final FlowerModel flower;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: Column(
              children: [
                Image.asset(
                  flower.gambar,
                  width: double.infinity,
                  height: 250,
                  fit: BoxFit.contain,
                  errorBuilder: (context, error, stackTrace) => Container(
                    height: 250,
                    color: Theme.of(context).colorScheme.primaryContainer,
                    child: Icon(
                      Icons.local_florist,
                      size: 80,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                ),
                const SizedBox(height: 12),
                Text(
                  flower.nama,
                  style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 4),
                Text(
                  '📍 ${flower.asalDaerah}',
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: Theme.of(context).colorScheme.onSurfaceVariant,
                  ),
                ),
              ],
            ),
          ),
          _InfoCard(
            title: '🌸 Bahasa Bunga',
            content: flower.bahasaBunga,
            highlight: true,
          ),
          const SizedBox(height: 16),
          _InfoCard(title: '📖 Deskripsi', content: flower.deskripsi),
          const SizedBox(height: 16),
          _InfoCard(title: '🗺️ Asal Daerah', content: flower.asalDaerah),
          const SizedBox(height: 24),
        ],
      ),
    );
  }
}

class _InfoCard extends StatelessWidget {
  const _InfoCard({
    required this.title,
    required this.content,
    this.highlight = false,
  });

  final String title;
  final String content;
  final bool highlight;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Card(
      elevation: 4,
      color: highlight ? colorScheme.primaryContainer : colorScheme.surface,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.w600,
                color: highlight ? colorScheme.onPrimaryContainer : null,
              ),
            ),
            const Divider(height: 16),
            Text(
              content,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: highlight ? colorScheme.onPrimaryContainer : null,
                fontStyle: highlight ? FontStyle.italic : FontStyle.normal,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
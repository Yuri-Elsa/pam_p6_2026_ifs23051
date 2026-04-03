// lib/features/flowers/flowers_screen.dart

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../core/constants/route_constants.dart';
import '../../data/dummy_data.dart';
import '../../data/models/flower_model.dart';
import '../../shared/widgets/top_app_bar_widget.dart';

class FlowersScreen extends StatefulWidget {
  const FlowersScreen({super.key});

  @override
  State<FlowersScreen> createState() => _FlowersScreenState();
}

class _FlowersScreenState extends State<FlowersScreen> {
  List<FlowerModel> _flowers = DummyData.getFlowersData();
  String _searchQuery = '';

  void _onSearchQueryChange(String query) {
    setState(() {
      _searchQuery = query;
      _flowers = DummyData.getFlowersData()
          .where((f) => f.nama.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TopAppBarWidget(
        title: 'Flowers',
        withSearch: true,
        searchQuery: _searchQuery,
        onSearchQueryChange: _onSearchQueryChange,
      ),
      body: _FlowersBody(
        flowers: _flowers,
        onOpen: (name) => context.go('${RouteConstants.flowers}/$name'),
      ),
    );
  }
}

class _FlowersBody extends StatelessWidget {
  const _FlowersBody({required this.flowers, required this.onOpen});
  final List<FlowerModel> flowers;
  final ValueChanged<String> onOpen;

  @override
  Widget build(BuildContext context) {
    if (flowers.isEmpty) {
      return Center(
        child: Card(
          margin: const EdgeInsets.all(16),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Text(
              'Tidak ada bunga ditemukan!',
              style: Theme.of(context).textTheme.bodyMedium,
              textAlign: TextAlign.center,
            ),
          ),
        ),
      );
    }

    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: flowers.length,
      itemBuilder: (context, index) =>
          _FlowerItemCard(flower: flowers[index], onOpen: onOpen),
    );
  }
}

class _FlowerItemCard extends StatelessWidget {
  const _FlowerItemCard({required this.flower, required this.onOpen});
  final FlowerModel flower;
  final ValueChanged<String> onOpen;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8),
      elevation: 4,
      color: colorScheme.surface,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: () => onOpen(flower.nama),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.asset(
                  flower.gambar,
                  width: 70,
                  height: 70,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) => Container(
                    width: 70,
                    height: 70,
                    color: colorScheme.primaryContainer,
                    child: Icon(Icons.local_florist, color: colorScheme.primary),
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      flower.nama,
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Row(
                      children: [
                        Icon(Icons.auto_stories,
                            size: 13, color: colorScheme.primary),
                        const SizedBox(width: 4),
                        Expanded(
                          child: Text(
                            flower.bahasaBunga,
                            style: Theme.of(context)
                                .textTheme
                                .bodySmall
                                ?.copyWith(
                              color: colorScheme.primary,
                              fontStyle: FontStyle.italic,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 2),
                    Text(
                      flower.deskripsi,
                      style: Theme.of(context).textTheme.bodyMedium,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
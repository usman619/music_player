import 'package:flutter/material.dart';
import 'package:music_player/components/app_drawer.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(
          title: const Text('P L A Y L I S T'),
          centerTitle: true,
          backgroundColor: Theme.of(context).colorScheme.primary),
      drawer: const AppDrawer(),
    );
  }
}

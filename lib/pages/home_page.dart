import 'package:flutter/material.dart';
import 'package:music_player/components/app_drawer.dart';
import 'package:music_player/themes/text_theme.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.surface,

        title: Text(
          'PLAYLIST',
          style: titleTextTheme,
        ),

        centerTitle: true,
        // backgroundColor: Theme.of(context).colorScheme.primary
      ),
      drawer: const AppDrawer(),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:music_player/models/song_file.dart';

class PlaylistProvider extends ChangeNotifier {
  final List<Song> _playlist = [];
  int? _currentSongIndex;

  int? get currentSongIndex => _currentSongIndex;
  List<Song> get playlist => _playlist;
}

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

class Song {
  final List<PlatformFile> files;
  final ValueChanged<PlatformFile> onOpenedFile;

  const Song({required this.files, required this.onOpenedFile});
}

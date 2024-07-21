import 'package:file_picker/file_picker.dart';

class Song {
  final String songName;
  final String artistName;
  final String songDuration;
  final PlatformFile file;
  final bool isFavirote;
  // Map<String, Uint8List?> extractedImages = {};
  //final ValueChanged<PlatformFile> onOpenedFile;

  Song(this.songName, this.artistName, this.songDuration, this.file,
      {this.isFavirote = false}
      //required this.onOpenedFile,
      );
}

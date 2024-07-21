import 'dart:typed_data';
import 'package:audiotagger/audiotagger.dart';
import 'package:file_picker/file_picker.dart';

class Mp3ImageExtractor {
  final Map<String, Uint8List?> extractedImages = {};

  Future<void> extractImagesFromFiles(List<PlatformFile> files) async {
    for (var file in files) {
      if (file.extension == 'mp3') {
        Uint8List? imageData = await extractImageFromMp3(file.path!);
        extractedImages[file.name] = imageData;
      }
    }
  }

  Future<Uint8List?> extractImageFromMp3(String filePath) async {
    Audiotagger tagger = Audiotagger();
    return await tagger.readArtwork(path: filePath);
  }
}

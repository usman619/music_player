import 'dart:typed_data';
import 'package:audiotagger/audiotagger.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

class GetFiles extends StatefulWidget {
  final List<PlatformFile> files;
  final ValueChanged<PlatformFile> onOpenedFile;

  const GetFiles({super.key, required this.files, required this.onOpenedFile});

  @override
  State<GetFiles> createState() => _GetFilesState();
}

class _GetFilesState extends State<GetFiles> {
  Map<String, Uint8List?> extractedImages = {};

  @override
  void initState() {
    super.initState();
    extractImagesFromFiles();
  }

  Future<void> extractImagesFromFiles() async {
    for (var file in widget.files) {
      if (file.extension == 'mp3') {
        Uint8List? imageData = await extractImageFromMp3(file.path!);
        setState(() {
          extractedImages[file.name] = imageData;
        });
      }
    }
  }

  Future<Uint8List?> extractImageFromMp3(String filePath) async {
    Audiotagger tagger = Audiotagger();
    return await tagger.readArtwork(path: filePath);
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          childAspectRatio: 1,
        ),
        itemCount: widget.files.length,
        itemBuilder: (context, index) {
          final file = widget.files[index];
          return buildFile(file);
        },
      ),
    );
  }

  Widget buildFile(PlatformFile file) {
    final name = file.name;
    final imageData = extractedImages[name];

    return GestureDetector(
      onTap: () => widget.onOpenedFile(file),
      child: Card(
        child: Column(
          children: [
            if (imageData != null)
              Image.memory(imageData,
                  width: 100, height: 100, fit: BoxFit.cover)
            else
              const Icon(Icons.music_note, size: 100),
            Text(name),
          ],
        ),
      ),
    );
  }
}




// import 'package:file_picker/file_picker.dart';
// import 'package:flutter/material.dart';

// class GetFiles extends StatefulWidget {
//   final List<PlatformFile> files;
//   final ValueChanged<PlatformFile> onOpenedFile;

//   const GetFiles({super.key, required this.files, required this.onOpenedFile});

//   @override
//   State<GetFiles> createState() => _GetFilesState();
// }

// class _GetFilesState extends State<GetFiles> {
//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: GridView.builder(
//         gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//           crossAxisCount: 2,
//           crossAxisSpacing: 10,
//           mainAxisSpacing: 10,
//           childAspectRatio: 1,
//         ),
//         itemCount: widget.files.length,
//         itemBuilder: (context, index) {
//           final file = widget.files[index];

//           return buildFile(file);
//         },
//       ),
//     );
//   }

//   Widget buildFile(PlatformFile file) {
//     final name = file.name;

//   }
// }

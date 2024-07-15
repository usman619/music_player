import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:music_player/components/app_drawer.dart';
import 'package:music_player/plugin/get_files.dart';
import 'package:music_player/themes/text_theme.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<PlatformFile> _files = [];

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
      ),
      drawer: const AppDrawer(),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).colorScheme.secondary,
        child: Icon(Icons.add,
            color: Theme.of(context).colorScheme.inversePrimary),
        onPressed: _pickFiles,
      ),
      body: _files.isNotEmpty
          ? GetFiles(
              files: _files,
              onOpenedFile: openFile,
            )
          : Center(child: Text('No files selected')),
    );
  }

  Future<void> _pickFiles() async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['mp3'],
    );

    if (result != null) {
      setState(() {
        _files = result.files;
      });

      final file = result.files.first;
      openFile(file);
      await saveFilePermanently(file);
    }
  }

  void openFile(PlatformFile file) {
    OpenFile.open(file.path!);
  }

  Future<File> saveFilePermanently(PlatformFile file) async {
    final appStorage = await getApplicationDocumentsDirectory();
    final newFile = File('${appStorage.path}/${file.name}');

    return File(file.path!).copy(newFile.path);
  }
}





// import 'dart:io';

// import 'package:file_picker/file_picker.dart';
// import 'package:flutter/material.dart';
// import 'package:music_player/components/app_drawer.dart';
// import 'package:music_player/plugin/get_files.dart';
// import 'package:music_player/themes/text_theme.dart';
// import 'package:open_file/open_file.dart';
// import 'package:path_provider/path_provider.dart';

// class HomePage extends StatelessWidget {
//   const HomePage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       // backgroundColor: Theme.of(context).colorScheme.surface,
//       appBar: AppBar(
//         backgroundColor: Theme.of(context).colorScheme.surface,

//         title: Text(
//           'PLAYLIST',
//           style: titleTextTheme,
//         ),

//         centerTitle: true,
//         // backgroundColor: Theme.of(context).colorScheme.primary
//       ),
//       drawer: const AppDrawer(),
//       floatingActionButton: FloatingActionButton(
//         backgroundColor: Theme.of(context).colorScheme.secondary,
//         child: Icon(Icons.add,
//             color: Theme.of(context).colorScheme.inversePrimary),
//         onPressed: () async {
//           final result = await FilePicker.platform.pickFiles(
//             type: FileType.custom,
//             allowedExtensions: ['mp3'],
//           );
//           if (result != null) {
//             // print(result.files.first);
//             final file = result.files.first;
//             // print('Name: ${file.name}');
//             // print('Path: ${file.path}');
//             // print('Size: ${file.size}');
//             // print('Extension: ${file.extension}');

//             openFile(file);

//             final newFile = await saveFilePermanently(file);

//             // print('From Path: ${file.path!}');
//             // print('to Path: ${newFile.path}');
//           } else {
//             return;
//           }
//         },
//       ),
//     );
//   }

//   void openFiles(List<PlatformFile> files) => GetFiles(
//         files: files,
//         onOpenedFile: openFile,
//       );

//   // _buildBody(BuildContext context) {
//   //   return openFiles();
//   // }

//   void openFile(PlatformFile file) {
//     OpenFile.open(file.path!);
//   }

//   Future<File> saveFilePermanently(PlatformFile file) async {
//     final appStorage = await getApplicationDocumentsDirectory();
//     final newFile = File('${appStorage.path}/${file.name}');

//     return File(file.path!).copy(newFile.path);
//   }
// }

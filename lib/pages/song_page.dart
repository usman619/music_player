import 'package:flutter/material.dart';
import 'package:music_player/components/app_drawer.dart';
import 'package:music_player/components/neu_box.dart';
import 'package:music_player/themes/text_theme.dart';

class SongPage extends StatelessWidget {
  const SongPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      // appBar: AppBar(
      //   title: Text(
      //     'PLAYLIST',
      //     style: titleTextTheme,
      //   ),
      //   backgroundColor: Theme.of(context).colorScheme.primary,
      //   centerTitle: true,
      // ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 25, right: 25, bottom: 25),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/home');
                    },
                    icon: const Icon(Icons.arrow_back),
                  ),
                  Text(
                    'PLAYLIST',
                    style: titleTextTheme,
                  ),
                  IconButton(
                    onPressed: () {
                      //Open app drawer
                      Scaffold.of(context).openEndDrawer();
                    },
                    icon: const Icon(Icons.menu),
                  ),
                ],
              ),
              const SizedBox(height: 25),
              NeuBox(
                child: Column(children: [
                  // _musicIcon(context),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.asset(
                      'assets/images/song.png',
                      height: 300,
                      width: 300,
                      fit: BoxFit.fill,
                    ),
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Song Name',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                          Text(
                            'Song Name',
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                      Icon(
                        Icons.favorite,
                        color: Colors.red,
                      ),
                    ],
                  ),
                ]),
              ),
              const SizedBox(height: 25),

              //Song (current time, Shuffle, Repeat, Total time)
              // Progress Bar

              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 15, right: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          '0:00',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.shuffle),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.repeat),
                        ),
                        const Text(
                          '0:00',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 5),
                  // const LinearProgressIndicator(
                  //   value: 0.5,
                  //   backgroundColor: Colors.grey,
                  // ),
                  SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                        trackHeight: 5,
                        thumbShape:
                            const RoundSliderThumbShape(enabledThumbRadius: 0),
                      ),
                      child: Slider(
                        min: 0,
                        max: 100,
                        value: 50,
                        onChanged: (value) {},
                        activeColor: Theme.of(context).colorScheme.primary,
                        inactiveColor: Theme.of(context).colorScheme.secondary,
                      )),
                ],
              ),

              // Music Controls

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {},
                      child: const NeuBox(
                        child: Icon(
                          Icons.skip_previous,
                          size: 40,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    flex: 2,
                    child: GestureDetector(
                      onTap: () {},
                      child: const NeuBox(
                        child: Icon(
                          Icons.play_arrow,
                          size: 40,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {},
                      child: const NeuBox(
                        child: Icon(
                          Icons.skip_next,
                          size: 40,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  // _musicIcon(BuildContext context) {
  //   return Icon(
  //     Icons.music_note_sharp,
  //     size: 250,
  //     color: Theme.of(context).colorScheme.inversePrimary,
  //   );
  // }
}

import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'audio_page.dart';
import 'global.dart';


void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => home(),
        'audio': (context) => audio(),
      },
    ),
  );
}

final assetsAudioPlayer = AssetsAudioPlayer();

class home extends StatefulWidget {
  const home({Key? key}) : super(key: key);

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  @override
  Widget build(BuildContext context) {
    double _heigth = MediaQuery.of(context).size.height;
    double _wight = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
          title: Text("AUDIO"),
          centerTitle: true,
          backgroundColor: Colors.green),
      body: ListView.separated(
          itemCount: global.all_songs.length,
          separatorBuilder: (context, i) => SizedBox(height: 10),
          itemBuilder: (context, i) => Padding(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: InkWell(
                  borderRadius: BorderRadius.circular(20),
                  onTap: () {
                    setState(() {
                      global.init_value = i;
                      new_song(play: true);
                      global.totalsecond = assetsAudioPlayer
                          .current.value!.audio.duration
                          .toString()
                          .split(".")[0];
                      Navigator.of(context).pushNamed('audio');
                    });
                  },
                  child: Container(
                      height: _heigth * 0.15,
                      width: double.infinity,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.circular(20)),
                      child: Row(
                        children: [
                          FlutterLogo(size: 30),
                          SizedBox(width: 10),
                          SizedBox(
                            height: _heigth * 0.09,
                            width: 250,
                            child: Text("\n${global.all_songs[i]['name']}",
                                style: TextStyle(fontSize: 20),
                                textAlign: TextAlign.center,
                                overflow: TextOverflow.visible),
                          ),
                        ],
                      )),
                ),
              )),
    );
  }
}

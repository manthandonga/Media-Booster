import 'package:assets_audio_player/assets_audio_player.dart';
import 'global.dart';
import 'main.dart';
import 'package:flutter/material.dart';

class audio extends StatefulWidget {
  const audio({Key? key}) : super(key: key);

  @override
  State<audio> createState() => _audioState();
}

new_song({required bool play}) {
  assetsAudioPlayer.open(
    Audio(
      "${global.all_songs[global.init_value]['song']}",
      metas: Metas(
        title: "${global.all_songs[global.init_value]["name  "]}",
        artist: "Unknown",
        image: const MetasImage.asset(
          "assets/images/1.png",
        ),
      ),
    ),
    showNotification: true,
    autoStart: play,
    headPhoneStrategy: HeadPhoneStrategy.pauseOnUnplugPlayOnPlug,
  );
}

bool stop = false;

class _audioState extends State<audio> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    assetsAudioPlayer.stop();
    new_song(play: true);
  }

  @override
  Widget build(BuildContext context) {
    double _heigth = MediaQuery.of(context).size.height;
    double _wight = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
          title: Text("AUDIO"), centerTitle: true, backgroundColor: Colors.red),
      body: Container(
        alignment: Alignment.center,
        child: Column(
          children: [
            SizedBox(height: 80),
            Image.asset("${global.all_songs[global.init_value]['image']}",
                width: _wight * 0.4),
            SizedBox(height: 50),
            Text(
              "${global.all_songs[global.init_value]['name']}",
              style: TextStyle(fontSize: 25, color: Colors.red),
            ),
            SizedBox(height: 30),
            StreamBuilder(
                stream: assetsAudioPlayer.currentPosition,
                builder: (context, snapshort) {
                  global.totalsecond = assetsAudioPlayer
                      .current.value!.audio.duration
                      .toString()
                      .split(".")[0];
                  Duration? data = snapshort.data;
                  global.totalsecond = assetsAudioPlayer
                      .current.value!.audio.duration
                      .toString()
                      .split(".")[0];
                  return Column(
                    children: [
                      Text(
                        "${data.toString().split(".")[0]} / ${global.totalsecond}",
                        style: TextStyle(fontSize: 25),
                        textAlign: TextAlign.center,
                      ),
                      Slider(
                        activeColor: Colors.red,
                        thumbColor: Colors.red,
                        min: 0,
                        max: (assetsAudioPlayer.current.hasValue)
                            ? assetsAudioPlayer
                            .current.value!.audio.duration.inSeconds
                            .toDouble()
                            : 0,
                        value: data!.inSeconds.toDouble(),
                        onChanged: (val) {
                          assetsAudioPlayer
                              .seek(Duration(seconds: val.toInt()));
                        },
                      ),
                      Padding(
                        padding: EdgeInsets.all(20),
                        child: Container(
                            height: 100,
                            width: double.infinity,
                            decoration: BoxDecoration(
                                color: Colors.red,
                                borderRadius: BorderRadius.circular(20)),
                            child: Row(
                              children: [
                                SizedBox(width: 35),
                                IconButton(
                                    onPressed: () {
                                      setState(() {
                                        if (global.init_value > 0) {
                                          global.init_value--;
                                        } else {
                                          global.init_value = 0;
                                        }
                                      });
                                    },
                                    icon: Icon(Icons.arrow_back_ios_new,
                                        size: 40)),
                                SizedBox(width: 60),
                                IconButton(
                                    onPressed: () {
                                      setState(() {
                                        stop = !stop;
                                        if (stop == true) {
                                          assetsAudioPlayer.pause();
                                        } else {
                                          new_song(play: true);
                                        }
                                      });
                                    },
                                    icon: (stop == true)
                                        ? Icon(Icons.play_arrow, size: 40)
                                        : Icon(Icons.stop, size: 40)),
                                SizedBox(width: 60),
                                IconButton(
                                    onPressed: () {
                                      setState(() {
                                        setState(() {
                                          assetsAudioPlayer.stop();
                                          if (global.init_value <
                                              global.all_songs.length - 1) {
                                            global.init_value++;
                                          } else {
                                            global.init_value = 0;
                                          }
                                          new_song(play: true);
                                        });
                                      });
                                    },
                                    icon: Icon(Icons.arrow_forward_ios_sharp,
                                        size: 40)),
                              ],
                            )),
                      ),
                    ],
                  );
                }),
          ],
        ),
      ),
    );
  }
}
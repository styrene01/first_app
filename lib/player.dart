import 'package:audioplayers/audioplayers.dart';
import 'package:first_app/musics.dart';
import 'package:flutter/material.dart';

class Player extends StatefulWidget {
  const Player({ Key? key,required this.music }) : super(key: key);

  final Musics music;

  @override
  State<Player> createState() => _PlayerState();
}

class _PlayerState extends State<Player> {

  bool isPlaying=false;
  final audioPlayer=AudioPlayer();
  Duration duration=Duration.zero;//1st variable for song length 
  Duration position=Duration.zero;//2nd for current duration

  @override
  void initState() {//we use initState so when widget loads first time it loads this

      audioPlayer.onPlayerStateChanged.listen((audioState) {
        
        setState(() {
          isPlaying=audioState==PlayerState.PLAYING;//if playing then true
        });

      });

      audioPlayer.onDurationChanged.listen((audioDuration) {

        setState(() {
          duration=audioDuration;
        });

      });

      audioPlayer.onAudioPositionChanged.listen((audioPosition) {
        
        setState(() {
          position=audioPosition;
        });

      });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.music.title),
        backgroundColor: Color.fromARGB(255, 152, 126, 109) ,
      ),

      body:Stack(
        children: [
          Container(  //at the bottom of ui 
              color: Color.fromARGB(221, 185, 79, 37),
            ),
      Center(

      child: Padding(
        padding : EdgeInsets.fromLTRB(20, 60, 20, 20),
      child: Column(

            children: [
              Container(
                height: 270.0,
                width: 270.0,                              
                  child: ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Image.network(
                    widget.music.image,
                      fit: BoxFit.cover,
                    ),
                  ),
              ),
              
              SizedBox(height: 20.0,),

                Slider(
                min: 0,
                max: duration.inSeconds.toDouble(),
                value: position.inSeconds.toDouble(), 
                onChanged: (value)async{

                  position=Duration(seconds: value.toInt());
                  await audioPlayer.seek(position);
                }
                ),

                SizedBox(height: 20.0,),
                Text(widget.music.title,style: TextStyle(
                  fontSize:30.0,
                  color:Colors.white
                )),

                SizedBox(height: 20.0,),
                Text(widget.music.singer,style: TextStyle(
                  fontSize:30.0,
                  color:Colors.white
                )),

                SizedBox(height: 20.0,),

               IconButton(
                 onPressed: ()async{
                  
                   if(isPlaying==true)
                   {
                     await audioPlayer.pause();//async task meaning in background
                   }//will not block code. await means until and unless playing is started don't perform 
                   //anything else
                   else
                   {
                     await audioPlayer.play(widget.music.url);
                   }//it will play audio since initially isPlaying is false

                 }, 
                 icon: Icon(isPlaying?Icons.pause_circle:Icons.play_circle),
                 iconSize: 90,
                 color: Color.fromARGB(255, 255, 55, 0),
                 ),
                
             ],
          ),
        ),
      ),
      ])
    );
  }
}
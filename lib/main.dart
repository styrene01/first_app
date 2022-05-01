import 'package:first_app/musics.dart';
import 'package:first_app/player.dart';
import 'package:flutter/material.dart'; //this package gives access to all things we use here widgets

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({ Key? key }) : super(key: key);

  

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  late List musics;

@override
  initState()
  {
    musics=getList();
    super.initState();
  } 

  List getList(){
    return [
      Musics(
          title: "Uptown Funk",
          singer: "One Republic",
          url: "https://www.soundhelix.com/examples/mp3/SoundHelix-Song-1.mp3",
          image:
              "https://img.mensxp.com/media/content/2020/Apr/Leading-B-Wood-Singers-Who-Lost-On-Reality-Shows8_5ea7d4f04e41e.jpeg"),
      Musics(
        title: "Black Space",
        singer: "Sia",
        url: "https://www.soundhelix.com/examples/mp3/SoundHelix-Song-2.mp3",
        image:
            "https://img.mensxp.com/media/content/2020/Apr/Leading-B-Wood-Singers-Who-Lost-On-Reality-Shows10_5ea7d51d28f24.jpeg",
      ),
      Musics(
        title: "Shake it off",
        singer: "Coldplay",
        url: "https://www.soundhelix.com/examples/mp3/SoundHelix-Song-3.mp3",
        image:
            "https://img.mensxp.com/media/content/2020/Apr/Leading-B-Wood-Singers-Who-Lost-On-Reality-Shows2_5ea7d47403432.jpeg",
      ),
      Musics(
          title: "Lean On",
          singer: "T. Schürger",
          url: "https://www.soundhelix.com/examples/mp3/SoundHelix-Song-4.mp3",
          image:
              "https://i.pinimg.com/originals/ea/60/26/ea60268f4374e8840c4529ee1462fa38.jpg"),
      Musics(
          title: "Sugar",
          singer: "Adele",
          url: "https://www.soundhelix.com/examples/mp3/SoundHelix-Song-5.mp3",
          image:
              "https://img.mensxp.com/media/content/2020/Apr/Leading-B-Wood-Singers-Who-Lost-On-Reality-Shows7_5ea7d4db364a2.jpeg"),
      Musics(
          title: "Believer",
          singer: "Ed Sheeran",
          url: "https://www.soundhelix.com/examples/mp3/SoundHelix-Song-6.mp3",
          image:
              "https://img.mensxp.com/media/content/2020/Apr/Leading-B-Wood-Singers-Who-Lost-On-Reality-Shows6_5ea7d4c7225c1.jpeg"),
      Musics(
          title: "Stressed out",
          singer: "Mark Ronson",
          url: "https://www.soundhelix.com/examples/mp3/SoundHelix-Song-7.mp3",
          image:
              "https://i.pinimg.com/originals/7c/a1/08/7ca1080bde6228e9fb8460915d36efdd.jpg"),
      Musics(
          title: "Girls Like You",
          singer: "Maroon 5",
          url: "https://www.soundhelix.com/examples/mp3/SoundHelix-Song-8.mp3",
          image:
              "https://i.pinimg.com/originals/1b/b8/55/1bb8552249faa2f89ffa0d762d87088d.jpg"),
      Musics(
          title: "Let her go",
          singer: "Passenger",
          url: "https://www.soundhelix.com/examples/mp3/SoundHelix-Song-9.mp3",
          image:
              "https://64.media.tumblr.com/5b7c0f14e4e50922ccc024573078db42/15bda826b481de6f-5a/s1280x1920/b26b182f789ef7bb7be15b037e2e687b0fbc437d.jpg"),
      Musics(
          title: "Roar",
          singer: "Katy Perry",
          url: "https://www.soundhelix.com/examples/mp3/SoundHelix-Song-10.mp3",
          image:
              "https://cdn2.stylecraze.com/wp-content/uploads/2013/11/Jesus-On-Her-Wrist.jpg.webp"),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp( //first returns this
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Music Player"),
          backgroundColor: Color.fromARGB(255, 152, 126, 109) ,
        ),

        body: Stack(
          children: [
            Container(  //at the bottom of ui 
              color: Color.fromARGB(221, 185, 79, 37),
            ),

                Expanded(
                  child: ListView.builder(
                    itemCount: musics.length,
                    itemBuilder: (context,index)=>InkWell(
                      onTap: (){
                        print("Tapped");

                          Navigator.push(context, 
                          MaterialPageRoute(builder: (context)=>
                          Player(music:musics[index])
                          ));
                      },
                      child: Padding(
                        padding: EdgeInsets.all(20.0),
                        child: Row(
                          children: [
                            Container(
                              height: 70.0,
                              width: 70.0,                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(8.0),
                                child: Image.network(
                                  musics[index].image,
                                  fit: BoxFit.cover,
                                  ),
                                ),
                            ),
                            SizedBox(width: 20.0),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(musics[index].title,style: const TextStyle(
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white
                                )),
                                SizedBox(height:5.0),
                                Text(musics[index].singer,style: const TextStyle(
                                  fontSize: 18.0, 
                                  color: Colors.white
                                                                 )),
                              ],
                            ),
                            Spacer(),
                            Icon(
                              Icons.play_circle_fill,
                              color: Color.fromARGB(255, 255, 55, 0),
                              size: 45.0,
                            )
                          ],
                        ),
                      ),
                    )
                    ),
                  )
            
          ],
        )
      ), //then returns this body in html
    );
  }
}
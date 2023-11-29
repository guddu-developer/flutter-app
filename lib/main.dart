import 'package:flutter/material.dart';
import 'form.dart';
import 'data.dart';

void main(){
  runApp(MaterialApp(
    title: "Page Navigation",
    home: const MyApp(),
    debugShowCheckedModeBanner: false,
    routes: {
      'form':(context)=>const FormPage(),
      'data':(context)=>const DataPage(),
    },
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context){


    Widget buttonSection2 = Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        ElevatedButton(
          onPressed: () {
            // Navigator.pop(context);
            Navigator.pushNamed(context, 'form');
          },
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(horizontal: 70, vertical: 20),
            backgroundColor: Colors.green,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          child: const Text("Form", style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),),

        ),
        ElevatedButton(
          onPressed: () {
            // if(_history.isNotEmpty==false){
            Navigator.pushNamed(context, "home");
          },
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(horizontal: 70, vertical: 20),
            backgroundColor: Colors.deepPurpleAccent,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          child: const Text("HOME", style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),),

        ),
      ],
    );




    return Scaffold(
      appBar: AppBar(
        title: const Text('GDSC Demo App By Guddu'),
        backgroundColor: Colors.deepPurpleAccent,
        foregroundColor: Colors.white,
      ),
      body: ListView(
        children: [
          Image.asset(
            'images/app.png',
            width: MediaQuery
                .of(context)
                .size
                .width * 1,
            height: 240,
            fit: BoxFit.cover,
          ),
          const HomePage(),
          // titleSection,
          // buttonSection,
          // textSection,
          // clicked,
          // buttonSection2,
        ],
      ),
      bottomNavigationBar: buttonSection2,
    );
  }

}


class HomePage extends StatefulWidget {
  const HomePage({ super.key});
  @override
  ClickShow createState() => ClickShow();
}

class ClickShow extends State<HomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }



  @override
  Widget build(BuildContext context) {
    Widget clicked = Align(
      alignment: Alignment.center,
      child: ElevatedButton(
        onPressed: _incrementCounter,
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(horizontal: 70, vertical: 20),
          backgroundColor: Colors.deepPurpleAccent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        child: Text("Clicked $_counter", style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),),

      ),
    );

    Widget titleSection = Container(
      padding: const EdgeInsets.all(32),
      child: Row(
        children: [
          Expanded(
            /*1*/
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /*2*/
                Container(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: const Center(
                    child: Text(
                      'Welcome My Demo App Build With Flutter',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.blueAccent,
                      ),
                    ),
                  ),),
                const Center(
                  child: Text(
                    'Guddu Kumar, India',
                    style: TextStyle(
                      color: Colors.black38,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );

    Color color = Colors.deepPurpleAccent;

    Widget buttonSection = Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _buildButtonColumn(color, Icons.thumb_up_off_alt, 'LIKE'),
        _buildButtonColumn(color, Icons.star_outline_sharp, 'REVIEW'),
        _buildButtonColumn(color, Icons.share, 'SHARE'),
      ],
    );

    Widget textSection = Container(
      padding: const EdgeInsets.all(32),
      child: const Align(
        alignment: Alignment.center,
        child: Padding(
          padding: EdgeInsets.only(left: 1.0),
          child: Text(
            'This App Contain Click Counter and Dynamic Message Saving Feature.It is Made With Flutter and dart,It Is Basic App  Demo For My GDSC Team. \nThanks For Using My App\nGuddu Kumar ',
            softWrap: true,
          ),
        ),
      ),
    );


    return Column(
        children: [
          titleSection,
          buttonSection,
          textSection,
          clicked,
          // buttonSection2,
        ],
    );


  }















Column _buildButtonColumn(Color color, IconData icon, String label) {
  return Column(
    mainAxisSize: MainAxisSize.min,
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Icon(icon, color: color),
      Container(
        margin: const EdgeInsets.only(top: 8),
        child: Text(
          label,
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w400,
            color: color,
          ),
        ),
      ),
    ],
  );
}
}
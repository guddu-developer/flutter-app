import 'package:flutter/material.dart';
import 'vars/globals.dart' as globals;


class DataPage extends StatelessWidget {
  const DataPage({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold
      (
      appBar: AppBar(
          title:const Text("Saved Messages"),
        backgroundColor: Colors.deepPurpleAccent,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(

    child: Column(
          children:   <Widget>[
    //         // for ( var i in globals.names ) Text(i.toString()),
            if(globals.names.isEmpty) Container(
      padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 5),
      child: const Card(
        color: Colors.deepPurpleAccent,
        child: ListTile(
          leading: Icon(Icons.album,color: Colors.yellowAccent,),
          title: Text('No Messages Saved',style: TextStyle(
            color: Colors.yellow,
            fontWeight: FontWeight.bold,
          ),),
        ),
      ),
    ),
    for(int x = 0; x<globals.names.length;x++)...[
    // List.generate(globals.names.length, (index) =>
                 Container(
              padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 5),
      child: Card(
        color: Colors.deepPurpleAccent,
        child: ListTile(
          leading: const Icon(Icons.album,color: Colors.yellowAccent,),
          title: Text('${globals.names[x]}',style: TextStyle(
            color: Colors.yellow,
            fontWeight: FontWeight.bold,
          ),),
          subtitle: Text('${globals.messages[x]}',style: TextStyle(
            color: Colors.white,
          ),),
        ),
      ),
    ),
            ],
          ],
      ),
      ),
      bottomNavigationBar: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          ElevatedButton(
            onPressed: (){
              globals.names.clear();
              globals.messages.clear();
              Navigator.pushNamed(context, 'data');
            },style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(horizontal: 40,vertical: 20),
            backgroundColor: Colors.red,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
            child: const Text("Delete All",style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),),

          ),
          ElevatedButton(
            onPressed: (){
              // Navigator.pop(context);
              Navigator.pushNamed(context, 'form');
            },  style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(horizontal: 40,vertical: 20),
            backgroundColor: Colors.green,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
            child: const Text("Form",style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),),

          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).popUntil((route) => route.isFirst);
            },   style: ElevatedButton.styleFrom(
    padding: const EdgeInsets.symmetric(horizontal: 50,vertical: 20),
    backgroundColor: Colors.deepPurpleAccent,
    shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(10),
    ),),
            child: const Text("HOME",style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),

            ),
          ),

        ],
      ),
    );
  }
}



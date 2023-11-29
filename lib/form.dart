import 'package:flutter/material.dart';
import "vars/globals.dart" as globals;

class FormPage extends StatelessWidget {
 const FormPage({super.key});
  @override
  Widget build(BuildContext context) {

    return Scaffold
      (
      appBar: AppBar(
          title:const Text("Form For Add Message"),
        backgroundColor: Colors.deepPurpleAccent,
        foregroundColor: Colors.white,
      ),
      body:const SingleChildScrollView(
      child: MyCustomForm(),),
      bottomNavigationBar: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
      ElevatedButton(
        onPressed: (){
          // Navigator.pop(context);
          Navigator.pushNamed(context, 'data');
        }, style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 60,vertical: 20),
        backgroundColor: Colors.pinkAccent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
        child: const Text("View Message",style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),),

      ),
      ElevatedButton(
        onPressed: () {
          // Navigator.popUntil(context, ModalRoute.withName('home'));
          Navigator.of(context).popUntil((route) => route.isFirst);
        },  style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 70,vertical: 20),
        backgroundColor: Colors.deepPurpleAccent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
        child: const Text("HOME",style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),),

      ),

      ],
    ),
    );
  }
}


// Create a Form widget.
class MyCustomForm extends StatefulWidget {
  const MyCustomForm({super.key});
  @override
  MyCustomFormState createState() {
    return MyCustomFormState();
  }
}

// Create a corresponding State class.
// This class holds data related to the form.
class MyCustomFormState extends State<MyCustomForm> {
  final _formKey = GlobalKey<FormState>();
  final name = TextEditingController();
  final message = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    name.dispose();
    message.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {

    Widget inputs=Container(
      padding:const EdgeInsets.all(20),
      width: MediaQuery.of(context).size.width * 1,
      child:Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
            child: TextFormField(
              controller: name,
              validator: (value) {
                if (value == null  || value.isEmpty) {
                  return 'Please enter Name';
                }
                return null;
              },
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Enter your Name',
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
            child: TextFormField(
              controller: message,
              validator: (value) {
                if (value == null  || value.isEmpty) {
                  return 'Please enter some Message';
                }
                return null;
              },
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Enter your Message',
              ),
            ),
          ),
          Container(
            width:MediaQuery.of(context).size.width * 1 ,
            padding: const EdgeInsets.symmetric(vertical: 20,horizontal: 10),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                padding: const EdgeInsets.symmetric(horizontal: 100,vertical: 18),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Saving Data')),
                  );
                  globals.names.add(name.text);
                  globals.messages.add(message.text);////single
                  name.text="";
                  message.text="";// e
                  showDialog(
                    context: context,
                    builder: (context) {
                      return const AlertDialog(
                        backgroundColor: Colors.green,
                        content: Text("Saved Successfully",style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold
                        ),),
                      );
                    },
                  );
                }
              },
              child: const Text('Submit',style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),),
            ),
          ),
        ],
      ),
    );


    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          inputs,
        ],
      ),
    );
  }
}
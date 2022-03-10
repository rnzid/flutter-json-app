import 'dart:convert';

import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
      theme: ThemeData(primarySwatch: Colors.teal),
      home: HomePage(),
    ));

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late List data;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Load Json Data"),
      ),
      body: Container(
        child: Center(
            child: FutureBuilder(
          future: DefaultAssetBundle.of(context)
              .loadString("load_json/person.json"),
          builder: (context, AsyncSnapshot) {
            var mydata = json.decode(AsyncSnapshot.data.toString());
            return ListView.builder(
              itemBuilder: (BuildContext context, int index) {
                return Card(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Text("Name : " + mydata[index]['Name']),
                      Text("Age : " + mydata[index]['age']),
                      Text("Height : " + mydata[index]['height']),
                      Text("Gender : " + mydata[index]['gender']),
                      Text("Hair_color : " + mydata[index]['hair_color']),
                    ],
                  ),
                );
              },
              itemCount: mydata == null ? 0 : mydata.length,
            );
          },
        )),
      ),
    );
  }
}

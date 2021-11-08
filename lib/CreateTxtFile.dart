import 'dart:io';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:trialwritetxtfile/anotherPage.dart';

class createTxtFile extends StatefulWidget {
  const createTxtFile({Key? key}) : super(key: key);

  @override
  _createTxtFileState createState() => _createTxtFileState();
}

class _createTxtFileState extends State<createTxtFile> {
  String? stringValue;

  _write(String text) async {
    final Directory directory = await getApplicationSupportDirectory();
    final File file = File('${directory.path}/my_file.txt');
    print("my path file : " + File('${directory.path}/my_file.txt').toString());
    await file.writeAsString(text);
    addStringToSF();
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => anotherpage()),
    );
  }

  addStringToSF() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('save', "done");
  }

  getStringValuesSF() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    //Return String
    stringValue = prefs.getString('save') ?? "no data";
    if(stringValue=="done"){
      print("dada sudah ada");
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => anotherpage()),
      );
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getStringValuesSF();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Trial Create Txt File"),
      ),
      body: Center(
        child: Container(
          child: ElevatedButton(
            onPressed: () {
              _write("makanan ini enak");
            },
            child: Text("Create File .txt"),
          ),
        ),
      ),
    );
  }
}

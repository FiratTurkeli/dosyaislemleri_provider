import 'dart:io';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);



  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  var tfController = TextEditingController();


  Future<void> veriYaz() async {

    var ad = await getApplicationDocumentsDirectory();
    var uygulamaDosyallamaYolu = await ad.path;
    var dosya = File("$uygulamaDosyallamaYolu/dosyam.txt");

    dosya.writeAsString(tfController.text);

    tfController.text = "";
  }

  Future<void> veriOku() async {
    try{
      var ad = await getApplicationDocumentsDirectory();
      var uygulamaDosyallamaYolu = await ad.path;
      var dosya = File("$uygulamaDosyallamaYolu/dosyam.txt");

      String okunanVeri = await dosya.readAsString();
      tfController.text = okunanVeri;

    }catch(e){

       e.toString();

    }
  }



  Future<void> veriSil() async {

      var ad = await getApplicationDocumentsDirectory();
      var uygulamaDosyallamaYolu = await ad.path;
      var dosya = File("$uygulamaDosyallamaYolu/dosyam.txt");

      if (dosya.existsSync()) {
        dosya.delete();
      }



  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(

          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: tfController,
                decoration: InputDecoration(
                  hintText: "Metni giriniz"
                ),
              ),
            ),
            Row(

              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                      onPressed: (){
                    veriYaz();

                  },
                      child: Text("Yaz")),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(onPressed: (){
                    veriOku();

                  },
                      child: Text("Oku")),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(onPressed: (){
                    veriSil();

                  },
                      child: Text("Sil")),
                )
              ],
            )

          ],
        ),
      ),

    );
  }
}

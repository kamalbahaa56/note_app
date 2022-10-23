import 'package:flutter/material.dart';
import 'package:flutter_note_app/pages/home_page.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart' as path_provider;
void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  final directory = await path_provider.getApplicationDocumentsDirectory();
  Hive.init(directory.path);
 
  runApp( MyApp());
  final Notesbos=  await Hive.openBox("Notes");
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
    
    debugShowCheckedModeBanner: false, 
      home:  MyHomePage(),
    );
  }
}



/*
  Container(
              width: MediaQuery.of(context).size.width,
              color: Colors.black,
              //height: MediaQuery.of(context).size.height*.4,
              child: Center(
                child: RichText(text: const TextSpan(children:<TextSpan> [
                  TextSpan(
                    text: 'Hellow World',style: TextStyle(color: Colors.white)
                  ),
                  
                  TextSpan( text: 'Hellow World',style: TextStyle(color: Colors.orange))
                  ]
                  ),
                  ),
              ),
            ),
            */
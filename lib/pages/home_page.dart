import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_note_app/pages/widget_templet.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../model/qoutes.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final WisdomContorller = TextEditingController();
  final AuthorContorller =TextEditingController();
  
  List wordS =[
    Quotes(Author:'هنا القائل' , Wisdom: 'هنا المقوله')
  ];
  addWords(){
   setState(() {
      wordS.add(Quotes(Author: AuthorContorller.text,Wisdom:WisdomContorller.text ));
   });
  }
  deletewords(int index){
    setState(() {
      wordS.remove(wordS[index]);
    });
    
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    Hive.box('Notes').close();
  }
  @override
  Widget build(BuildContext context) {

    //notess.add(value)
    return Scaffold(
      appBar:AppBar(
        backgroundColor: Color.fromARGB(255, 52, 11, 162),
        title:  Text('Note App')
        ,),
        body: wordS.length>0?  Padding(
          padding: const EdgeInsets.all(10.0),
          child: ListView.builder(
            scrollDirection: Axis.vertical,
            itemCount: wordS.length,
            physics:BouncingScrollPhysics(),
            itemBuilder: (context,index)=> Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  MyTepmlet(
                Author: wordS[index].Author,
                Wisdom: wordS[index].Wisdom,
                deleteword: deletewords,
                takss: index,
                ),
                ],
              ),
            )
              )
        ):Center(child: Image.asset('assets/image/iconn.png'),),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: ()=>
        showDialog(
        context: context,
        builder: (_) =>  Dialog(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(11) ),
                child: Container(
                 
                  padding: EdgeInsets.all(22),
                 
                  height: MediaQuery.of(context).size.height/2,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextField(
                        controller: WisdomContorller,
                          maxLength: 100,
                          decoration: InputDecoration(hintText: "wisdom"),
                        
                          ),
                          SizedBox(height: 10,),
                          TextField(
                         controller: AuthorContorller,
                          maxLength: 100,
                          decoration: InputDecoration(hintText: "author")
                          ),
                      SizedBox(
                        height: 10,
                      ),
                      TextButton(
                          onPressed: () {
                         addWords();
                         print('${wordS.length}');
                         WisdomContorller.clear();
                           AuthorContorller.clear();
                          },
                          child: Text(
                            "ADD",
                            style: TextStyle(fontSize: 22),
                          )
                          ),
                    ],
                  ),
                ),
              )
    )
    )
    );
  }
}
/*
Scaffold(
      appBar:AppBar(
        backgroundColor: Color.fromARGB(255, 52, 11, 162),
        title:  Text('Note App')
        ,),
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(

            children: [
           
              Container(
                padding: EdgeInsets.only(right: 10,left: 10),
                  decoration: BoxDecoration(
                     color: Colors.blue,
                     borderRadius: BorderRadius.circular(10)
                  ),
               // width: MediaQuery.of(context).size.width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text('sdsdssssss',textDirection:TextDirection.rtl ,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                     
                      IconButton(
                        onPressed: (){
                         
                        },
                         icon: Icon(Icons.delete),
                         ),
                          Text('asdasd'),
                    ],
                  ),
                ],
              ),
              ),
              FloatingActionButton(onPressed: (){})
            ],
          ),
        ),
    );



    Container(
          padding: EdgeInsets.all(20),
          color: Colors.amber,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                decoration: InputDecoration(
                  border:OutlineInputBorder() 
                ),
              ),
              SizedBox(height: 20,),
              TextField(
                decoration: InputDecoration(
                  border:OutlineInputBorder() 
                ),
              ),
            ],
          ),
        ) 
    */
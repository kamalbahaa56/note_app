import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class MyTepmlet extends StatelessWidget {
   MyTepmlet({Key? key,required this.Author,required this.Wisdom,required this.deleteword,required this.takss}) : super(key: key);
  String Wisdom ;
  String Author ;
  Function deleteword;
  int takss;
  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: Key(Wisdom),
    onDismissed: (direction) =>   deleteword(takss), 
      child: Container(
                  padding: EdgeInsets.only(right: 10,left: 10,top: 10),
                    decoration: BoxDecoration(
                       color: Colors.blue,
                       borderRadius: BorderRadius.circular(10)
                    ),
                 // width: MediaQuery.of(context).size.width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text('${Wisdom}',textDirection:TextDirection.rtl ,style: TextStyle(color: Colors.white,fontSize: 20),),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                       
                        IconButton(
                          onPressed: (){
                           deleteword(takss);
                          },
                           icon: Icon(Icons.delete,color: Colors.white),
                           ),
                            Text('${Author}',style: TextStyle(color: Colors.white,fontSize: 18),),
                      ],
                    ),
                  ],
                ),
                ),
    );
  }
}

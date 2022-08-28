import 'package:flutter/material.dart';
import 'package:hive_2/edit.dart';
import 'package:hive_2/model/student.dart';

class List_Tile extends StatefulWidget {
  List_Tile(this.student,this.index,{Key? key}) : super(key: key);

  Student student;
  int index;

  @override
  State<List_Tile> createState() => _ListTileState();
}

class _ListTileState extends State<List_Tile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        top: 10,
        bottom: 10
      ),
      width: double.infinity,
      height: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: Colors.redAccent
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(widget.student.name!),
          Text(widget.student.surname!),
          Text(widget.student.age!),
          ButtonTheme(
            minWidth: 40,
            buttonColor: Colors.white,
            child: MaterialButton(
                child: Icon(Icons.edit,size: 15,),
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> Edit(student: widget.student)));
            }),
          ),
          ButtonTheme(
            minWidth: 40,
            buttonColor: Colors.white,
            child: MaterialButton(
                child: Icon(Icons.delete,size: 15,),
                onPressed: (){
              widget.student.delete();
            }),
          ),
        ],
      ),
    );
  }
}

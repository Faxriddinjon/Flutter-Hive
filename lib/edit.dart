import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_2/main.dart';
import 'package:hive_2/model/student.dart';

class Edit extends StatefulWidget {
  Edit({this.student,Key? key}) : super(key: key);

  Student? student;
  @override
  State<Edit> createState() => _EditState();
}

class _EditState extends State<Edit> {
  @override
  Widget build(BuildContext context) {
    TextEditingController _name=TextEditingController(
      text: widget.student==null?null:widget.student!.name!
    );
    TextEditingController _surname=TextEditingController(
        text: widget.student==null?null:widget.student!.surname!
    );
    TextEditingController _age=TextEditingController(
        text: widget.student==null?null:widget.student!.age!
    );

    return Scaffold(
      backgroundColor: Colors.yellow,
        appBar: AppBar(
          title: Text(
            widget.student==null?"Add data":"Update data"
          ),
          centerTitle: true,
          elevation: 0.0,
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              TextField(
                controller: _name,
                decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(vertical: 0.0,horizontal: 15.0),
                  label: Text('Name'),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5)
                    )
                ),
              ),
              SizedBox(height: 10,),
              TextField(
                controller: _surname,
                decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(vertical: 0.0,horizontal: 15.0),
                    label: Text('Surname'),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5)
                  )
                ),
              ),
              SizedBox(height: 10,),
              TextField(
                controller: _age,
                decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(vertical: 0.0,horizontal: 15.0),
                    label: Text('Age'),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5)
                    )
                ),
              ),
              SizedBox(height: 10,),
              Expanded(
                child: Align(
                  alignment: FractionalOffset.bottomCenter,
                child: GestureDetector(
                    child: Container(
                      width: double.infinity,
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Colors.red
                      ),
                      child: Center(child: Text(
                          widget.student==null?"Add data":"Update data",
                        style: TextStyle(fontSize: 20,color: Colors.white),
                      ),),
                    ),
                    onTap: () async{
                        var newData=Student(
                          name: _name.text,
                          surname: _surname.text,
                          age: _age.text,
                        );
                        Box<Student> _box= Hive.box<Student>('students');
                        if(widget.student!=null){
                          widget.student!.name=_name.text;
                          widget.student!.surname=_surname.text;
                          widget.student!.age=_age.text;
                          widget.student!.save();

                          Navigator.of(context).pop();
                        } else{
                          await _box.add(newData);

                          Navigator.pop(context);
                        }
                    }
                ),),
              ),
              
            ],
          ),
        )
    );
  }
}

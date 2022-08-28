import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_2/listTile.dart';
import 'package:hive_2/model/student.dart';
import 'package:hive_flutter/adapters.dart';

import 'edit.dart';
import 'model/joyi.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();
  Hive.registerAdapter<Student>(StudentAdapter());
  //Hive.registerAdapter(JoyiAdapter());
  //Student _student=Student(name: 'Faxriddin',surname: 'Topvoldiyev',age: '21');
  //Joyi _joyi=Joyi(viloyat: 'Andijon',tuman: 'Jalaquduq',qishloq: 'Yorqishloq');
  var box=await Hive.openBox<Student>("students");
  // box.add(Student(name: 'Faxriddin',surname: "Topvoldiyev",age: "21"));
  // box.add(Student(name: 'Toxir',surname: 'Ilyosov',age: '29'));
  // box.add(Student(name: 'Akmal',surname: 'Ilhomov',age: '32'));
  // box.add(Student(name: 'Sharif',surname: 'Qodirov',age: '18'));
  // box.add(Student(name: 'Dilshod',surname: 'Olimov',age: '24'));


  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
      
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  int _increment=0;

  @override
  void dispose(){
    Hive.box('students').clear();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

   // ValueNotifier<Box<Student>> _valueNotifier= Hive.box<Student>("students") as ValueNotifier<Box<Student>>;
    return Scaffold(
      appBar: AppBar(
         title: Text('Hive'),
        centerTitle: true,
      ),
      body: ValueListenableBuilder<Box<Student>>(
        builder: (context, box, _){
          return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  Expanded(child: ListView.builder(
                      itemCount: box.values.length,
                      itemBuilder: (context, index) {
                        Student _student=box.getAt(index)!;
                       return List_Tile(_student, index);
                   }
                   ),
                  ),
                  MaterialButton(onPressed: (){
                    box.clear();
                  },
                    child: Text('Delete all'),
                  ),
                ],
              ),
            );
        },
        valueListenable: Hive.box<Student>('students').listenable(),

      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=> Edit()));

        },
        child: Icon(Icons.add),
      ),// This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

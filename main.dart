import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'result.dart';



main(){
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(appBar: AppBar(title: const Center(child: Text('SEARCH DATA API')),),
      body: MyProject(),
      ),
    );
  }
}



class MyProject extends StatefulWidget {
  MyProject({Key? key}) : super(key: key);

  @override
  State<MyProject> createState() => _MyProjectState();
}

class _MyProjectState extends State<MyProject> {

  TextEditingController _search = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
    
          Container(
            padding: EdgeInsets.all(20),
            child: TextField(
              controller: _search,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20)
                ),
                labelText: 'Search'
              ),
            ),
          ),
    
          Container(
            padding: EdgeInsets.all(20),
            child: ElevatedButton(onPressed: (){
              Navigator.of(context).push(MaterialPageRoute(builder: (context)=>MyResult(
                search: _search.text)));
            }, child: Text('SEARCH')),
          )
        ],
      ),
    );
  }
}

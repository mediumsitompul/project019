import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'datamodel.dart';


main(){
  runApp(MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}


class MyResult extends StatefulWidget {
  String search;
  MyResult({Key? key, required this.search}) : super(key: key);

  @override
  State<MyResult> createState() => _MyResultState();
}

class _MyResultState extends State<MyResult> {
  //111
  late final rawUrl = Uri.encodeFull("https://mediumsitompul.com/province/kabupatenkota.php?province_id=${widget.search}");
  //late final rawUrl = Uri.encodeFull("http://192.168.100.100:8087/search/index.php?province_id=${widget.search}");
  late final dataurl = Uri.parse(rawUrl.toString());
  bool error = false;
  bool dataloaded = false;
  var datajs;

  //222
  void loaddata() {
    Future.delayed(Duration.zero, () async {
      var res = await http.post(Uri.parse(dataurl.toString()));
      if (res.statusCode == 200) {
        setState(() {
          datajs = json.decode(res.body);
          dataloaded = true;
        });
      } else {
        setState(() {
          error = true;
        });
      }
    }); }

  //333
    @override
    void initState() {
    loaddata();
    super.initState();
  }


  //444
  Widget datalist() {
    List<DataModel> namelist = List<DataModel>.from(datajs["datajs"].map((i) {
      //return DataModel.fromJSON(i);
      return DataModel.fromJson(i);
    }));

    return
      ListView(
      children: [
      Table(
        border: TableBorder.all(width: 0.5),
        children: namelist.map((_datamodel) {
          return
          TableRow(children: [
            TableCell(//1
                child: Padding(
                    padding: EdgeInsets.all(1),
                    child: Container(
                      child: Text((_datamodel.idx)),
                      width: double.infinity,
                      color: Color.fromARGB(98, 216, 236, 183),
                      margin: EdgeInsets.all(1),
                      padding: EdgeInsets.all(1),
                    ))),
            TableCell(//2
                child: Padding(
                    padding: EdgeInsets.all(1),
                    child: Container(
                      child: Text((_datamodel.provinceId)),
                      width: double.infinity,
                      color: Color.fromARGB(98, 216, 236, 183),
                      margin: EdgeInsets.all(1),
                      padding: EdgeInsets.all(1),
                    ))),

            TableCell(//3
                child: Padding(
                    padding: EdgeInsets.all(1),
                    child: Container(
                      child: Text((_datamodel.regencyId)),
                      width: double.infinity,
                      color: Color.fromARGB(98, 216, 236, 183),
                      margin: EdgeInsets.all(1),
                      padding: EdgeInsets.all(1),
                    ))),

            TableCell(//3
                child: Padding(
                    padding: EdgeInsets.all(1),
                    child: Container(
                      child: Text((_datamodel.regencyName)),
                      width: double.infinity,
                      color: Color.fromARGB(98, 216, 236, 183),
                      margin: EdgeInsets.all(1),
                      padding: EdgeInsets.all(1),
                    ))),
          ]
          );
        }
        ).toList(),
      )
    ]
    );
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Result'),),
          body:
          Container(
          padding: const EdgeInsets.all(15),
          child:
          dataloaded
              ? datalist() //If success
              : const Center(child: CircularProgressIndicator()),
        ),
    );
  }


}

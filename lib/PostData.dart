import 'dart:convert';
import 'dart:developer';
import 'dart:typed_data';
import 'package:FlutterAnimations/Auth/SignUpPage.dart';
import 'package:FlutterAnimations/Constant/ColorGlobal.dart';
import 'package:FlutterAnimations/dbprovider.dart';
import 'package:FlutterAnimations/model.dart';
import 'package:FlutterAnimations/painter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:liquid_progress_indicator/liquid_progress_indicator.dart';
import 'package:http/http.dart' as http;
class PostData extends StatefulWidget {
  @override
  _PostDataState createState() => _PostDataState();
}

class _PostDataState extends State<PostData> {
  final DbManager dbManager = new DbManager();
  ProgressClassState progressClass= new ProgressClassState();
  TextEditingController resultMsg = TextEditingController();
  var result='Click here to Upload data to server!!!';
  bool visible= true;
  @override
  Widget build(BuildContext context) {

    return new MaterialApp(
        title: 'Flutter Demo',
        home: Scaffold(
            body: Column(
              children: <Widget> [
                SizedBox(height: 300,),
              Center(

                child:GestureDetector(
                  onTap: () {
                    progressClass.showLoaderDialog(context);
                    postDataToServer();
                  }, // handle your image tap here
                  child: Container(
                    child: Column(

                      children: <Widget>[

                    Visibility(
                      visible: visible,
                      child: Padding(
                        padding: const EdgeInsets.all(22.0),
                        child: Image.asset(
                          'assets/Icon/post.png',
                          // this is the solution for border
                          width: 110.0,
                          height: 110.0,
                        ),
                      ),
                    ),
                        
                        Text(result,
                          style: TextStyle(
                          fontFamily: ColorGlobal.fontName,
                          fontWeight: FontWeight.w600,
                          fontSize: 22,

                          color: ColorGlobal.darkerText,
                        ),
                        ),

                      ],
                      ),
                  ),
                  ),
                )],
            ))
    );
  }

  Future<void> postDataToServer() async {
   //debugger();
    List<Map<String,dynamic>> model2  =(await dbManager.getModelList());
    String m1 = jsonEncode(model2);
   // String m = jsonEncode(m1);
    String string = await m1.toString().trim();
    string = string.replaceAll("=", ":");
   //debugger();
 //   var a = jsonDecode(string);
   //debugger();
  //  String a1 = jsonDecode(a);
//    string = string.replaceAll("'\'", "");
//   String jsonFormattedString = string.replaceAll("'\\\'", "\"");
//   var b = json.decode(string);
 //  var b1 = json.decode(b);
    //debugger();

    print("getting from table");
    print("output dekho"+string);
    print(string);
  //  String m = jsonEncode(model2);
//    Map data = {
//      string
//    } as Map;

    var url ='http://164.100.137.95/seed/api/seed/SaveInspectionResult';
   //debugger();
    http.post(url,
        headers: {"Content-Type": "application/json"},
        body: string)
        .then((response) {

      print("Response status: ${response.statusCode}");
      print("Response body: ${response.body}");
      var data = json.decode(response.body);
      var STATUS_MSG = data["STATUS_MSG"];
      Navigator.pop(context);
        if(response.body.toString().contains("000")) {

          Fluttertoast.showToast(
                    msg: STATUS_MSG,
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.BOTTOM,
                    timeInSecForIosWeb: 2,
                    backgroundColor: Colors.red,
                    textColor: Colors.white,
                    fontSize: 16.0
                );
          setState(() {
            result = STATUS_MSG;
            visible = false;
          });
        }

        else{
          Fluttertoast.showToast(
              msg: STATUS_MSG,
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIosWeb: 2,
              backgroundColor: Colors.red,
              textColor: Colors.white,
              fontSize: 16.0
          );
        }
    });
   // //debugger();
  }

}



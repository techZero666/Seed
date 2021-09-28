import 'dart:convert';
import 'dart:developer';
import 'dart:ui';
import 'package:url_launcher/url_launcher.dart';
import 'package:FlutterAnimations/Animation/AnimationBuildHome.dart';
import 'package:FlutterAnimations/Auth/Login.dart';
import 'package:FlutterAnimations/Auth/SignUpPage.dart';
import 'package:FlutterAnimations/Constant/ColorGlobal.dart';
import 'package:FlutterAnimations/Constant/ReactForAnimation.dart';
import 'package:FlutterAnimations/FarmerListData.dart';
import 'package:FlutterAnimations/FeildDetails.dart';
import 'package:FlutterAnimations/InputHomeScreen.dart';
import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  @override
  _Home createState() => _Home();
}

class _Home extends State<HomePage> {
  var data;
  TextEditingController Teh = TextEditingController();
  TextEditingController Vil = TextEditingController();
  ProgressClassState progressClass= new ProgressClassState();
  String URL =
      "http://164.100.137.95/seed/api/seed/GetListForInspection";
  String dropdownValue = 'One';

  List <String> spinnerItems = [
    'Select Stage Of Crop',
    'Flowring',
    'Two',
  ] ;
  FarmerListData farmerListData;
  List<dynamic> listData;

  void initState() {
    // TODO: implement initState
    super.initState();
    listData=[];
    //debugger();
    internet();
  }

  @override
  Widget build(BuildContext context) {
    double c_width = MediaQuery.of(context).size.width * 0.3;
    double d_width = MediaQuery.of(context).size.width * 0.6;
    return Material(

      child: Hero(

        tag: 'blackBox',
        //  createRectTween: _createRectTween,
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          body: Column(
            children: [
              Container(
                height: 90,
                margin: EdgeInsets.only(top: 16),
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: ColorGlobal.whiteColor,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      spreadRadius: 1,
                     //n of shadow
                    ),
                  ],
                ),
                child: Row(

                  children: [

                    Expanded(
                      child: TextField(
                        controller: Teh,
                        decoration: InputDecoration(
                          labelText: 'District',
                        ),
                        style: TextStyle(fontSize: 14),),
                    ),
                    SizedBox(width: 8,),
                    Expanded(
                      child: TextField(
                        controller: Vil,
                        decoration: InputDecoration(
                          labelText: 'Village',
                        ),
                        style: TextStyle(fontSize: 14),
                      ),

                    ),

                    SizedBox(width: 8,),
                    Align(
                      alignment: Alignment.center,
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                         //   debugger();
                            getdataFromLocal();
                          });

                        }, // handle your image tap here
                        child: Image.asset(
                          'assets/Icon/filter.png',
                          fit: BoxFit.cover, // this is the solution for border
                          width: 22.0,
                          height: 22.0,
                        ),
                      ),
                    ),
                    SizedBox(width: 22,),
                    GestureDetector(
                      onTap: () {
                        progressClass.showLoaderDialog(context);
                        getData("");}, // handle your image tap here
                      child: Image.asset(
                        'assets/Icon/sync.png',
                        fit: BoxFit.cover, // this is the solution for border
                        width: 22.0,
                        height: 26.0,
                      ),
                    ),


                  ],
                ),
              ),


              Container(
                child: SingleChildScrollView(
                  child: Column(
                    children: <Widget>[
                      SizedBox(height: 16,),
                      Container(
                        margin: EdgeInsets.only(left: 15, right: 8, top: 0,bottom: 0),
                        child: Align(
                            alignment: Alignment.centerLeft,
                            child:  Text(
                              'User List',
                              style: TextStyle(
                                fontFamily: ColorGlobal
                                    .fontName,
                                fontWeight:
                                FontWeight.w800,
                                fontSize: 24,
                                color: ColorGlobal
                                    .darkerText,
                              ),
                            )),

                      ),
                      Container(

                        child: new ListView.builder(
                          padding: EdgeInsets.zero,
                          shrinkWrap: true,
                          physics: ScrollPhysics(),
                          itemCount: listData.length,
                          itemBuilder: (BuildContext ctxt, int index) {

                            // final x = listData[index];
                            //  print("ouputtest" + listData.toString());

                            int a =index;

                            return Visibility(
                              visible: checkVisibity(listData[index]['DistrictName'],listData[index]['WvName']),
                              child: GestureDetector(
                                onTap: (){
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) {
                                      return FeildDetails(text1: index);

                                    }),
                                  );
                                },

                                child: Container(
                                  height: 180,
                                  width: 250,

                                  margin:
                                  EdgeInsets.only(left: 16, right: 16, top: 8, bottom: 0),
                                  decoration: BoxDecoration(
                                    color: ColorGlobal.whiteColor,
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.2),
                                        spreadRadius: 1,
                                        blurRadius: 20,
                                        // changes position of shadow
                                      ),
                                    ],
                                    borderRadius: BorderRadius.all(Radius.circular(11)),
                                  ),
                                  child: new Column(
                                    children: <Widget>[

                                      Row(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: <Widget>[

                                          Container(
                                            width: 90,
                                            height: 180,
                                            decoration: BoxDecoration(

                                                color:
                                                ColorGlobal.colorPrimary),

                                            child: Column(
                                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                              children: <Widget>[

                                                Container(
                                                  height: 80,
                                                  width: 80,
                                                  child: GestureDetector(
                                                    onTap: () {
                                                   //   debugger();
                                                      _callNumber('tel:'+ listData[index]['Mobile']);}, // handle your image tap here
                                                    child: Padding(
                                                      padding: const EdgeInsets.all(22.0),
                                                      child: Image.asset(
                                                        'assets/Icon/call.png',
                                                        fit: BoxFit.cover, // this is the solution for border
                                                        width: 22.0,
                                                        height: 22.0,
                                                      ),
                                                    ),
                                                  ),
                                                ),

                                                Text(
                                                  ""+listData[index]['FarmerID'],
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                      fontSize: 16,
                                                      fontWeight: FontWeight.w600,
                                                      color: ColorGlobal.whiteColor),
                                                ),




//                                      Text(
//                                        "Jan",
//                                        textAlign: TextAlign.center,
//                                        style: TextStyle(
//                                            fontSize: 10,
//                                            fontWeight: FontWeight.w600,
//                                            color: ColorGlobal.blueColor),
//                                      ),
                                              ],
                                            ),
                                          ),

                                          Container(
                                            padding: EdgeInsets.all(8),
                                            margin: EdgeInsets.only(left: 10),
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              mainAxisAlignment: MainAxisAlignment.start,
                                              children: <Widget>[
                                                Row(
                                                  children: [
                                                    Text(
                                                      "Family ID:",
                                                      style: TextStyle(
                                                        fontFamily:
                                                        ColorGlobal.fontName,
                                                        fontWeight: FontWeight.w600,
                                                        fontSize: 18,
                                                        letterSpacing: -0.1,
                                                        color: ColorGlobal.grey,
                                                      ),),
                                                    SizedBox(width: 4,),
                                                    Text(
                                                      "" ""+listData[index]['FamilyID'],
                                                      style: TextStyle(
                                                        fontFamily:
                                                        ColorGlobal.fontName,
                                                        fontWeight: FontWeight.w500,
                                                        fontSize: 16,
                                                        letterSpacing: -0.1,
                                                        color: ColorGlobal.grey
                                                           ,
                                                      ),),
                                                  ],
                                                ),
                                                Row(
                                                  children: [
                                                    Text(
                                                      "Member Id:",
                                                      style: TextStyle(
                                                        fontFamily:
                                                        ColorGlobal.fontName,
                                                        fontWeight: FontWeight.w600,
                                                        fontSize: 18,
                                                        letterSpacing: -0.1,
                                                        color: ColorGlobal.grey
                                                            ,
                                                      ),),
                                                    SizedBox(width: 4,),
                                                    Text(
                                                      "" ""+listData[index]['MemberId'],
                                                      style: TextStyle(
                                                        fontFamily:
                                                        ColorGlobal.fontName,
                                                        fontWeight: FontWeight.w500,
                                                        fontSize: 16,
                                                        letterSpacing: -0.1,
                                                        color: ColorGlobal.grey
                                                            ,
                                                      ),),
                                                  ],
                                                ),
                                                Row(
                                                  children: [
                                                    Text(
                                                      "Mobile:",
                                                      style: TextStyle(
                                                        fontFamily:
                                                        ColorGlobal.fontName,
                                                        fontWeight: FontWeight.w600,
                                                        fontSize: 18,
                                                        letterSpacing: -0.1,
                                                        color: ColorGlobal.grey
                                                            ,
                                                      ),),
                                                    SizedBox(width: 4,),
                                                    Text(
                                                      "" ""+listData[index]['Mobile'],
                                                      style: TextStyle(
                                                        fontFamily:
                                                        ColorGlobal.fontName,
                                                        fontWeight: FontWeight.w500,
                                                        fontSize: 16,
                                                        letterSpacing: -0.1,
                                                        color: ColorGlobal.grey
                                                            ,
                                                      ),),
                                                  ],
                                                ),          Row(
                                                  children: [
                                                    Text(
                                                      "Name:",
                                                      style: TextStyle(
                                                        fontFamily:
                                                        ColorGlobal.fontName,
                                                        fontWeight: FontWeight.w600,
                                                        fontSize: 18,
                                                        letterSpacing: -0.1,
                                                        color: ColorGlobal.grey
                                                           ,
                                                      ),),
SizedBox(width: 4,),
                                                    Text(
                                                      "" ""+listData[index]['NameEng'],
                                                      style: TextStyle(
                                                        fontFamily:
                                                        ColorGlobal.fontName,
                                                        fontWeight: FontWeight.w500,
                                                        fontSize: 16,
                                                        letterSpacing: -0.1,
                                                        color: ColorGlobal.grey
                                                            ,
                                                      ),),
                                                  ],
                                                ),

                                                Row(
                                                  children: [
                                                    Text(
                                                      "S/D/O:",
                                                      style: TextStyle(
                                                        fontFamily:
                                                        ColorGlobal.fontName,
                                                        fontWeight: FontWeight.w600,
                                                        fontSize: 18,
                                                        letterSpacing: -0.1,
                                                        color: ColorGlobal.grey
                                                            ,
                                                      ),),
                                                    SizedBox(width: 4,),
                                                    Text(
                                                      "" ""+listData[index]['FNameEng'],
                                                      style: TextStyle(
                                                        fontFamily:
                                                        ColorGlobal.fontName,
                                                        fontWeight: FontWeight.w500,
                                                        fontSize: 16,
                                                        letterSpacing: -0.1,
                                                        color: ColorGlobal.grey
                                                           ,
                                                      ),),
                                                  ],
                                                ),

                                                Row(
                                                  children: [
                                                    Text(
                                                      "District Name:",
                                                      style: TextStyle(
                                                        fontFamily:
                                                        ColorGlobal.fontName,
                                                        fontWeight: FontWeight.w600,
                                                        fontSize: 18,
                                                        letterSpacing: -0.1,
                                                        color: ColorGlobal.grey
                                                            ,
                                                      ),),
                                                    SizedBox(width: 4,),
                                                    Text(
                                                      "" ""+listData[index]['DistrictName'],
                                                      style: TextStyle(
                                                        fontFamily:
                                                        ColorGlobal.fontName,
                                                        fontWeight: FontWeight.w500,
                                                        fontSize: 16,
                                                        letterSpacing: -0.1,
                                                        color: ColorGlobal.grey
                                                            ,
                                                      ),),
                                                  ],
                                                ),

                                                Row(
                                                  children: [
                                                    Text(
                                                      "Village:",
                                                      style: TextStyle(
                                                        fontFamily:
                                                        ColorGlobal.fontName,
                                                        fontWeight: FontWeight.w600,
                                                        fontSize: 18,
                                                        letterSpacing: -0.1,
                                                        color: ColorGlobal.grey
                                                           ,
                                                      ),),
                                                    SizedBox(width: 4,),
                                                    Text(
                                                      "" ""+listData[index]['WvName'],
                                                      style: TextStyle(
                                                        fontFamily:
                                                        ColorGlobal.fontName,
                                                        fontWeight: FontWeight.w500,
                                                        fontSize: 16,
                                                        letterSpacing: -0.1,
                                                        color: ColorGlobal.grey
                                                        ,
                                                      ),),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),

                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<List<dynamic>> getData(String s) async {

    Map<String, String> headers = {
      "Content-type": "application/json",
//      'OfficerCode': '7',
//      'UserType': 'testcm'
    };

    http.post(URL, body: headers).then((response) async {
      print("Response status: ${response.statusCode}");
      print("Response status: ${response.body}");

  //    try {

   //     if (response.body.toString().contains("000")) {
      //    Navigator.pop(context);
         //       data = json.decode(response.body);
        //  debugger();


          //  final body1 = json.decode(body) as List;
          Constants.pref = await SharedPreferences.getInstance();
          Constants.pref.setString("mobile", response.body.toString());

          // RESPONSE fact = RESPONSE.fromJson(list[0]);
          //debugger();
          // var body = datafetch['RESPONSE'];

      data = json.decode(Constants.pref.getString("mobile"));
     // debugger();
      getdataFromLocal();
      Navigator.pop(context);
//      setState(() {
//        listData = data['RESPONSE'];
//        print('Inserting $listData');
//        return listData;
//      });
  //            }
//        else{
//       //
//        }
//      } catch (e) {
//        print(e);
//      }
    });

  }

  static RectTween _createRectTween(Rect begin, Rect end) {
    return RectForAnimation(begin: begin, end: end);
//  return Future.delayed(Duration(microseconds: ),())
  }

  void getdataFromLocal() {
    data = json.decode(Constants.pref.getString("mobile"));
 //   debugger();
    setState(() {
      listData = data['RESPONSE'];
      print('Inserting $listData');
      return listData;
    });
  }

  Future<bool> check() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile) {
      return true;
    } else if (connectivityResult == ConnectivityResult.wifi) {
      return true;
    }
    return false;
  }

  void internet() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile) {
      // I am connected to a mobile network.
    // debugger();
      progressClass.showLoaderDialog(context);
      getData("s");
    } else  {
      // I am connected to a wifi network.
 ////   debugger();
      getdataFromLocal();
    }
  }


  Future<void> _callNumber(String url) async {
 //   debugger();;
      if (await canLaunch(url)) {
        await launch(url);
     //   debugger();
      } else {
        throw 'Could not launch $url';
      }
    }

  bool checkVisibity(String districtName,String village) {
    String m="",n="";
    try {
      districtName = districtName.toLowerCase();
      village = village.toLowerCase();
      m= Vil.text.toLowerCase();
      n = Teh.text.toLowerCase();
    } catch (e) {
      print(e);
    }
 // debugger();

    if(village.contains(m) && districtName.contains(n))
      {
  // debugger();
        return true;
      }

    else{
   //   debugger();
      return false;
    }

  }

}

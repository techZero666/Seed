import 'dart:convert';
import 'dart:ui';

import 'package:FlutterAnimations/Animation/AnimationBuildHome.dart';
import 'package:FlutterAnimations/Auth/Login.dart';
import 'package:FlutterAnimations/Auth/SignUpPage.dart';
import 'package:FlutterAnimations/Constant/ColorGlobal.dart';
import 'package:FlutterAnimations/Constant/ReactForAnimation.dart';
import 'package:FlutterAnimations/FarmerListData.dart';
import 'package:FlutterAnimations/HomePage/HomePage.dart';
import 'package:FlutterAnimations/InputHomeScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;

class InspectionList extends StatefulWidget {
  @override
  _InspectionList createState() => _InspectionList();
}

class _InspectionList extends State<InspectionList> with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation<Offset> offset;
  var data;
  ProgressClassState progressClass = new ProgressClassState();
  @override
  void initState() {
    super.initState();

    controller =
        AnimationController(vsync: this, duration: Duration(seconds: 1));

    offset = Tween<Offset>(begin:Offset(0.0, 1.0)  , end: Offset.zero)
        .animate(controller);

    controller.forward();
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
          backgroundColor: ColorGlobal.backgroundCard,
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(

              children: [
                SizedBox(height: 50,),
                Align(
                    alignment: Alignment.center,
                    child:    Text(
                      'Choose Inspection Step',
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
                SingleChildScrollView(
                  child: Container(
                    alignment: Alignment.center,

                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Column(
                                children: [
                                  Center(
                                    child: Column(
                                      children: [
                                        Material(

                                          child: InkWell(

                                            onTap: (){  Navigator.push(
                                              context,
                                              MaterialPageRoute(builder: (context) {
                                                return HomePage();
                                              }),
                                            );},
                                            child: Container(

                                              height: 160,
                                              width: 240,
                                              margin: EdgeInsets.only(
                                                  left: 0, right: 0, top: 16, bottom: 0),
                                              padding: EdgeInsets.only(
                                                  left: 8, right: 8, top: 8, bottom: 8),
                                              decoration: BoxDecoration(
                                                color: ColorGlobal.whiteColor,
                                                border: Border.all(
                                                  color: ColorGlobal.deactivatedText
                                                      .withOpacity(0.2),
                                                  //                   <--- border color
                                                  width: 1.0,
                                                ),
                                                boxShadow: [
                                                  BoxShadow(
                                                    color: Colors.grey.withOpacity(0.4),
                                                    spreadRadius: 1,
                                                    blurRadius: 20,

                                                    // changes position of shadow
                                                  ),
                                                ],
                                                borderRadius:
                                                    BorderRadius.all(Radius.circular(11)),
                                              ),
                                              child: new Column(
                                                mainAxisAlignment: MainAxisAlignment.center,
                                                children: <Widget>[
                                                  Row(
                                                    children: <Widget>[
                                                      Container(
                                                        child: Column(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment.center,
                                                          children: <Widget>[
//                                           PhysicalModel(
//                                             clipBehavior: Clip.antiAliasWithSaveLayer,
//                                             color: Colors.black,
//                                             shape: BoxShape.rectangle,
//                                             borderRadius: BorderRadius.circular(6),
                                                            Row(
                                                              children: [
                                                                SlideTransition(

                                                                  position: offset,
                                                                  child: Image.asset(
                                                                    "assets/Icon/number_1.png",
                                                                    fit: BoxFit.fill,
                                                                    width: 75,
                                                                    height: 80,
                                                                  ),
                                                                ),
                                                                Text(
                                                                  "st",
                                                                  style: TextStyle(
                                                                    fontFamily:
                                                                    ColorGlobal.fontName,
                                                                    fontWeight: FontWeight.w400,
                                                                    fontSize: 18,
                                                                    color:
                                                                    ColorGlobal.lightText,
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
//                                           ),
                                                          ],
                                                        ),
                                                      ),
                                                      Container(
                                                        margin: EdgeInsets.only(left: 10),
                                                        child: Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment.start,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment.start,
                                                          children: <Widget>[


                                                            Text(
                                                              "Inspection",
                                                              style: TextStyle(
                                                                fontFamily:
                                                                    ColorGlobal.fontName,
                                                                fontWeight: FontWeight.w800,
                                                                fontSize: 24,
                                                                color:
                                                                    ColorGlobal.lightText,
                                                              ),
                                                            ),
//                                           Row(
//                                             children: [
//                                               Text(
//                                                 "Feild\nInspection",
//                                                 style: TextStyle(
//                                                   fontFamily:
//                                                   ColorGlobal.fontName,
//                                                   fontWeight: FontWeight.w600,
//                                                   fontSize: 12,
//                                                   letterSpacing: -0.1,
//                                                   color: ColorGlobal.grey
//                                                       .withOpacity(0.5),
//                                                 ),),
//                                             ],
//                                           ),
                                                          ],
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),

                                        Container(
                                          height: 160,
                                          width: 240,
                                          margin: EdgeInsets.only(
                                              left: 0, right: 0, top: 16, bottom: 0),
                                          padding: EdgeInsets.only(
                                              left: 8, right: 8, top: 8, bottom: 8),
                                          decoration: BoxDecoration(
                                            color: ColorGlobal.whiteColor,
                                            border: Border.all(
                                              color: ColorGlobal.deactivatedText
                                                  .withOpacity(0.2),
                                              //                   <--- border color
                                              width: 1.0,
                                            ),
                                            boxShadow: [
                                              BoxShadow(
                                                color: Colors.grey.withOpacity(0.3),
                                                spreadRadius: 1,
                                                blurRadius: 20,

                                                // changes position of shadow
                                              ),
                                            ],
                                            borderRadius:
                                                BorderRadius.all(Radius.circular(11)),
                                          ),
                                          child: new Column(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: <Widget>[
                                              Row(
                                                children: <Widget>[
                                                  Container(
                                                    child: Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment.center,
                                                      children: <Widget>[
//                                           PhysicalModel(
//                                             clipBehavior: Clip.antiAliasWithSaveLayer,
//                                             color: Colors.black,
//                                             shape: BoxShape.rectangle,
//                                             borderRadius: BorderRadius.circular(6),
                                                        Row(
                                                          children: [
                                                            SlideTransition(

                                                              position: offset,
                                                              child: Image.asset(
                                                                "assets/Icon/number_2.png",
                                                                fit: BoxFit.fill,
                                                                width: 75,
                                                                height: 80,
                                                              ),
                                                            ),
                                                            Text(
                                                              "nd",
                                                              style: TextStyle(
                                                                fontFamily:
                                                                ColorGlobal.fontName,
                                                                fontWeight: FontWeight.w400,
                                                                fontSize: 18,
                                                                color:
                                                                ColorGlobal.lightText,
                                                              ),
                                                            ),
                                                          ],
                                                        ),
//                                           ),
                                                      ],
                                                    ),
                                                  ),
                                                  Container(
                                                    margin: EdgeInsets.only(left: 10),
                                                    child: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment.start,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment.start,
                                                      children: <Widget>[
                                                        Text(
                                                          "Inspection",
                                                          style: TextStyle(
                                                            fontFamily:
                                                                ColorGlobal.fontName,
                                                            fontWeight: FontWeight.w800,
                                                            fontSize: 24,
                                                            color:
                                                                ColorGlobal.lightText,
                                                          ),
                                                        ),
//                                           Row(
//                                             children: [
//                                               Text(
//                                                 "Feild\nInspection",
//                                                 style: TextStyle(
//                                                   fontFamily:
//                                                   ColorGlobal.fontName,
//                                                   fontWeight: FontWeight.w600,
//                                                   fontSize: 12,
//                                                   letterSpacing: -0.1,
//                                                   color: ColorGlobal.grey
//                                                       .withOpacity(0.5),
//                                                 ),),
//                                             ],
//                                           ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),

                                        Container(
                                          height: 160,
                                          width: 240,
                                          margin: EdgeInsets.only(
                                              left: 0, right: 0, top: 16, bottom: 0),
                                          padding: EdgeInsets.only(
                                              left: 8, right: 8, top: 8, bottom: 8),
                                          decoration: BoxDecoration(
                                            color: ColorGlobal.whiteColor,
                                            border: Border.all(
                                              color: ColorGlobal.deactivatedText
                                                  .withOpacity(0.2),
                                              //                   <--- border color
                                              width: 1.0,
                                            ),
                                            boxShadow: [
                                              BoxShadow(
                                                color: Colors.grey.withOpacity(0.3),
                                                spreadRadius: 1,
                                                blurRadius: 20,

                                                // changes position of shadow
                                              ),
                                            ],
                                            borderRadius:
                                                BorderRadius.all(Radius.circular(11)),
                                          ),
                                          child: new Column(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: <Widget>[
                                              Row(
                                                children: <Widget>[
                                                  Container(
                                                    child: Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment.center,
                                                      children: <Widget>[
//                                           PhysicalModel(
//                                             clipBehavior: Clip.antiAliasWithSaveLayer,
//                                             color: Colors.black,
//                                             shape: BoxShape.rectangle,
//                                             borderRadius: BorderRadius.circular(6),
                                                        Row(
                                                          children: [
                                                            SlideTransition(

                                                              position: offset,
                                                              child: Image.asset(
                                                                "assets/Icon/numbre_3.png",
                                                                fit: BoxFit.fill,
                                                                width: 75,
                                                                height: 80,
                                                              ),
                                                            ),
                                                            Text(
                                                              "rd",
                                                              style: TextStyle(
                                                                fontFamily:
                                                                ColorGlobal.fontName,
                                                                fontWeight: FontWeight.w400,
                                                                fontSize: 18,
                                                                color:
                                                                ColorGlobal.lightText,
                                                              ),
                                                            ),
                                                          ],
                                                        ),
//                                           ),
                                                      ],
                                                    ),
                                                  ),
                                                  Container(
                                                    margin: EdgeInsets.only(left: 10),
                                                    child: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment.start,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment.start,
                                                      children: <Widget>[
                                                        Text(
                                                          "Inspection",
                                                          style: TextStyle(
                                                            fontFamily:
                                                                ColorGlobal.fontName,
                                                            fontWeight: FontWeight.w800,
                                                            fontSize: 24,
                                                            color:
                                                                ColorGlobal.lightText,
                                                          ),
                                                        ),
//                                           Row(
//                                             children: [
//                                               Text(
//                                                 "Feild\nInspection",
//                                                 style: TextStyle(
//                                                   fontFamily:
//                                                   ColorGlobal.fontName,
//                                                   fontWeight: FontWeight.w600,
//                                                   fontSize: 12,
//                                                   letterSpacing: -0.1,
//                                                   color: ColorGlobal.grey
//                                                       .withOpacity(0.5),
//                                                 ),),
//                                             ],
//                                           ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),

                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

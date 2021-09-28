import 'dart:convert';
import 'dart:ui';
import 'package:permission_handler/permission_handler.dart';
import 'package:FlutterAnimations/Animation/AnimationBuildHome.dart';
import 'package:FlutterAnimations/Auth/Login.dart';
import 'package:FlutterAnimations/Auth/SignUpPage.dart';
import 'package:FlutterAnimations/Constant/ColorGlobal.dart';
import 'package:FlutterAnimations/Constant/ReactForAnimation.dart';
import 'package:FlutterAnimations/FarmerListData.dart';
import 'package:FlutterAnimations/InputHomeScreen.dart';
import 'package:FlutterAnimations/InspectionList.dart';
import 'package:FlutterAnimations/PostData.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';



class PermissionsService {
final PermissionHandler permissionHandler = PermissionHandler();
}

class ModulePage extends StatefulWidget {
  @override
  _ModulePage createState() => _ModulePage();
}

class _ModulePage extends State<ModulePage> {
  var data;
  ProgressClassState progressClass = new ProgressClassState();

  void initState() {
    // TODO: implement initState
    super.initState();
    permissionAcessPhone();
  }
  Future permissionAcessPhone() {
    PermissionService().requestPermission(onPermissionDenied: () {
      print('Permission has been denied');
    });
  }

  @override
  Widget build(BuildContext context) {
    double c_width = MediaQuery
        .of(context)
        .size
        .width * 0.3;
    double d_width = MediaQuery
        .of(context)
        .size
        .width * 0.6;
    return Material(

      child: Hero(

        tag: 'blackBox',
        //  createRectTween: _createRectTween,
        child: Scaffold(

          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  height: 160,
                  child: Stack(
                    children: <Widget>[
                      AnimationBuild(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Expanded(
                            child: Container(
                              margin: EdgeInsets.only(top: 40, left: 20),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Container(
                                    child: Text(
                                      "Home",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          color: ColorGlobal.whiteColor,
                                          fontSize: 24),
                                    ),
                                  ),
                                  Container(
                                    child: Text(
                                      "Welcome home, Deepak",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          color: ColorGlobal.whiteColor,
                                          fontSize: 18),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),

                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) {
                                    return PostData();
                                  }));
                            },
                            child: Container(
                              height: 35,
                              width: 40,
                              margin: EdgeInsets.only(top: 50, right: 20),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border:
                                Border.all(color: Colors.white, width: 1.5),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Image.asset(
                                  "assets/Icon/upload.png",
                                  width: 24,
                                  height: 20,),
                              ),
                            ),

                          ),
                          GestureDetector(
                            onTap: () {

                              showAlertDialog(context);
                            },
                            child: Container(
                              height: 35,
                              width: 40,
                              margin: EdgeInsets.only(top: 50, right: 20),
//                              decoration: BoxDecoration(
//                                shape: BoxShape.circle,
//                                border:
//                                Border.all(color: Colors.white, width: 1.5),
//                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(2.0),
                                child: Image.asset(
                                  "assets/Icon/logout.png",
                                  width: 28,
                                  height: 38,),
                              ),
                            ),

                          ),

                         

                        ],
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) {
                                return InspectionList();
                              }),
                            );
                          },

                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [

                              Container(


                                child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    "Category",
                                    style: TextStyle(
                                      fontFamily: ColorGlobal
                                          .fontName,
                                      fontWeight:
                                      FontWeight.w900,
                                      fontSize: 22,
                                      color: ColorGlobal
                                          .darkerText,
                                    ),
                                  ),
                                ),
                              ),

                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Expanded(
                                    child: Container(
                                      height: 120,

                                      margin: EdgeInsets.only(left: 0,
                                          right: 0,
                                          top: 16,
                                          bottom: 0),
                                      padding: EdgeInsets.only(
                                          left: 8, right: 8, top: 8, bottom: 8),

                                      decoration: BoxDecoration(
                                        color: ColorGlobal.backgroundCard
                                            .withOpacity(0.5),
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
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(11)),
                                      ),
                                      child: new Column(
                                        mainAxisAlignment: MainAxisAlignment
                                            .center,
                                        children: <Widget>[
                                          Row(
                                            children: <Widget>[
                                              Container(


                                                child: Column(
                                                  mainAxisAlignment: MainAxisAlignment
                                                      .center,
                                                  children: <Widget>[
                                                    PhysicalModel(
                                                      clipBehavior: Clip
                                                          .antiAliasWithSaveLayer,
                                                      color: Colors.black,
                                                      shape: BoxShape.rectangle,
                                                      borderRadius: BorderRadius
                                                          .circular(6),
                                                      child: Image.asset(
                                                        "assets/Icon/inspection.jpg",
                                                        fit: BoxFit.fill,
                                                        width: 75,
                                                        height: 80,),
                                                    ),

                                                  ],
                                                ),
                                              ),
                                              Container(
                                                margin: EdgeInsets.only(
                                                    left: 10),
                                                child: Column(
                                                  crossAxisAlignment: CrossAxisAlignment
                                                      .start,
                                                  mainAxisAlignment: MainAxisAlignment
                                                      .start,
                                                  children: <Widget>[
                                                    Text(
                                                      "Inspection\nModule",
                                                      style: TextStyle(
                                                        fontFamily: ColorGlobal
                                                            .fontName,
                                                        fontWeight:
                                                        FontWeight.w900,
                                                        fontSize: 16,
                                                        color: ColorGlobal
                                                            .darkerText,
                                                      ),
                                                    ),
                                                    Row(
                                                      children: [
                                                        Text(
                                                          "Feild\nInspection",
                                                          style: TextStyle(
                                                            fontFamily:
                                                            ColorGlobal
                                                                .fontName,
                                                            fontWeight: FontWeight
                                                                .w600,
                                                            fontSize: 12,
                                                            letterSpacing: -0.1,
                                                            color: ColorGlobal
                                                                .grey
                                                                .withOpacity(
                                                                0.5),
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
                                  SizedBox(width: 16,),
                                  Expanded(
                                      child: Container(
                                        height: 120,

                                        margin: EdgeInsets.only(left: 0,
                                            right: 0,
                                            top: 16,
                                            bottom: 0),
                                        padding: EdgeInsets.only(left: 8,
                                            right: 8,
                                            top: 8,
                                            bottom: 8),

                                        decoration: BoxDecoration(
                                          color: ColorGlobal.backgroundCard
                                              .withOpacity(0.5),
                                          border: Border.all(
                                            color: ColorGlobal.deactivatedText
                                                .withOpacity(0.2),
                                            //                   <--- border color
                                            width: 1.0,
                                          ),
                                          boxShadow: [
                                            BoxShadow(
                                              color: Colors.grey.withOpacity(
                                                  0.3),
                                              spreadRadius: 1,
                                              blurRadius: 20,

                                              // changes position of shadow
                                            ),
                                          ],
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(11)),
                                        ),
                                        child: new Column(
                                          mainAxisAlignment: MainAxisAlignment
                                              .center,
                                          children: <Widget>[
                                            Row(
                                              children: <Widget>[
                                                Container(


                                                  child: Column(
                                                    mainAxisAlignment: MainAxisAlignment
                                                        .center,
                                                    children: <Widget>[
                                                      PhysicalModel(
                                                        clipBehavior: Clip
                                                            .antiAliasWithSaveLayer,
                                                        color: Colors.black,
                                                        shape: BoxShape
                                                            .rectangle,
                                                        borderRadius: BorderRadius
                                                            .circular(6),
                                                        child: Image.asset(
                                                          "assets/Icon/inspection.jpg",
                                                          fit: BoxFit.fill,
                                                          width: 75,
                                                          height: 80,),
                                                      ),

                                                    ],
                                                  ),
                                                ),
                                                Container(
                                                  margin: EdgeInsets.only(
                                                      left: 10),
                                                  child: Column(
                                                    crossAxisAlignment: CrossAxisAlignment
                                                        .start,
                                                    mainAxisAlignment: MainAxisAlignment
                                                        .start,
                                                    children: <Widget>[
                                                      Text(
                                                        "Inspection\n"
                                                            "Module",
                                                        style: TextStyle(
                                                          fontFamily: ColorGlobal
                                                              .fontName,
                                                          fontWeight:
                                                          FontWeight.w900,
                                                          fontSize: 16,
                                                          color: ColorGlobal
                                                              .darkerText,
                                                        ),
                                                      ),
                                                      Row(
                                                        children: [
                                                          Text(
                                                            "Feild\nInspection",
                                                            style: TextStyle(
                                                              fontFamily:
                                                              ColorGlobal
                                                                  .fontName,
                                                              fontWeight: FontWeight
                                                                  .w600,
                                                              fontSize: 12,
                                                              letterSpacing: -0.1,
                                                              color: ColorGlobal
                                                                  .grey
                                                                  .withOpacity(
                                                                  0.5),
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
                                      )),
                                ],
                              ), Row(
                                crossAxisAlignment: CrossAxisAlignment.start,

                                children: [

                                  Expanded(
                                    child: Container(
                                      height: 120,

                                      margin: EdgeInsets.only(left: 0,
                                          right: 0,
                                          top: 16,
                                          bottom: 0),
                                      padding: EdgeInsets.only(
                                          left: 8, right: 8, top: 8, bottom: 8),

                                      decoration: BoxDecoration(
                                        color: ColorGlobal.backgroundCard
                                            .withOpacity(0.5),
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
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(11)),
                                      ),
                                      child: new Column(
                                        mainAxisAlignment: MainAxisAlignment
                                            .center,
                                        children: <Widget>[
                                          Row(
                                            children: <Widget>[
                                              Container(


                                                child: Column(
                                                  mainAxisAlignment: MainAxisAlignment
                                                      .center,
                                                  children: <Widget>[
                                                    PhysicalModel(
                                                      clipBehavior: Clip
                                                          .antiAliasWithSaveLayer,
                                                      color: Colors.black,
                                                      shape: BoxShape.rectangle,
                                                      borderRadius: BorderRadius
                                                          .circular(6),
                                                      child: Image.asset(
                                                        "assets/Icon/inspection.jpg",
                                                        fit: BoxFit.fill,
                                                        width: 75,
                                                        height: 80,),
                                                    ),

                                                  ],
                                                ),
                                              ),
                                              Container(
                                                margin: EdgeInsets.only(
                                                    left: 10),
                                                child: Column(
                                                  crossAxisAlignment: CrossAxisAlignment
                                                      .start,
                                                  mainAxisAlignment: MainAxisAlignment
                                                      .start,
                                                  children: <Widget>[
                                                    Text(
                                                      "Inspection\nModule",
                                                      style: TextStyle(
                                                        fontFamily: ColorGlobal
                                                            .fontName,
                                                        fontWeight:
                                                        FontWeight.w900,
                                                        fontSize: 16,
                                                        color: ColorGlobal
                                                            .darkerText,
                                                      ),
                                                    ),
                                                    Row(
                                                      children: [
                                                        Text(
                                                          "Feild\nInspection",
                                                          style: TextStyle(
                                                            fontFamily:
                                                            ColorGlobal
                                                                .fontName,
                                                            fontWeight: FontWeight
                                                                .w600,
                                                            fontSize: 12,
                                                            letterSpacing: -0.1,
                                                            color: ColorGlobal
                                                                .grey
                                                                .withOpacity(
                                                                0.5),
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
                                  SizedBox(width: 16,),
                                  Expanded(
                                      child: Container(
                                        height: 120,

                                        margin: EdgeInsets.only(left: 0,
                                            right: 0,
                                            top: 16,
                                            bottom: 0),
                                        padding: EdgeInsets.only(left: 8,
                                            right: 8,
                                            top: 8,
                                            bottom: 8),

                                        decoration: BoxDecoration(
                                          color: ColorGlobal.backgroundCard
                                              .withOpacity(0.5),
                                          border: Border.all(
                                            color: ColorGlobal.deactivatedText
                                                .withOpacity(0.2),
                                            //                   <--- border color
                                            width: 1.0,
                                          ),
                                          boxShadow: [
                                            BoxShadow(
                                              color: Colors.grey.withOpacity(
                                                  0.3),
                                              spreadRadius: 1,
                                              blurRadius: 20,

                                              // changes position of shadow
                                            ),
                                          ],
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(11)),
                                        ),
                                        child: new Column(
                                          mainAxisAlignment: MainAxisAlignment
                                              .center,
                                          children: <Widget>[
                                            Row(
                                              children: <Widget>[
                                                Container(


                                                  child: Column(
                                                    mainAxisAlignment: MainAxisAlignment
                                                        .center,
                                                    children: <Widget>[
                                                      PhysicalModel(
                                                        clipBehavior: Clip
                                                            .antiAliasWithSaveLayer,
                                                        color: Colors.black,
                                                        shape: BoxShape
                                                            .rectangle,
                                                        borderRadius: BorderRadius
                                                            .circular(6),
                                                        child: Image.asset(
                                                          "assets/Icon/inspection.jpg",
                                                          fit: BoxFit.fill,
                                                          width: 75,
                                                          height: 80,),
                                                      ),

                                                    ],
                                                  ),
                                                ),
                                                Container(
                                                  margin: EdgeInsets.only(
                                                      left: 10),
                                                  child: Column(
                                                    crossAxisAlignment: CrossAxisAlignment
                                                        .start,
                                                    mainAxisAlignment: MainAxisAlignment
                                                        .start,
                                                    children: <Widget>[
                                                      Text(
                                                        "Inspection\n"
                                                            "Module",
                                                        style: TextStyle(
                                                          fontFamily: ColorGlobal
                                                              .fontName,
                                                          fontWeight:
                                                          FontWeight.w900,
                                                          fontSize: 16,
                                                          color: ColorGlobal
                                                              .darkerText,
                                                        ),
                                                      ),
                                                      Row(
                                                        children: [
                                                          Text(
                                                            "Feild\nInspection",
                                                            style: TextStyle(
                                                              fontFamily:
                                                              ColorGlobal
                                                                  .fontName,
                                                              fontWeight: FontWeight
                                                                  .w600,
                                                              fontSize: 12,
                                                              letterSpacing: -0.1,
                                                              color: ColorGlobal
                                                                  .grey
                                                                  .withOpacity(
                                                                  0.5),
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
                                      )),
                                ],
                              ),
                            ],
                          )
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class PermissionService{
  final PermissionHandler _permissionHandler = PermissionHandler();

  Future<bool> _requestPermission() async {
    var result = await _permissionHandler.requestPermissions([PermissionGroup.storage,PermissionGroup.contacts,PermissionGroup.sms]);
    if (result == PermissionStatus.granted) {
      return true;
    }
    return false;
  }

  Future<bool> requestPermission({Function onPermissionDenied}) async {
    var granted = await _requestPermission();
    if (!granted) {
      onPermissionDenied();
    }
    return granted;
  }

  Future<bool> hasPhonePermission() async {
    return hasPermission(PermissionGroup.storage);
  }

  Future<bool> hasPermission(PermissionGroup permission) async {
    var permissionStatus =
    await _permissionHandler.checkPermissionStatus(permission);
    return permissionStatus == PermissionStatus.granted;
  }
}


showAlertDialog(BuildContext context) {
  Widget cancleButton = TextButton(
    child: Text("Cancel",style: TextStyle(fontSize: 18),),
    onPressed: () {
      Navigator.pop(context);
    },
  );
  // set up the button
  Widget okButton = TextButton(
    child: Text("Ok",style: TextStyle(fontSize: 18),),
    onPressed: () {
      Constants.pref.setBool("loggedIn", false);
      Navigator.pop(context,true);
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) {
            return Login();
          }));
    },
  );



  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title: Text("Are you sure want to logout?"),
    actions: [

      cancleButton,
      okButton
    ],
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
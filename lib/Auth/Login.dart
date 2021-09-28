import 'dart:convert';
import 'dart:developer';

import 'package:FlutterAnimations/FeildDetails.dart';
import 'package:FlutterAnimations/HomePage/ModulePage.dart';
import 'package:FlutterAnimations/InspectionList.dart';
import 'package:FlutterAnimations/InspectionModule.dart';
import 'package:FlutterAnimations/drawpath.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:page_transition/page_transition.dart';
import 'package:FlutterAnimations/Animation/AnimationBuildLogin.dart';
import 'package:FlutterAnimations/Constant/ColorGlobal.dart';
import 'package:FlutterAnimations/Constant/TextField.dart';
import 'package:FlutterAnimations/Constant/frequentWidget.dart';
import 'package:FlutterAnimations/HomePage/HomePage.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../InputHomeScreen.dart';
import 'AuthButton.dart';
import 'SignUpPage.dart';


class Login extends StatefulWidget {
  @override
  LoginState createState() {
    return new LoginState();
  }

}

class LoginState extends State<Login> {
  var top = FractionalOffset.topCenter;
  var bottom = FractionalOffset.bottomCenter;
  double width = 190.0;
  double widthIcon = 200.0;
  var data;
  TextEditingController email = new TextEditingController();
  TextEditingController password = new TextEditingController();

  FocusNode emailFocus = new FocusNode();
  FocusNode passwordFocus = new FocusNode();


  getDisposeController() {
    email.clear();
    password.clear();
    emailFocus.unfocus();
    passwordFocus.unfocus();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getDisposeController();
  }

  @override
  void dispose() {
    getDisposeController();
    // TODO: implement dispose
    super.dispose();
  }

  var list = [
    Colors.lightGreen,
    Colors.redAccent,
  ];

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery
        .of(context)
        .size;
    final bool keyboardOpen = MediaQuery
        .of(context)
        .viewInsets
        .bottom > 0;

    return Scaffold(
      backgroundColor: ColorGlobal.whiteColor,
      body: SingleChildScrollView(
        child: Container(
          child: Stack(
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(),
                height: size.height,
                decoration: BoxDecoration(
                  gradient: new LinearGradient(
                    colors: [
                      ColorGlobal.colorPrimaryDark,
                      ColorGlobal.colorPrimary,
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
              ),
              AnimatedPositioned(
                duration: Duration(milliseconds: 500),
                curve: Curves.easeOutQuad,
//                top: keyboardOpen ? -size.height / 3.2 : 0.0,
                child: AnimationBuildLogin(
                  size: size,
                  yOffset: size.height / (1.28),
                  color: ColorGlobal.whiteColor,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: (70)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Image.asset(
                      'assets/Icon/seed.png',
                      height: 120,
                      width: 130,

//                      color: ColorGlobal.whiteColor,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: (200)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'Seed Production Program ',
                      style: TextStyle(
                        color: ColorGlobal.whiteColor,
                        fontSize: 24.0,
                        letterSpacing: 1,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  right: 22,
                  left: 22,
                  bottom: 22,
                  top: 260,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Container(

                      child: TextFieldWidget(
                          hintText: 'User ID',
                          length: 30,
                          obscureText: false,
                          prefixIconData: Icons.person,
                          textEditingController: email,
                          focusNode: emailFocus

                      ),
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    Container(
                      child: TextFieldWidget(
                        hintText: 'Password',
                        length: 12,
                        obscureText: true,
                        prefixIconData: Icons.lock,
                        textEditingController: password,
                        focusNode: passwordFocus,
                      ),
                    ),
//                    Container(
//                      margin: EdgeInsets.only(right: 8, top: (18)),
//                      child: Text(
//                        "Forget Password ?",
//                        textAlign: TextAlign.end,
//                        style: TextStyle(
//                          fontSize: 18,
//                          color: ColorGlobal.whiteColor.withOpacity(0.9),
//                          fontWeight: FontWeight.w600,
//                        ),
//                      ),
//                    ),
                    Container(
                        alignment: Alignment.center,
                        color: Colors.transparent,
                        margin: EdgeInsets.only(
                          top: (20),
                          right: (8),
                          left: (8),
                          bottom: (20),
                        ),

                        child: AuthButton(
                          userId: email.text, password: password.text,)
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        color: ColorGlobal.whiteColor,
        height: 100,
        alignment: Alignment.center,

        child: Column(
          children: <Widget>[
            Center(
              child: Center(
                child: getAuth(
                  "assets/Icon/nic.jpg",
                  //    margin: EdgeInsets.only(right: 30.0),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void login(String username, String Pwd, BuildContext context) {

//    Map<String, String> headers = {"Content-type": "application/json",
//      'SearchParam': username.toString() , 'Password': Pwd.toString() ,
//      'Device_ID': '12345678901234567890'
//    };
//
//    var url = "http://164.100.137.137/AppointVC/api/VC/LoginVCUser";
//    http.post(url, body: headers)
//        .then((response) {
//      try {
//        Navigator.pop(context);
//        data = json.decode(response.body);
//        print("Response body: ${data}");
//        print("Response body: ${response.body}");
//        if(response.body.toString().contains("000"))
//              {
//
//              //  _controller.forward();
//              }
//              else{
//                Fluttertoast.showToast(
//                    msg: "Invalid UserName & Password",
//                    toastLength: Toast.LENGTH_SHORT,
//                    gravity: ToastGravity.BOTTOM,
//                    timeInSecForIosWeb: 2,
//                    backgroundColor: Colors.red,
//                    textColor: Colors.white,
//                    fontSize: 16.0
//                );
//              }
//      } catch (e) {
//        Navigator.pop(context);
//        print(e);
//      }
    Constants.pref.setBool("loggedIn", true);
    nextScreen(context);

      }

      //);
  }


  Future<void> nextScreen(BuildContext context) async {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) {
        return ModulePage();
      }),
    );

//    Constants.pref = await SharedPreferences.getInstance();
//    runApp(
//
////      MaterialApp(title: "My Flutter App", home: Constants.pref!.getBool("loggedIn")==true ? HomePage() : HomePage(),
////        routes: {
////          "/login": (context) => HomePage(),
//////          "/home" : (context) => HomePage()
//      // },),
//    );
  }




class Constants {
  static SharedPreferences pref;

  static double padding=2;
}


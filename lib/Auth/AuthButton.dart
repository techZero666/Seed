import 'dart:convert';
import 'dart:core';
import 'dart:developer';
import 'package:FlutterAnimations/Auth/Login.dart';
import 'package:FlutterAnimations/Constant/ColorGlobal.dart';
import 'package:FlutterAnimations/Constant/TextField.dart';
import 'package:FlutterAnimations/HomePage/HomePage.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/foundation.dart';

class AuthButton extends StatefulWidget {
  final String userId; // receives the value
  final String password; // receives the value

  AuthButton({ this.userId ,  this.password});
  @override
  _AuthButtonState createState() => _AuthButtonState();
}
typedef Widget DisplayType({@required final String text,@required final String text2});
class _AuthButtonState extends State<AuthButton> with TickerProviderStateMixin {
  String _buttonText = 'BUY TICKET';

   AnimationController _controller;
   Animation _roundnessAnimation;

  final LoginState loginClass= new LoginState();


  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: Duration(
        milliseconds: 500,
      ),
    )..addListener(() {
      setState(() {});
    });

    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) {
            return HomePage();
          }),
        );
      }
    });

    _roundnessAnimation = Tween(begin: 10.0, end: 25.0).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.linear,
    ));

  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: GestureDetector(
        onTap: () {
          setState(() {
            if(widget.userId.isEmpty)
            {
             toast("UserID");
            }
            else if(widget.password.isEmpty)
              {
                toast("Password");
              }

            else{
             // showLoaderDialog(context);
              loginClass.login(widget.userId,widget.password,context);
            }
            //Starts animation
          });
        },
        child: Hero(
          tag: 'blackBox',
          flightShuttleBuilder: (
              BuildContext flightContext,
              Animation<double> animation,
              HeroFlightDirection flightDirection,
              BuildContext fromHeroContext,
              BuildContext toHeroContext,
              ) {
            return Container(
              decoration: BoxDecoration(
                color: ColorGlobal.colorPrimaryDark,
                shape: BoxShape.circle,
              ),
            );
          },
          child: Container(
            height: (60.0),
            decoration: BoxDecoration(
                gradient: new LinearGradient(
                  colors: [
                    ColorGlobal.whiteColor,
                    ColorGlobal.whiteColor.withOpacity(0.7),
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                boxShadow: [
                  BoxShadow(
                    color: ColorGlobal.colorPrimary.withOpacity(0.6),
                    spreadRadius: 5,
                    blurRadius: 20,
                    // changes position of shadow
                  ),
                ],
                border: Border.all(
                  width: 2,
                  color: ColorGlobal
                      .colorPrimaryDark, //                   <--- border width here
                ),
                color: ColorGlobal.whiteColor,
                borderRadius: BorderRadius.all(Radius.circular((22.0)))),
            child: Container(
//                        margin: EdgeInsets.only(left: (10)),
              alignment: Alignment.center,
              child: Text(
                "SIGN IN",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18,
                  letterSpacing: 1,
                  color: ColorGlobal.blueColor,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void toast(String s) {


      Fluttertoast.showToast(
          msg: "Please enter $s" ,
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0
      );
  }



}


import 'dart:typed_data';

import 'package:FlutterAnimations/Constant/ColorGlobal.dart';
import 'package:FlutterAnimations/drawpath.dart';
import 'package:FlutterAnimations/painter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:matrix_gesture_detector/matrix_gesture_detector.dart';
class InspectionModule extends StatefulWidget {
  @override
  _InspectionModule createState() => _InspectionModule();
}

class _InspectionModule extends State<InspectionModule> {
  TextEditingController textCertification = TextEditingController();
  TextEditingController cropSituation = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        title: 'Flutter Demo',
        home: Scaffold(
            backgroundColor: Color(0xFFEEF1F3),
//    appBar: new AppBar(
//    title: const Text('Select Any Options'),
//      backgroundColor: Colors.transparent,
//    ),
            body: SingleChildScrollView(
              child: Container(
                  margin: EdgeInsets.fromLTRB(8, 48, 8, 8),
                  padding:
                  EdgeInsets.only(left: 16, right: 16, top: 16, bottom: 16),
                  child: Column(
                    children: [
                      Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Select Any Options',
                            style: TextStyle(
                              fontFamily: ColorGlobal
                                  .fontName,
                              fontWeight:
                              FontWeight.w600,
                              fontSize: 24,
                              color: ColorGlobal
                                  .darkerText,
                            ),
                          )),
                      SizedBox(height: 20),
                      GestureDetector(
                        onTap: (){
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) {
                              return DrawPath();
                            }),
                          );
                        },


                        child: Container(
                          height: 180,
                          decoration: BoxDecoration(
                            color: ColorGlobal.whiteColor,
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(8.0),
                                bottomLeft: Radius.circular(8.0),
                                bottomRight: Radius.circular(8.0),
                                topRight: Radius.circular(68.0)),
                            boxShadow: <BoxShadow>[
                              BoxShadow(
                                  color: ColorGlobal.whiteColor,
                                  offset: Offset(1.1, 1.1),
                                  blurRadius: 10.0),
                            ],
                          ),
                          child: Column(children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: 16, left: 16, right: 16),
                              child: Row(children: <Widget>[
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        left: 8, right: 8, top: 4),
                                    child: Column(
                                      children: <Widget>[
                                        Row(
                                          children: <Widget>[
                                            Container(
                                              height: 48,
                                              width: 2,
                                              decoration: BoxDecoration(
                                                color: HexColor('#87A0E5')
                                                    .withOpacity(0.5),
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(4.0)),
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.all(8.0),
                                              child: Column(
                                                mainAxisAlignment:
                                                MainAxisAlignment.center,
                                                crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                                children: <Widget>[
                                                  Padding(
                                                    padding: const EdgeInsets.only(
                                                        left: 4, bottom: 2),
                                                    child: Text(
                                                      'Draw',
                                                      textAlign: TextAlign.center,
                                                      style: TextStyle(
                                                        fontFamily: ColorGlobal
                                                            .fontName,
                                                        fontWeight:
                                                        FontWeight.w600,
                                                        fontSize: 22,
                                                        color: ColorGlobal
                                                            .darkerText,
                                                      ),
                                                    ),
                                                  ),
                                                  Row(
                                                    mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                    crossAxisAlignment:
                                                    CrossAxisAlignment.end,
                                                    children: <Widget>[
                                                      SizedBox(
                                                        width: 28,
                                                        height: 28,
                                                        child: Image.asset(
                                                            "assets/Icon/drawing.png"),
                                                      ),
                                                      Padding(
                                                        padding:
                                                        const EdgeInsets.only(
                                                            left: 4, bottom: 3),
                                                        child: Text(
                                                          "Draw Path",
                                                          textAlign:
                                                          TextAlign.center,
                                                          style: TextStyle(
                                                            fontFamily:
                                                            ColorGlobal.fontName,
                                                            fontWeight: FontWeight.w500,
                                                            fontSize: 26,
                                                            letterSpacing: -0.1,
                                                            color: ColorGlobal.grey
                                                                .withOpacity(0.5),
                                                          ),

                                                        ),
                                                      ),

                                                    ],
                                                  )
                                                ],
                                              ),
                                            )
                                          ],
                                        ),
                                        SizedBox(
                                          height: 8,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ]),
                            )
                          ]),
                        ),
                      ),

                    ],
                  )),
            )));
  }
}

class HexColor extends Color {
  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));

  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll('#', '');
    if (hexColor.length == 6) {
      hexColor = 'FF' + hexColor;
    }
    return int.parse(hexColor, radix: 16);
  }
}

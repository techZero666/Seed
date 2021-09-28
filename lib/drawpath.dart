import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'dart:typed_data';
import 'dart:ui' as ui;
import 'package:FlutterAnimations/Constant/ColorGlobal.dart';
import 'package:FlutterAnimations/FeildDetails.dart';
import 'package:FlutterAnimations/painter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:image_picker/image_picker.dart';
import 'package:matrix_gesture_detector/matrix_gesture_detector.dart';
import 'package:screenshot/screenshot.dart';

final GlobalKey _key = GlobalKey();
List<Widget> actions;
PainterController _controller = _newController();


class DrawPath extends StatefulWidget {
  @override
  _DrawPath createState() => _DrawPath();
}

class _DrawPath extends State<DrawPath> {
  List<Widget> movableItems = [];
  bool _finished = false;

  @override
  void initState() {
    actionMethod();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        title: '',
        //  home: new MoveableStackItem(),
        home: Scaffold(
            resizeToAvoidBottomInset: false,
            appBar: new AppBar(
                title: const Text('Draw Map'),
                actions: actions,
                backgroundColor: ColorGlobal.colorPrimary,
                bottom: new PreferredSize(
                  child: new DrawBar(_controller),
                  preferredSize: new Size(MediaQuery.of(context).size.width, 30.0),
                )),
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                setState(() {
                  movableItems.add(MoveableStackItem());
                });
              },
              child: Icon(Icons.title,color: ColorGlobal.whiteColor,),
              backgroundColor: ColorGlobal.colorPrimary,
            ),
            body:
            RepaintBoundary(
              key: _key,
              child: Stack(
                children: <Widget>[
                  ExamplePage(),
                Stack(
                    children: movableItems,),

                  ],
    ),
            ))
    );
  }

  actionMethod() {
    if (_finished) {
      actions = <Widget>[
        new IconButton(
          icon: new Icon(Icons.content_copy),
          tooltip: 'New Painting',
          onPressed: () => setState(() {
            _finished = false;
            _controller = _newController();
          }),
        ),
      ];
    } else {
      actions = <Widget>[
        new IconButton(
            icon: new Icon(
              Icons.undo,
            ),
            tooltip: 'Undo',
            onPressed: () {
              if (_controller.isEmpty) {
                showModalBottomSheet(
                    context: context,
                    builder: (BuildContext context) =>
                    new Text('Nothing to undo'));
              } else {
                _controller.undo();
              }
            }),
//        new IconButton(
//          icon: new Icon(Icons.title),
//        //  tooltip: 'Clear',
//
//          },
        //  ),
        new IconButton(
            icon: new Icon(Icons.delete),
            tooltip: 'Clear',
            onPressed: _controller.clear),
        new IconButton(
            icon: new Icon(Icons.check),

            //  onPressed: () => _show(_controller.finish(), context)),
            onPressed: () => _takeScreenshot(context))

      ];
    }

  }
}

class ExamplePage extends StatefulWidget {
  @override
  _ExamplePageState createState() => new _ExamplePageState();
}

class _ExamplePageState extends State<ExamplePage> {

  get children => null;

  String _message = 'Press the button to take a screenshot';
  @override
  void initState() {
    super.initState();
  }

  final _boundaryKey = GlobalKey();

  // This function will be triggered when the button is pressed




  @override
  Widget build(BuildContext context) {
    int index = 0;
    final ValueNotifier<Matrix4> notifier = ValueNotifier(Matrix4.identity());



//    return Center(
//      child: MatrixGestureDetector(
//        onMatrixUpdate: (m, tm, sm, rm) {
//          notifier.value = m;
//        },
//        child: AnimatedBuilder(
//          animation: notifier,
//          builder: (ctx, child) {
//            return Transform(
//              transform: notifier.value,
//              child: Stack(
//                children: <Widget>[
//                  Container(
//                    color: Colors.transparent,
//                    padding: EdgeInsets.all(80),
//                    alignment: Alignment.center,
//                    child: Center(
//                      child: Text(
//                        'use your two fingers to',
//                        textAlign: TextAlign.center,
//                      ),
//                    ),
//                  ),
//                ],
//              ),
//            );
//          },
//        ),
//      ),
//    );

    return new Scaffold(
        resizeToAvoidBottomInset: false,

        body: Stack(


            children: <Widget>[

              Container(
                child: Column(
                  children: [
                    new AspectRatio(
                      aspectRatio: 0.6,
                      child: new Painter(_controller),
                    ),
                  ],
                ),
              ),
//              Container(
//                  child: Center(
//                    child: MatrixGestureDetector(
//                      onMatrixUpdate: (m, tm, sm, rm) {
//                        notifier.value = m;
//                      },
//                      child: AnimatedBuilder(
//                        animation: notifier,
//                        builder: (ctx, child) {
//                          return Transform(
//                            transform: notifier.value,
//                            child: Stack(
//                              children: <Widget>[
//                                Container(
//                                  color: Colors.transparent,
//                                  padding: EdgeInsets.all(8),
//                                  alignment: Alignment.center,
//                                  child: Center(
//                                    child: Text(
//                                      'use your two fingers to',
//                                      textAlign: TextAlign.center,
//                                    ),
//                                  ),
//                                ),
//                              ],
//                            ),
//                          );
//                        },
//                      ),
//                    ),
//                  )),
//              Container(
//
//              ),
              // Max Size



            ])
    );
  }

//  Future<void> _show(PictureDetails picture, BuildContext context) async {
//    ScreenshotController screenshotController = ScreenshotController();
//
//    setState(() {
//      _finished = true;
//    });
//    picture.toPNG();
//    // //debugger();
//
////    GlobalKey _globalKey = new GlobalKey();
////
////    RenderRepaintBoundary boundary =
////    _globalKey.currentContext.findRenderObject();
////    ui.Image image = await boundary.toImage(pixelRatio: 3.0);
////    // //debugger();
////    ByteData byteData =
////        await image.toByteData(format: ui.ImageByteFormat.png);
////    var pngBytes = byteData.buffer.asUint8List();
////    var bs64 = base64Encode(pngBytes);
////    print(pngBytes);
////    print(bs64);
//
//
////    Navigator.of(context)
////        .push(new MaterialPageRoute(builder: (BuildContext context) {
////      return new Scaffold(
////        appBar: new AppBar(
////          title: const Text('View your image'),
////        ),
////        body: new Container(
////            alignment: Alignment.center,
////            child: new FutureBuilder<Uint8List>(
////              future: picture.toPNG(),
////              builder:
////                  (BuildContext context, AsyncSnapshot<Uint8List> snapshot) {
////                      return Image.memory(snapshot.data);
////                    }
////
////            )),
////      );
////    }));
//  }
}

class DrawBar extends StatelessWidget {
  final PainterController _controller;

  DrawBar(this._controller);

  @override
  Widget build(BuildContext context) {
    return new Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        new Flexible(child: new StatefulBuilder(
            builder: (BuildContext context, StateSetter setState) {
              return new Container(
                  child: new Slider(
                    value: _controller.thickness,
                    onChanged: (double value) => setState(() {
                      _controller.thickness = value;
                    }),
                    min: 1.0,
                    max: 20.0,
                    activeColor: Colors.white,
                  ));
            })),
        new StatefulBuilder(
            builder: (BuildContext context, StateSetter setState) {
              return new RotatedBox(
                  quarterTurns: _controller.eraseMode ? 2 : 0,
                  child: IconButton(
                      icon: new Icon(Icons.create),
                      color: ColorGlobal.whiteColor,
                      tooltip: (_controller.eraseMode ? 'Disable' : 'Enable') +
                          ' eraser',
                      onPressed: () {
                        setState(() {
                          _controller.eraseMode = !_controller.eraseMode;
                        });
                      }));
            }),
        new ColorPickerButton(_controller, false),
        new ColorPickerButton(_controller, true),
      ],
    );
  }
}

class ColorPickerButton extends StatefulWidget {
  final PainterController _controller;
  final bool _background;

  ColorPickerButton(this._controller, this._background);

  @override
  _ColorPickerButtonState createState() => new _ColorPickerButtonState();
}

class _ColorPickerButtonState extends State<ColorPickerButton> {
  @override
  Widget build(BuildContext context) {
    return new IconButton(
        icon: new Icon(_iconData, color: _color),
        tooltip: widget._background
            ? 'Change background color'
            : 'Change draw color',
        onPressed: _pickColor);
  }

  void _pickColor() {
    Color pickerColor = _color;
    Navigator.of(context)
        .push(new MaterialPageRoute(
        fullscreenDialog: true,
        builder: (BuildContext context) {
          return new Scaffold(
              appBar: new AppBar(
                title: const Text('Pick color'),
              ),
              body: new Container(
                  alignment: Alignment.center,
                  child: new ColorPicker(
                    pickerColor: pickerColor,
                    onColorChanged: (Color c) => pickerColor = c,
                  )));
        }))
        .then((_) {
      setState(() {
        _color = pickerColor;
      });
    });
  }

  Color get _color => widget._background
      ? widget._controller.backgroundColor
      : widget._controller.drawColor;

  IconData get _iconData =>
      widget._background ? Icons.format_color_fill : Icons.brush;

  set _color(Color color) {
    if (widget._background) {
      widget._controller.backgroundColor = color;
    } else {
      widget._controller.drawColor = color;
    }
  }
}

Widget add(){
  final ValueNotifier<Matrix4> notifier = ValueNotifier(Matrix4.identity());
  return
    Stack(
        children: <Widget>[
          Center(
            child: MatrixGestureDetector(
              onMatrixUpdate: (m, tm, sm, rm) {
                notifier.value = m;
              },

              child: AnimatedBuilder(
                animation: notifier,
                builder: (ctx, child) {
                  return Transform(
                    transform: notifier.value,
                    child: Stack(
                      children: <Widget>[
                        Container(
                          color: Colors.transparent,
                          padding: EdgeInsets.all(80),
                          alignment: Alignment.center,
                          child: Center(
                            child: TextField(
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: 'Enter text here',
                              ),
                              style: TextStyle(color: Colors.black),
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          )
        ]);

}


class MoveableStackItem extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MoveableStackItemState();
  }
}

class _MoveableStackItemState extends State<MoveableStackItem> {
  Color color;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final ValueNotifier<Matrix4> notifier = ValueNotifier(Matrix4.identity());
    return
      Center(
        child: MatrixGestureDetector(
          onMatrixUpdate: (m, tm, sm, rm) {
            notifier.value = m;
          },

          child: AnimatedBuilder(
            animation: notifier,
            builder: (ctx, child) {
              return Transform(
                transform: notifier.value,
                child: Stack(
                  children: <Widget>[
                    Container(
                      color: Colors.transparent,
                      padding: EdgeInsets.all(8),
                      alignment: Alignment.center,
                      child:TextField(
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Enter text here',
                        ),
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      );
  }
}
Future<dynamic> ShowCapturedWidget(
    BuildContext context, Uint8List capturedImage) {
  // //debugger();
  return showDialog(
    useSafeArea: false,
    context: context,
    builder: (context) => Scaffold(
      appBar: AppBar(
        title: Text("Captured widget screenshot"),
      ),
      body: Center(
          child: capturedImage != null
              ? Image.memory(capturedImage)
              : Container()),
    ),
  );
}

Future<void> _takeScreenshot(BuildContext context) async {

  RenderRepaintBoundary boundary =
  _key.currentContext.findRenderObject() as RenderRepaintBoundary;
//  // //debugger();
  ui.Image image = await boundary.toImage();
  ByteData byteData = await image.toByteData(format: ui.ImageByteFormat.png);
  if (byteData != null) {
    Uint8List pngBytes = byteData.buffer.asUint8List();
 //debugger();
    // Saving the screenshot to the gallery
     var result = await ImageGallerySaver.saveImage(
        Uint8List.fromList(pngBytes),
        quality: 90,
        name: 'screenshot-${DateTime.now()}.png');
     //
    print("000v");
    //debugger();
  String m =  result["filePath"];
    final imagePath = result['filePath'].toString().replaceAll(RegExp('file://'), '');
    var file = new File(imagePath);
    Image source  = Image.file(file);
  //  debugger();

    print(result);
    print("vvv");

    Navigator.push(
        context,
        MaterialPageRoute(builder: (context) {
          return FeildDetails(text1: 0,path: file,check:"2");
        }));

  }
}

PainterController _newController() {
  PainterController controller = new PainterController();
  controller.thickness = 5.0;
  controller.backgroundColor = ColorGlobal.colorPrimary;
  return controller;
}

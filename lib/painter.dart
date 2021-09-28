/// Provides a widget and an associated controller for simple painting using touch.
library painter;

import 'dart:async';
import 'dart:typed_data';
import 'dart:ui';

import 'package:flutter/material.dart' hide Image;
import 'package:flutter/widgets.dart' hide Image;
/// A very simple widget that supports drawing using touch.
class Painter extends StatefulWidget {
  final PainterController painterController;

  /// Creates an instance of this widget that operates on top of the supplied [PainterController].
  Painter(PainterController painterController)
      : this.painterController = painterController,
        super(key: new ValueKey<PainterController>(painterController));

  @override
  _PainterState createState() => new _PainterState();
}

class _PainterState extends State<Painter> {
  bool _finished = false;

  @override
  void initState() {
    super.initState();
    widget.painterController._widgetFinish = _finish;
  }

  Size _finish() {
    setState(() {
      _finished = true;
    });
    return context.size ?? const Size(0, 0);
  }

  @override
  Widget build(BuildContext context) {
    Widget child = new CustomPaint(
      willChange: true,
      painter: new _PainterPainter(widget.painterController._pathHistory,
          repaint: widget.painterController),
    );
    child = new ClipRect(child: child);
    if (!_finished) {
      child = new GestureDetector(
        child: child,
        onPanStart: _onPanStart,
        onPanUpdate: _onPanUpdate,
        onPanEnd: _onPanEnd,
      );
    }
    return new Container(
      child: child,




    );
  }

  void _onPanStart(DragStartDetails start) {
    Offset pos = (context.findRenderObject() as RenderBox)
        .globalToLocal(start.globalPosition);
    widget.painterController._pathHistory.add(pos);
    widget.painterController._notifyListeners();
  }

  void _onPanUpdate(DragUpdateDetails update) {
    Offset pos = (context.findRenderObject() as RenderBox)
        .globalToLocal(update.globalPosition);
    widget.painterController._pathHistory.updateCurrent(pos);
    widget.painterController._notifyListeners();
  }

  void _onPanEnd(DragEndDetails end) {
    widget.painterController._pathHistory.endCurrent();
    widget.painterController._notifyListeners();
  }
}

class _PainterPainter extends CustomPainter {
  final _PathHistory _path;

  _PainterPainter(this._path, {Listenable repaint}) : super(repaint: repaint);

  @override
  void paint(Canvas canvas, Size size) {
    _path.draw(canvas, size);
    var paint1 = Paint()
      ..color = Colors.black54
      ..style = PaintingStyle.fill;
    canvas.drawCircle(Offset(20, 80), 2, paint1);
    canvas.drawCircle(Offset(20, 120), 2, paint1);
    canvas.drawCircle(Offset(20, 160), 2, paint1);
    canvas.drawCircle(Offset(20, 200), 2, paint1);
    canvas.drawCircle(Offset(20, 240), 2, paint1);
    canvas.drawCircle(Offset(20, 280), 2, paint1);
    canvas.drawCircle(Offset(20, 320), 2, paint1);
    canvas.drawCircle(Offset(20, 360), 2, paint1);
    canvas.drawCircle(Offset(20, 400), 2, paint1);
    canvas.drawCircle(Offset(20, 440), 2, paint1);
    canvas.drawCircle(Offset(20, 480), 2, paint1);
    canvas.drawCircle(Offset(20, 520), 2, paint1);



    canvas.drawCircle(Offset(60, 80), 2, paint1);
    canvas.drawCircle(Offset(60, 120), 2, paint1);
    canvas.drawCircle(Offset(60, 160), 2, paint1);
    canvas.drawCircle(Offset(60, 200), 2, paint1);
    canvas.drawCircle(Offset(60, 240), 2, paint1);
    canvas.drawCircle(Offset(60, 280), 2, paint1);
    canvas.drawCircle(Offset(60, 320), 2, paint1);
    canvas.drawCircle(Offset(60, 360), 2, paint1);
    canvas.drawCircle(Offset(60, 400), 2, paint1);
    canvas.drawCircle(Offset(60, 440), 2, paint1);
    canvas.drawCircle(Offset(60, 480), 2, paint1);
    canvas.drawCircle(Offset(60, 520), 2, paint1);


    canvas.drawCircle(Offset(100, 80), 2, paint1);
    canvas.drawCircle(Offset(100, 120), 2, paint1);
    canvas.drawCircle(Offset(100, 160), 2, paint1);
    canvas.drawCircle(Offset(100, 200), 2, paint1);
    canvas.drawCircle(Offset(100, 240), 2, paint1);
    canvas.drawCircle(Offset(100, 280), 2, paint1);
    canvas.drawCircle(Offset(100, 320), 2, paint1);
    canvas.drawCircle(Offset(100, 360), 2, paint1);
    canvas.drawCircle(Offset(100, 400), 2, paint1);
    canvas.drawCircle(Offset(100, 440), 2, paint1);
    canvas.drawCircle(Offset(100, 480), 2, paint1);
    canvas.drawCircle(Offset(100, 520), 2, paint1); 
    
    
    canvas.drawCircle(Offset(140, 80), 2, paint1);
    canvas.drawCircle(Offset(140, 120), 2, paint1);
    canvas.drawCircle(Offset(140, 160), 2, paint1);
    canvas.drawCircle(Offset(140, 200), 2, paint1);
    canvas.drawCircle(Offset(140, 240), 2, paint1);
    canvas.drawCircle(Offset(140, 280), 2, paint1);
    canvas.drawCircle(Offset(140, 320), 2, paint1);
    canvas.drawCircle(Offset(140, 360), 2, paint1);
    canvas.drawCircle(Offset(140, 400), 2, paint1);
    canvas.drawCircle(Offset(140, 440), 2, paint1);
    canvas.drawCircle(Offset(140, 480), 2, paint1);
    canvas.drawCircle(Offset(140, 520), 2, paint1); 
    
    
    canvas.drawCircle(Offset(180, 80), 2, paint1);
    canvas.drawCircle(Offset(180, 120), 2, paint1);
    canvas.drawCircle(Offset(180, 160), 2, paint1);
    canvas.drawCircle(Offset(180, 200), 2, paint1);
    canvas.drawCircle(Offset(180, 240), 2, paint1);
    canvas.drawCircle(Offset(180, 280), 2, paint1);
    canvas.drawCircle(Offset(180, 320), 2, paint1);
    canvas.drawCircle(Offset(180, 360), 2, paint1);
    canvas.drawCircle(Offset(180, 400), 2, paint1);
    canvas.drawCircle(Offset(180, 440), 2, paint1);
    canvas.drawCircle(Offset(180, 480), 2, paint1);
    canvas.drawCircle(Offset(180, 520), 2, paint1);
 
    canvas.drawCircle(Offset(220, 80), 2, paint1);
    canvas.drawCircle(Offset(220, 120), 2, paint1);
    canvas.drawCircle(Offset(220, 160), 2, paint1);
    canvas.drawCircle(Offset(220, 200), 2, paint1);
    canvas.drawCircle(Offset(220, 240), 2, paint1);
    canvas.drawCircle(Offset(220, 280), 2, paint1);
    canvas.drawCircle(Offset(220, 320), 2, paint1);
    canvas.drawCircle(Offset(220, 360), 2, paint1);
    canvas.drawCircle(Offset(220, 400), 2, paint1);
    canvas.drawCircle(Offset(220, 440), 2, paint1);
    canvas.drawCircle(Offset(220, 480), 2, paint1);
    canvas.drawCircle(Offset(220, 520), 2, paint1);  
    
    canvas.drawCircle(Offset(260, 80), 2, paint1);
    canvas.drawCircle(Offset(260, 120), 2, paint1);
    canvas.drawCircle(Offset(260, 160), 2, paint1);
    canvas.drawCircle(Offset(260, 200), 2, paint1);
    canvas.drawCircle(Offset(260, 240), 2, paint1);
    canvas.drawCircle(Offset(260, 280), 2, paint1);
    canvas.drawCircle(Offset(260, 320), 2, paint1);
    canvas.drawCircle(Offset(260, 360), 2, paint1);
    canvas.drawCircle(Offset(260, 400), 2, paint1);
    canvas.drawCircle(Offset(260, 440), 2, paint1);
    canvas.drawCircle(Offset(260, 480), 2, paint1);
    canvas.drawCircle(Offset(260, 520), 2, paint1);
    
    
    canvas.drawCircle(Offset(300, 80), 2, paint1);
    canvas.drawCircle(Offset(300, 120), 2, paint1);
    canvas.drawCircle(Offset(300, 160), 2, paint1);
    canvas.drawCircle(Offset(300, 200), 2, paint1);
    canvas.drawCircle(Offset(300, 240), 2, paint1);
    canvas.drawCircle(Offset(300, 280), 2, paint1);
    canvas.drawCircle(Offset(300, 320), 2, paint1);
    canvas.drawCircle(Offset(300, 360), 2, paint1);
    canvas.drawCircle(Offset(300, 400), 2, paint1);
    canvas.drawCircle(Offset(300, 440), 2, paint1);
    canvas.drawCircle(Offset(300, 480), 2, paint1);
    canvas.drawCircle(Offset(300, 520), 2, paint1);
 
    
    canvas.drawCircle(Offset(340, 80), 2, paint1);
    canvas.drawCircle(Offset(340, 120), 2, paint1);
    canvas.drawCircle(Offset(340, 160), 2, paint1);
    canvas.drawCircle(Offset(340, 200), 2, paint1);
    canvas.drawCircle(Offset(340, 240), 2, paint1);
    canvas.drawCircle(Offset(340, 280), 2, paint1);
    canvas.drawCircle(Offset(340, 320), 2, paint1);
    canvas.drawCircle(Offset(340, 360), 2, paint1);
    canvas.drawCircle(Offset(340, 400), 2, paint1);
    canvas.drawCircle(Offset(340, 440), 2, paint1);
    canvas.drawCircle(Offset(340, 480), 2, paint1);
    canvas.drawCircle(Offset(340, 520), 2, paint1);
 
    canvas.drawCircle(Offset(380, 80), 2, paint1);
    canvas.drawCircle(Offset(380, 120), 2, paint1);
    canvas.drawCircle(Offset(380, 160), 2, paint1);
    canvas.drawCircle(Offset(380, 200), 2, paint1);
    canvas.drawCircle(Offset(380, 240), 2, paint1);
    canvas.drawCircle(Offset(380, 280), 2, paint1);
    canvas.drawCircle(Offset(380, 320), 2, paint1);
    canvas.drawCircle(Offset(380, 360), 2, paint1);
    canvas.drawCircle(Offset(380, 400), 2, paint1);
    canvas.drawCircle(Offset(380, 440), 2, paint1);
    canvas.drawCircle(Offset(380, 480), 2, paint1);
    canvas.drawCircle(Offset(380, 520), 2, paint1);


  }

  @override
  bool shouldRepaint(_PainterPainter oldDelegate) {
    return true;
  }
}

class _PathHistory {
  List<MapEntry<Path, Paint>> _paths;
  Paint currentPaint;
  Paint _backgroundPaint;
  bool _inDrag;

  bool get isEmpty => _paths.isEmpty || (_paths.length == 1 && _inDrag);

  _PathHistory()
      : _paths = <MapEntry<Path, Paint>>[],
        _inDrag = false,
        _backgroundPaint = new Paint()..blendMode = BlendMode.dstOver,
        currentPaint = new Paint()
          ..color = Colors.orangeAccent
          ..strokeWidth = 1.0
          ..style = PaintingStyle.fill;

  void setBackgroundColor(Color backgroundColor) {
    _backgroundPaint.color = Colors.white;
  }

  void undo() {
    if (!_inDrag) {
      _paths.removeLast();
    }
  }

  void clear() {
    if (!_inDrag) {
      _paths.clear();
    }
  }

  void add(Offset startPoint) {
    if (!_inDrag) {
      _inDrag = true;
      Path path = new Path();
      path.moveTo(startPoint.dx, startPoint.dy);
      _paths.add(new MapEntry<Path, Paint>(path, currentPaint));
    }
  }

  void updateCurrent(Offset nextPoint) {
    if (_inDrag) {
      Path path = _paths.last.key;
      path.lineTo(nextPoint.dx, nextPoint.dy);
    }
  }

  void endCurrent() {
    _inDrag = false;
  }

  void draw(Canvas canvas, Size size) {
    canvas.saveLayer(Offset.zero & size, Paint());
    for (MapEntry<Path, Paint> path in _paths) {
      Paint p = path.value;
      canvas.drawPath(path.key, p);
    }
    canvas.drawRect(
        new Rect.fromLTWH(0.0, 0.0, size.width, size.height), _backgroundPaint);
    canvas.restore();
  }
}

/// Container that holds the size of a finished drawing and the drawed data as [Picture].
class PictureDetails {
  /// The drawings data as [Picture].
  final Picture picture;

  /// The width of the drawing.
  final int width;

  /// The height of the drawing.
  final int height;

  /// Creates an immutable instance with the given drawing information.
  const PictureDetails(this.picture, this.width, this.height);

  /// Converts the [picture] to an [Image].
  Future<Image> toImage() => picture.toImage(width, height);

  /// Converts the [picture] to a PNG and returns the bytes of the PNG.
  ///
  /// This might throw a [FlutterError], if flutter is not able to convert
  /// the intermediate [Image] to a PNG.
  Future<Uint8List> toPNG() async {
    Image image = await toImage();
    ByteData data = await image.toByteData(format: ImageByteFormat.png);
    if (data != null) {
      return data.buffer.asUint8List();
    } else {
      throw new FlutterError('Flutter failed to convert an Image to bytes!');
    }
  }
}

/// Used with a [Painter] widget to control drawing.
class PainterController extends ChangeNotifier {
  Color _drawColor = new Color.fromARGB(255, 0, 0, 0);
  Color _backgroundColor = new Color(Colors.black.blue);
  bool _eraseMode = false;

  double _thickness = 1.0;
  PictureDetails _cached;
  _PathHistory _pathHistory;
  ValueGetter<Size> _widgetFinish;

  /// Creates a new instance for the use in a [Painter] widget.
  PainterController() : _pathHistory = new _PathHistory();

  /// Returns true if nothing has been drawn yet.
  bool get isEmpty => _pathHistory.isEmpty;

  /// Returns true if the the [PainterController] is currently in erase mode,
  /// false otherwise.
  bool get eraseMode => _eraseMode;

  /// If set to true, erase mode is enabled, until this is called again with
  /// false to disable erase mode.
  set eraseMode(bool enabled) {
    _eraseMode = enabled;
    _updatePaint();
  }

  /// Retrieves the current draw color.
  Color get drawColor => _drawColor;

  /// Sets the draw color.
  set drawColor(Color color) {
    _drawColor = color;
    _updatePaint();
  }

  /// Retrieves the current background color.
  Color get backgroundColor => _backgroundColor;

  /// Updates the background color.
  set backgroundColor(Color color) {
    _backgroundColor = color;
    _updatePaint();
  }

  /// Returns the current thickness that is used for drawing.
  double get thickness => _thickness;

  /// Sets the draw thickness..
  set thickness(double t) {
    _thickness = t;
    _updatePaint();
  }

  void _updatePaint() {
    Paint paint = new Paint();
    if (_eraseMode) {
      paint.blendMode = BlendMode.clear;
      paint.color = Color.fromARGB(0, 255, 0, 0);
    } else {
      paint.color = drawColor;
      paint.blendMode = BlendMode.srcOver;
    }
    paint.style = PaintingStyle.stroke;
    paint.strokeWidth = thickness;
    _pathHistory.currentPaint = paint;
    _pathHistory.setBackgroundColor(backgroundColor);
    notifyListeners();
  }

  /// Undoes the last drawing action (but not a background color change).
  /// If the picture is already finished, this is a no-op and does nothing.
  void undo() {
    if (!isFinished()) {
      _pathHistory.undo();
      notifyListeners();
    }
  }

  void _notifyListeners() {
    notifyListeners();
  }

  /// Deletes all drawing actions, but does not affect the background.
  /// If the picture is already finished, this is a no-op and does nothing.
  void clear() {
    if (!isFinished()) {
      _pathHistory.clear();
      notifyListeners();
    }
  }

  /// Finishes drawing and returns the rendered [PictureDetails] of the drawing.
  /// The drawing is cached and on subsequent calls to this method, the cached
  /// drawing is returned.
  ///
  /// This might throw a [StateError] if this PainterController is not attached
  /// to a widget, or the associated widget's [Size.isEmpty].
  PictureDetails finish() {
    if (!isFinished()) {
      if (_widgetFinish != null) {
        _cached = _render(_widgetFinish());
      } else {
        throw new StateError(
            'Called finish on a PainterController that was not connected to a widget yet!');
      }
    }
    return _cached;
  }

  PictureDetails _render(Size size) {
    if (size.isEmpty) {
      throw new StateError('Tried to render a picture with an invalid size!');
    } else {
      PictureRecorder recorder = new PictureRecorder();
      Canvas canvas = new Canvas(recorder);
      _pathHistory.draw(canvas, size);
      return new PictureDetails(
          recorder.endRecording(), size.width.floor(), size.height.floor());
    }
  }

  /// Returns true if this drawing is finished.
  ///
  /// Trying to modify a finished drawing is a no-op.
  bool isFinished() {
    return _cached != null;
  }
}

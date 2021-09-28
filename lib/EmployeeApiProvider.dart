//import 'dart:convert';
//import 'dart:developer';
//import 'dart:io';
//
//import 'FarmerData.dart';
//import 'package:http/http.dart' as http;
//import 'dbprovider.dart';
//
//class EmployeeApiProvider {
//  String URL =
//      "http://164.100.137.95/seed/api/seed/GetListForInspection";
//  var datafetch;
//  Map<String, dynamic> localStorageData = {};
//
//  LocalStorage() {
//    loadData();
//  }
//
////  Future<String> get _localPath async {
////    final directory = await getApplicationDocumentsDirectory();
////    return directory.path;
////  }
//
//  Future<File> get _localFile async {
//    final path = await _localPath;
//    return new File('$path/localStorage.db');
//  }
//
//  Future<File> _internalSaveData() async {
//    final file = await _localFile;
//    final data = json.encode(localStorageData);
//debugger();
//    return file.writeAsString('$data');
//  }
//
//  void loadData() async {
//    try {
//      final file = await _localFile;
//      debugger();
//      bool exists = await file.exists();
//      if (exists) {
//        // Read the file
//        String contents = await file.readAsString();
//        debugger();
//        try {
//          localStorageData={};
//          localStorageData = jsonDecode(contents);
//          debugger();
//        } catch (e) {
//          debugger();
//          print(e);
//        }
//
//      } else {
//        file.writeAsString(json.encode(localStorageData));
//        debugger();
//      }
//    } catch (e) {
//      // If we encounter an error, return 0
//      print("Error here: $e");
//      debugger();
//    }
//  }
//
//  String getItem(name) {
//    if (localStorageData.containsKey(name)) {
//      return localStorageData[name];
//    }
//    debugger();
//    return null;
//  }
//
//  void setItem(name, value) {
//    localStorageData[name] = value;
//    _internalSaveData();
//  }
//
//  void removeItem(name) {
//    if (localStorageData.containsKey(name)) {
//      localStorageData.remove(name);
//      _internalSaveData();
//    }
//  }
//
//  void clear() {
//    localStorageData = {};
//    _internalSaveData();
//  }
//
//  int get length => localStorageData.keys.length;
//
//  Future<List<RESPONSE>> getData(String s) async {
//    Map<String, String> headers = {
//      "Content-type": "application/json",
//    };
//
//
//    http.post(URL, body: headers).then((response) async {
//      print("Response status: ${response.statusCode}");
//      //     debugger();
//      //   debugPrint("shgjhgug");
//
//      // progressClass.showLoaderDialog(context);
//
//      //         debugger();
//      //   if (response.body.toString().contains("000")) {
//      //o Navigator.pop(context);
//
//      datafetch = json.decode(response.body);
//      debugger();
//      localStorageData = datafetch;
//      final path = await _localPath;
//      File('$path/localStorage.db');
//      final file = await _localFile;
//      final data = json.encode(localStorageData);
//      debugger();
//      file.writeAsString('$data');
//      loadData();
//      debugger();
//      _internalSaveData();
//getItem("RESPONSE");
//debugger();
//      var rest = datafetch['RESPONSE'];
//    });
//  }
//}
////
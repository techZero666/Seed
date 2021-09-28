import 'dart:async';
import 'dart:convert';
import 'dart:core';
import 'dart:core';
import 'dart:core';
import 'dart:core';
import 'dart:core';
import 'dart:core';
import 'dart:developer';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import 'model.dart';

class DbManager {
  Database _database;

   openDb() async {
    _database = await openDatabase(join(await getDatabasesPath(), "dd.db"),
        version: 6, onCreate: (Database db, int version) async {
          await db.execute(
            "CREATE TABLE model(sNo INTEGER , farmerID TEXT, timeForSow TEXT,likelydateOfHarvest Text,farmLocation TEXT,earthization TEXT,isolation TEXT,adjoiningCropCondition TEXT,seedCropStatus TEXT,cropStandards TEXT,cropCondition TEXT,inspectedArea TEXT,canceledArea TEXT,netAreaCertified TEXT,avgYeild TEXT,totalYield TEXT,remarks TEXT,total TEXT,percentage TEXT,name TEXT,rowList Text,mapImage TEXT,inspectionLandImage TEXT,photoWithGrover TEXT,CreateUser TEXT)",
          );
        });
   // PRIMARY KEY autoincrement
//
    return _database;
  }

  Future insertModel(Model model) async {
    await openDb();
      // //debugger();
    print("inserting into table");
    print(model.toJson());

     //debugger();
    return await _database.insert('model', model.toJson());

   }

  Future<List<Map<String,dynamic>>> getModelList() async {
    await openDb();
   //    //debugger();
    final List<Map<String, dynamic>> maps = await _database.query('model');

 //    //debugger();
    return maps;
//  return maps.map((e) => Model(
//       sNo: e["sNo"], farmerID: e["farmerID"],
//       timeForSow: e["timeForSow"], likelydateOfHarvest: e["likelydateOfHarvest"],
//       farmLocation: e["farmLocation"],
//       earthization: e["earthization"],isolation: e["isolation"],
//       adjoiningCropCondition: e["adjoiningCropCondition"],
//       seedCropStatus: e["seedCropStatus"],cropStandards: e["cropStandards"],
//       cropCondition: e["cropCondition"], inspectedArea: e["inspectedArea"],
//       canceledArea: e["canceledArea"], netAreaCertified: e["netAreaCertified"],
//       avgYeild: e["avgYeild"], totalYield: e["totalYield"],
//       remarks: e["remarks"], counting1: ["rowList"],
//      mapImage: e["mapImage"], inspectionLandImage: e["inspectionLandImage"],
//      photoWithGrover: e["photo
//      WithGrover"]
//     )).toList();

}




//  Future<int> updateModel(Model model) async {
//    await openDb();
//    return await _database.update('model', model.toJson(),
//        where: "id = ?", whereArgs: [model.id]);
//  }

//  Future<void> deleteModel(Model model) async {
//    await openDb();
//    await _database.delete('model', where: "id = ?", whereArgs: [model.id]);
//  }
}

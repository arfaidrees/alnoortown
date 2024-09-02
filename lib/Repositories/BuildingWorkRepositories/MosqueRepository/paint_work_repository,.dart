

import 'package:al_noor_town/Database/db_helper.dart';
import 'package:al_noor_town/Globals/globals.dart';
import 'package:al_noor_town/Models/BuildingWorkModels/Mosque/paint_work_model.dart';
import 'package:flutter/foundation.dart';

class PaintWorkRepository{

  DBHelper dbHelper = DBHelper();

  Future<List<PaintWorkModel>> getPaintWork() async {
    // Get the database client
    var dbClient = await dbHelper.db;

    // Query the database
    List<Map> maps = await dbClient.query(
        tableNamePaint,
        columns: ['id', 'blockNo', 'paintWorkStatus','date','time']
    );

    // Print the raw data retrieved from the database
    if (kDebugMode) {
      print('Raw data from database:');
    }
    for (var map in maps) {
      if (kDebugMode) {
        print(map);
      }
    }

    // Convert the raw data into a list
    List<PaintWorkModel> paintWork = [];
    for (int i = 0; i < maps.length; i++) {
     paintWork.add(PaintWorkModel.fromMap(maps[i]));
    }

    // Print the list
    if (kDebugMode) {
      print('Parsed PaintWorkModel objects:');
    }

    return paintWork;
  }

  Future<int>add(PaintWorkModel paintWorkModel) async{
    var dbClient = await dbHelper.db;
    return await dbClient.insert(tableNamePaint,paintWorkModel.toMap());
  }

  Future<int>update(PaintWorkModel paintWorkModel) async{
    var dbClient = await dbHelper.db;
    return await dbClient.update(tableNamePaint,paintWorkModel.toMap(),
        where: 'id = ?', whereArgs: [paintWorkModel.id]);

  }

  Future<int>delete(int id) async{
    var dbClient = await dbHelper.db;
    return await dbClient.delete(tableNamePaint,
        where: 'id = ?', whereArgs: [id]);
  }
}
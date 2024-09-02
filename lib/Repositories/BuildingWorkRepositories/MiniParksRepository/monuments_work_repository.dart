

import 'package:al_noor_town/Database/db_helper.dart';
import 'package:al_noor_town/Globals/globals.dart';
import 'package:al_noor_town/Models/BuildingWorkModels/MiniParksModel/monuments_work_model.dart';
import 'package:flutter/foundation.dart';

class MonumentsWorkRepository{

  DBHelper dbHelper = DBHelper();

  Future<List<MonumentsWorkModel>> getMonumentsWork() async {
    // Get the database client
    var dbClient = await dbHelper.db;

    // Query the database
    List<Map> maps = await dbClient.query(
        tableNameMonument,
        columns: ['id', 'startDate', 'expectedCompDate','monumentsWorkCompStatus','date','time']
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

    // Convert the raw data into a list of
    List<MonumentsWorkModel>  monumentsWork= [];
    for (int i = 0; i < maps.length; i++) {
      monumentsWork.add(MonumentsWorkModel.fromMap(maps[i]));
    }

    // Print the list of
    if (kDebugMode) {
      print('Parsed MonumentsWorkModel objects:');
    }

    return monumentsWork;
  }

  Future<int>add(MonumentsWorkModel monumentsWorkModel) async{
    var dbClient = await dbHelper.db;
    return await dbClient.insert(tableNameMonument,monumentsWorkModel.toMap());
  }

  Future<int>update(MonumentsWorkModel monumentsWorkModel) async{
    var dbClient = await dbHelper.db;
    return await dbClient.update(tableNameMonument,monumentsWorkModel.toMap(),
        where: 'id = ?', whereArgs: [monumentsWorkModel.id]);

  }

  Future<int>delete(int id) async{
    var dbClient = await dbHelper.db;
    return await dbClient.delete(tableNameMonument,
        where: 'id = ?', whereArgs: [id]);
  }
}


import 'package:al_noor_town/Database/db_helper.dart';
import 'package:al_noor_town/Globals/globals.dart';
import 'package:al_noor_town/Models/BuildingWorkModels/RoadsShoulderWorkModel/roads_shoulder_work_model.dart';
import 'package:flutter/foundation.dart';

class RoadsShoulderWorkRepository{

  DBHelper dbHelper = DBHelper();

  Future<List<RoadsShoulderWorkModel>> getRoadsShoulderWork() async {
    // Get the database client
    var dbClient = await dbHelper.db;

    // Query the database
    List<Map> maps = await dbClient.query(
        tableNameRoadShoulder,
        columns: ['id', 'blockNo', 'roadNo','roadSide','totalLength','startDate','expectedCompDate','roadsShoulderCompStatus','date','time','posted']
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
    List<RoadsShoulderWorkModel> roadsShoulderWork = [];
    for (int i = 0; i < maps.length; i++) {
      roadsShoulderWork.add(RoadsShoulderWorkModel.fromMap(maps[i]));
    }

    // Print the list of
    if (kDebugMode) {
      print('Parsed RoadsShoulderWorkModel objects:');
    }
    return roadsShoulderWork;
  }
  Future<List<RoadsShoulderWorkModel>> getUnPostedRoadsShoulder() async {
    var dbClient = await dbHelper.db;
    List<Map> maps = await dbClient.query(
      tableNameRoadShoulder,
      where: 'posted = ?',
      whereArgs: [0],  // Fetch machines that have not been posted
    );

    List<RoadsShoulderWorkModel> roadsShoulderWork = maps.map((map) => RoadsShoulderWorkModel.fromMap(map)).toList();
    return roadsShoulderWork;
  }
  Future<int>add(RoadsShoulderWorkModel roadsShoulderWorkModel) async{
    var dbClient = await dbHelper.db;
    return await dbClient.insert(tableNameRoadShoulder,roadsShoulderWorkModel.toMap());
  }

  Future<int>update(RoadsShoulderWorkModel roadsShoulderWorkModel) async{
    var dbClient = await dbHelper.db;
    return await dbClient.update(tableNameRoadShoulder,roadsShoulderWorkModel.toMap(),
        where: 'id = ?', whereArgs: [roadsShoulderWorkModel.id]);

  }

  Future<int>delete(int id) async{
    var dbClient = await dbHelper.db;
    return await dbClient.delete(tableNameRoadShoulder,
        where: 'id = ?', whereArgs: [id]);
  }
}
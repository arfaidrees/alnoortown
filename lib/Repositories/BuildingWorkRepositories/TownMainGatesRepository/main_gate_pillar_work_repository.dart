

import 'package:al_noor_town/Database/db_helper.dart';
import 'package:al_noor_town/Globals/globals.dart';
import 'package:al_noor_town/Models/BuildingWorkModels/TownMainGatesModel/main_gate_pillar_work_model.dart';
import 'package:flutter/foundation.dart';

class MainGatePillarWorkRepository{

  DBHelper dbHelper = DBHelper();

  Future<List<MainGatePillarWorkModel>> getMainGatePillarWork() async {
    // Get the database client
    var dbClient = await dbHelper.db;

    // Query the database
    List<Map> maps = await dbClient.query(
        tableNamePillarsBrickWorkMainGate,
        columns:  ['id', 'blockNo', 'workStatus','date','time','posted']
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
    List<MainGatePillarWorkModel> mainGatePillarWork = [];
    for (int i = 0; i < maps.length; i++) {
      mainGatePillarWork.add(MainGatePillarWorkModel.fromMap(maps[i]));
    }

    // Print the list of
    if (kDebugMode) {
      print('Parsed MainGatePillarWorkModel objects:');
    }

    return mainGatePillarWork;
  }
  Future<List<MainGatePillarWorkModel>> getUnPostedMainGatePillarWork() async {
    var dbClient = await dbHelper.db;
    List<Map> maps = await dbClient.query(
      tableNamePillarsBrickWorkMainGate,
      where: 'posted = ?',
      whereArgs: [0],  // Fetch machines that have not been posted
    );

    List<MainGatePillarWorkModel> mainGatePillarWork = maps.map((map) => MainGatePillarWorkModel.fromMap(map)).toList();
    return mainGatePillarWork;
  }
  Future<int>add(MainGatePillarWorkModel mainGatePillarWorkModel) async{
    var dbClient = await dbHelper.db;
    return await dbClient.insert(tableNamePillarsBrickWorkMainGate,mainGatePillarWorkModel.toMap());
  }

  Future<int>update(MainGatePillarWorkModel mainGatePillarWorkModel) async{
    var dbClient = await dbHelper.db;
    return await dbClient.update(tableNamePillarsBrickWorkMainGate,mainGatePillarWorkModel.toMap(),
        where: 'id = ?', whereArgs: [mainGatePillarWorkModel.id]);

  }

  Future<int>delete(int id) async{
    var dbClient = await dbHelper.db;
    return await dbClient.delete(tableNamePillarsBrickWorkMainGate,
        where: 'id = ?', whereArgs: [id]);
  }
}
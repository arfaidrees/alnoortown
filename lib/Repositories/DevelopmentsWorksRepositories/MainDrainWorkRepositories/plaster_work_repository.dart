

import 'package:al_noor_town/Database/dbhelper.dart';
import 'package:al_noor_town/Globals/Globals.dart';
import 'package:al_noor_town/Models/DevelopmentsWorksModels/MainDrainWorksModels/plaster_work_model.dart';
import 'package:flutter/foundation.dart';



class PlasterWorkRepository{

  DBHelper dbHelper = DBHelper();

  Future<List<PlasterWorkModel>> getPlasterWork() async {
    // Get the database client
    var dbClient = await dbHelper.db;

    // Query the database
    List<Map> maps = await dbClient.query(
        tableNamePlaster,
        columns: ['id', 'blockNo', 'streetNo', 'completedLength','date']
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

    // Convert the raw data into a list of MachineModel objects
    List<PlasterWorkModel> plasterWork = [];
    for (int i = 0; i < maps.length; i++) {
      plasterWork.add(PlasterWorkModel.fromMap(maps[i]));
    }

    // Print the list of MachineModel objects
    if (kDebugMode) {
      print('Parsed PlasterWorkModel objects:');
    }
    // for (var item in machine) {
    //   if (kDebugMode) {
    //     print(item);
    //   }
    // }

    return plasterWork;
  }



  Future<int>add(PlasterWorkModel plasterWorkModel) async{
    var dbClient = await dbHelper.db;
    return await dbClient.insert(tableNamePlaster,plasterWorkModel.toMap());
  }

  Future<int>update(PlasterWorkModel plasterWorkModel) async{
    var dbClient = await dbHelper.db;
    return await dbClient.update(tableNamePlaster,plasterWorkModel.toMap(),
        where: 'id = ?', whereArgs: [plasterWorkModel.id]);

  }

  Future<int>delete(int id) async{
    var dbClient = await dbHelper.db;
    return await dbClient.delete(tableNamePlaster,
        where: 'id = ?', whereArgs: [id]);
  }
}
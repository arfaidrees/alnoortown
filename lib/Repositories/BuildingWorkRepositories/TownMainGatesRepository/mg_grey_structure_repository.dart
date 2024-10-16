

import 'package:al_noor_town/Database/db_helper.dart';
import 'package:al_noor_town/Globals/globals.dart';
import 'package:al_noor_town/Models/BuildingWorkModels/TownMainGatesModel/mg_grey_structure_model.dart';
import 'package:al_noor_town/Services/ApiServices/api_service.dart';
import 'package:al_noor_town/Services/FirebaseServices/firebase_remote_config.dart';
import 'package:flutter/foundation.dart';

class MgGreyStructureRepository{

  DBHelper dbHelper = DBHelper();

  Future<List<MgGreyStructureModel>> getMgGreyStructure() async {
    // Get the database client
    var dbClient = await dbHelper.db;

    // Query the database
    List<Map> maps = await dbClient.query(
        tableNameGreyStructureMainGate,
        columns:  ['id', 'block_no', 'work_status','main_gate_grey_structure_date','time','posted','user_id']
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
    List<MgGreyStructureModel> mgGreyStructure = [];
    for (int i = 0; i < maps.length; i++) {
      mgGreyStructure.add(MgGreyStructureModel.fromMap(maps[i]));
    }

    // Print the list of
    if (kDebugMode) {
      print('Parsed MgGreyStructureModel objects:');
    }

    return mgGreyStructure;
  }
  Future<void> fetchAndSaveMainGateGreyStructureData() async {
    List<dynamic> data = await ApiService.getData('${Config.getApiUrlGreyStructureMainGate}$userId');
    var dbClient = await dbHelper.db;

    // Save data to database
    for (var item in data) {
      item['posted'] = 1; // Set posted to 1
      MgGreyStructureModel model = MgGreyStructureModel.fromMap(item);
      await dbClient.insert(tableNameGreyStructureMainGate, model.toMap());
    }
  }
  Future<List<MgGreyStructureModel>> getUnPostedGreyStructure() async {
    var dbClient = await dbHelper.db;
    List<Map> maps = await dbClient.query(
      tableNameGreyStructureMainGate,
      where: 'posted = ?',
      whereArgs: [0],  // Fetch machines that have not been posted
    );

    List<MgGreyStructureModel> mgGreyStructure = maps.map((map) => MgGreyStructureModel.fromMap(map)).toList();
    return mgGreyStructure;
  }
  Future<int>add(MgGreyStructureModel mgGreyStructureModel) async{
    var dbClient = await dbHelper.db;
    return await dbClient.insert(tableNameGreyStructureMainGate,mgGreyStructureModel.toMap());
  }

  Future<int>update(MgGreyStructureModel mgGreyStructureModel) async{
    var dbClient = await dbHelper.db;
    return await dbClient.update(tableNameGreyStructureMainGate,mgGreyStructureModel.toMap(),
        where: 'id = ?', whereArgs: [mgGreyStructureModel.id]);

  }

  Future<int>delete(int id) async{
    var dbClient = await dbHelper.db;
    return await dbClient.delete(tableNameGreyStructureMainGate,
        where: 'id = ?', whereArgs: [id]);
  }
}
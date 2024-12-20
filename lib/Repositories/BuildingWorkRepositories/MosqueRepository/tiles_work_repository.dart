import 'package:al_noor_town/Database/db_helper.dart';
import 'package:al_noor_town/Globals/globals.dart';
import 'package:al_noor_town/Models/BuildingWorkModels/Mosque/tiles_work_model.dart';
import 'package:al_noor_town/Services/ApiServices/api_service.dart';
import 'package:al_noor_town/Services/FirebaseServices/firebase_remote_config.dart';
import 'package:flutter/foundation.dart';

class TilesWorkRepository{

  DBHelper dbHelper = DBHelper();

  Future<List<TilesWorkModel>> getTilesWork() async {
    // Get the database client
    var dbClient = await dbHelper.db;

    // Query the database
    List<Map> maps = await dbClient.query(
        tableNameTilesWorkMosque,
        columns: ['id', 'block_no', 'tiles_work_status','tiles_work_date','time','posted','user_id']
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
    List<TilesWorkModel> tilesWork = [];
    for (int i = 0; i < maps.length; i++) {
      tilesWork.add(TilesWorkModel.fromMap(maps[i]));
    }

    // Print the list
    if (kDebugMode) {
      print('Parsed TilesWorkModel objects:');
    }

    return tilesWork;
  }
  Future<void> fetchAndSaveTilesWorkData() async {
    List<dynamic> data = await ApiService.getData('${Config.getApiUrlTilesWorkMosque}$userId');
    var dbClient = await dbHelper.db;

    // Save data to database
    for (var item in data) {
      item['posted'] = 1; // Set posted to 1
      TilesWorkModel model = TilesWorkModel.fromMap(item);
      await dbClient.insert(tableNameTilesWorkMosque, model.toMap());
    }
  }
  Future<List<TilesWorkModel>> getUnPostedTilesWork() async {
    var dbClient = await dbHelper.db;
    List<Map> maps = await dbClient.query(
      tableNameTilesWorkMosque,
      where: 'posted = ?',
      whereArgs: [0],  // Fetch machines that have not been posted
    );

    List<TilesWorkModel> tilesWork = maps.map((map) => TilesWorkModel.fromMap(map)).toList();
    return tilesWork;
  }
  Future<int>add(TilesWorkModel tilesWorkModel) async{
    var dbClient = await dbHelper.db;
    return await dbClient.insert(tableNameTilesWorkMosque,tilesWorkModel.toMap());
  }

  Future<int>update(TilesWorkModel tilesWorkModel) async{
    var dbClient = await dbHelper.db;
    return await dbClient.update(tableNameTilesWorkMosque,tilesWorkModel.toMap(),
        where: 'id = ?', whereArgs: [tilesWorkModel.id]);

  }

  Future<int>delete(int id) async{
    var dbClient = await dbHelper.db;
    return await dbClient.delete(tableNameTilesWorkMosque,
        where: 'id = ?', whereArgs: [id]);
  }
}
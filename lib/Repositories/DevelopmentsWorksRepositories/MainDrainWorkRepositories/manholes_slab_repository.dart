
import 'package:al_noor_town/Database/db_helper.dart';
import 'package:al_noor_town/Globals/globals.dart';
import 'package:al_noor_town/Models/DevelopmentsWorksModels/MainDrainWorksModels/manholes_slab_model.dart';
import 'package:al_noor_town/Services/ApiServices/api_service.dart';
import 'package:al_noor_town/Services/FirebaseServices/firebase_remote_config.dart';
import 'package:flutter/foundation.dart';
class ManholesSlabRepository{

  DBHelper dbHelper = DBHelper();

  Future<List<ManholesSlabModel>> getManHolesSlab() async {
    // Get the database client
    var dbClient = await dbHelper.db;

    // Query the database
    List<Map> maps = await dbClient.query(
        tableNameManHolesSlabs,
        columns: ['id', 'block_no', 'street_no', 'no_of_comp_slabs','manholes_slabs_date','time','posted','user_id']
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
    List<ManholesSlabModel> manholesSlab = [];
    for (int i = 0; i < maps.length; i++) {
      manholesSlab.add(ManholesSlabModel.fromMap(maps[i]));
    }

    // Print the list of MachineModel objects
    if (kDebugMode) {
      print('Parsed ManholesSlabModel objects:');
    }

    return manholesSlab;
  }
  Future<void> fetchAndSaveManholesSlabData() async {
    List<dynamic> data = await ApiService.getData('${Config.getApiUrlManholesSlabs}$userId');
    var dbClient = await dbHelper.db;

    // Save data to database
    for (var item in data) {
      item['posted'] = 1; // Set posted to 1
      ManholesSlabModel model = ManholesSlabModel.fromMap(item);
      await dbClient.insert(tableNameManHolesSlabs, model.toMap());
    }
  }
  Future<List<ManholesSlabModel>> getUnPostedManHolesSlab() async {
    var dbClient = await dbHelper.db;
    List<Map> maps = await dbClient.query(
      tableNameManHolesSlabs,
      where: 'posted = ?',
      whereArgs: [0],  // Fetch machines that have not been posted
    );

    List<ManholesSlabModel> manholesSlab = maps.map((map) => ManholesSlabModel.fromMap(map)).toList();
    return manholesSlab;
  }
  Future<int>add(ManholesSlabModel manHolesSlabModel) async{
    var dbClient = await dbHelper.db;
    return await dbClient.insert(tableNameManHolesSlabs,manHolesSlabModel.toMap());
  }

  Future<int>update(ManholesSlabModel manHolesSlabModel) async{
    var dbClient = await dbHelper.db;
    return await dbClient.update(tableNameManHolesSlabs,manHolesSlabModel.toMap(),
        where: 'id = ?', whereArgs: [manHolesSlabModel.id]);

  }

  Future<int>delete(int id) async{
    var dbClient = await dbHelper.db;
    return await dbClient.delete(tableNameManHolesSlabs,
        where: 'id = ?', whereArgs: [id]);
  }
}
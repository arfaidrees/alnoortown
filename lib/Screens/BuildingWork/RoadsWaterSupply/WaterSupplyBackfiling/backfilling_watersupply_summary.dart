
import 'package:al_noor_town/ViewModels/BuildingWorkViewModel/RoadsWaterSupplyWorkViewModel/back_filling_ws_view_model.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' show  Get, Inst, Obx;

class BackFillingWaterSupplySummary extends StatefulWidget {
    const BackFillingWaterSupplySummary({super.key});

  @override
  State<BackFillingWaterSupplySummary> createState() => _BackFillingWaterSupplySummaryState();
}

class _BackFillingWaterSupplySummaryState extends State<BackFillingWaterSupplySummary> {
  BackFillingWsViewModel backFillingWsViewModel = Get.put(BackFillingWsViewModel());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon:   const Icon(Icons.arrow_back, color: Color(0xFFC69840)),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title:   Text(
          'roads_water_supply_summary'.tr(),
          style: const TextStyle(
              fontSize: 14, fontWeight: FontWeight.bold, color: Color(0xFFC69840)),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding:   const EdgeInsets.all(12.0),
          child: Obx(() {
            // Use Obx to rebuild when the data changes
            if (backFillingWsViewModel.allWsBackFilling.isEmpty) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/images/nodata.png',
                      width: 200,
                      height: 200,
                      fit: BoxFit.cover,
                    ),
                    SizedBox(height: 16),
                    Text(
                      'No data available',
                      style: TextStyle(
                          color: Colors.grey, fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              );
            }

            return SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: DataTable(
                columnSpacing: 12.0,
                headingRowColor: WidgetStateProperty.all(
                    const Color(0xFFC69840)),
                border: const TableBorder(
                  horizontalInside: BorderSide(
                      color: Color(0xFFC69840), width: 1.0),
                  verticalInside: BorderSide(
                      color: Color(0xFFC69840), width: 1.0),
                ),
                columns: [
                  DataColumn(label: Text('block_no'.tr(),
                      style: const TextStyle(fontWeight: FontWeight.bold))),
                  DataColumn(label: Text('road_no'.tr(),
                      style: const TextStyle(fontWeight: FontWeight.bold))),
                  DataColumn(label: Text('road_side'.tr(),
                      style: const TextStyle(fontWeight: FontWeight.bold))),
                  DataColumn(label: Text('total_length'.tr(),
                      style: const TextStyle(fontWeight: FontWeight.bold))),
                  DataColumn(label: Text('start_date'.tr(),
                      style: const TextStyle(fontWeight: FontWeight.bold))),
                  DataColumn(label: Text('end_date'.tr(),
                      style: const TextStyle(fontWeight: FontWeight.bold))),
                  DataColumn(label: Text('status'.tr(),
                      style: const TextStyle(fontWeight: FontWeight.bold))),
                  DataColumn(label: Text('date'.tr(),
                      style: const TextStyle(fontWeight: FontWeight.bold))),
                  DataColumn(label: Text('time'.tr(),
                      style: const TextStyle(fontWeight: FontWeight.bold))),
                ],
                rows: backFillingWsViewModel.allWsBackFilling.map((entry) {
                  // Format the DateTime objects to a readable string format
                  String start_date = entry.start_date != null
                      ? DateFormat('d MMM yyyy').format(entry.start_date!)
                      : ''; // Show empty string if null

                  String expected_comp_date = entry.expected_comp_date != null
                      ? DateFormat('d MMM yyyy').format(entry.expected_comp_date!)
                      : '';
                  return DataRow(cells: [
                    DataCell(Text(entry.block_no!)),
                    DataCell(Text(entry.road_no!)),
                    DataCell(Text(entry.road_side!)),
                    DataCell(Text(entry.total_length!)),
                    DataCell(Text(start_date)),
                    DataCell(Text(expected_comp_date)),
                    DataCell(Text(entry.water_supply_back_filling_comp_status!)),
                    DataCell(Text(entry.date !)),
                    DataCell(Text(entry.time !)),
                  ]);
                }).toList(),
              ),
            );
          }),
      ),
    );
  }
}

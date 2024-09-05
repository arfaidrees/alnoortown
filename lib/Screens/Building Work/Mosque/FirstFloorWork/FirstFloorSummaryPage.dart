import 'package:al_noor_town/ViewModels/BuildingWorkViewModel/Mosque/first_floor_view_model.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' show ExtensionSnackbar, Get, GetNavigation, Inst, Obx, SnackPosition;
import 'package:intl/intl.dart';

class FirstFloorSummaryPage extends StatefulWidget {
  final List<Map<String, dynamic>> containerDataList;
    FirstFloorSummaryPage({super.key, required this.containerDataList});

  @override
  State<FirstFloorSummaryPage> createState() => _FirstFloorSummaryPageState();
}

class _FirstFloorSummaryPageState extends State<FirstFloorSummaryPage> {
  final FirstFloorViewModel firstFloorViewModel = Get.put(FirstFloorViewModel());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon:   Icon(Icons.arrow_back, color: Color(0xFFC69840)),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title:   Text(
          'First Floor Summary',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Color(0xFFC69840),
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding:   EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
              SizedBox(height: 4),
            // Data Grid
            Expanded(
              child: Obx(() {
                return ListView.builder(
                  itemCount: firstFloorViewModel.allFirstFloor.length,
                  itemBuilder: (context, index) {
                    final data = firstFloorViewModel.allFirstFloor[index];
                    return _buildDataRow({
                      "selectedBlock": data.blockNo,
                      "brickWorkStatus": data.brickWork,
                      "mudFillingStatus": data.mudFiling,
                      "plasterWorkStatus": data.plasterWork,
                      "date": data.date,
                      "time": data.time
                    });
                  },
                );
              }),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeaderCell(String title) {
    return Center(
      child: Text(
        title,
        style:   TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 14,
        ),
      ),
    );
  }

  Widget _buildDataRow(Map<String, dynamic> data) {
    return Container(
      margin:   EdgeInsets.only(bottom: 8.0),
      decoration: BoxDecoration(
        border: Border.all(color:   Color(0xFFC69840), width: 1.0),
        borderRadius: BorderRadius.circular(8),
        color: Colors.white,
      ),
      child: Padding(
        padding:   EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0),
        child: Column(
          children: [
            _buildDataCell('block_no'.tr(), data["selectedBlock"] ?? "N/A"),
              Divider(color: Color(0xFFC69840), thickness: 1.0),
            _buildDataCell('brick_work'.tr(), data["brickWorkStatus"] ?? "N/A"),
              Divider(color: Color(0xFFC69840), thickness: 1.0),
            _buildDataCell('mud_filling'.tr(), data["mudFillingStatus"] ?? "N/A"),
              Divider(color: Color(0xFFC69840), thickness: 1.0),
            _buildDataCell('plaster_work'.tr(), data["plasterWorkStatus"] ?? "N/A"),
              Divider(color: Color(0xFFC69840), thickness: 1.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(child: _buildDataCell('date'.tr(), _formatDate(data["timestamp"]))),
                Expanded(child: _buildDataCell('time'.tr(), _formatTime(data["timestamp"]))),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDataCell(String label, String? text) {
    return Row(
      children: [
        Text(
          "$label: ",
          style:   TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.bold,
            color: Color(0xFFC69840),
          ),
        ),
        Expanded(
          child: Text(
            text ?? "N/A",
            style: const TextStyle(
              fontSize: 12,
              color: Color(0xFF000000),
            ),
            textAlign: TextAlign.left,
          ),
        ),
      ],
    );
  }

  String _formatDate(String? timestamp) {
    if (timestamp == null) return "N/A";
    final dateTime = DateTime.parse(timestamp);
    return DateFormat('d MMM yyyy').format(dateTime);
  }

  String _formatTime(String? timestamp) {
    if (timestamp == null) return "N/A";
    final dateTime = DateTime.parse(timestamp);
    return DateFormat('h:mm a').format(dateTime);
  }
}
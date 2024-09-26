import 'package:easy_localization/easy_localization.dart';
import 'package:al_noor_town/Models/BuildingWorkModels/MiniParksModel/mini_park_curb_stone_model.dart';
import 'package:al_noor_town/ViewModels/BuildingWorkViewModel/MiniParksViewModel/mini_park_curb_stone_view_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' show ExtensionSnackbar, Get, GetNavigation, Inst, Obx, SnackPosition;
import 'package:intl/intl.dart';
import 'MiniParkCurbstonesSummary.dart';

class MiniParkCurbstonesWork extends StatefulWidget {
    MiniParkCurbstonesWork({super.key});

  @override
  MiniParkCurbstonesWorkState createState() => MiniParkCurbstonesWorkState();
}

class MiniParkCurbstonesWorkState extends State<MiniParkCurbstonesWork> {
  MiniParkCurbStoneViewModel miniParkCurbStoneViewModel = Get.put(MiniParkCurbStoneViewModel());
  DateTime? selectedstart_date;
  DateTime? selectedEndDate;
  String? selectedStatus;
  List<Map<String, dynamic>> containerDataList = [];

  @override
  void initState() {
    super.initState();
  }
  String _getFormattedDate() {
    final now = DateTime.now();
    final formatter = DateFormat('d MMM yyyy');
    return formatter.format(now);
  }  String _getFormattedTime() {
    final now = DateTime.now();
    final formatter = DateFormat('h:mm a');
    return formatter.format(now);
  }

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
        actions: [
          IconButton(
            icon:   Icon(Icons.history_edu_outlined,
                color: Color(0xFFC69840)),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => MiniParkCurbstonesSummary(),
                ),
              );
            },
          ),
        ],
        title:   Text(
          'curbstones_work'.tr(),
          style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: Color(0xFFC69840)),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          SizedBox(
            width: double.infinity,
            child: Image.asset(
              'assets/images/curbstone.png',
              fit: BoxFit.cover,
              height: 190.0,
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              padding:   EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  buildContainer(),
                    SizedBox(height: 16),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildContainer() {
    return Card(
      margin:   EdgeInsets.only(bottom: 14),
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      color: Colors.white,
      child: Padding(
        padding:   EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            buildDatePickerRow(
              'start_date'.tr(),
              selectedstart_date,
              (date) => setState(() => selectedstart_date = date),
            ),
              SizedBox(height: 4),
            buildDatePickerRow(
              'expected_completion_date'.tr(),
              selectedEndDate,
              (date) => setState(() => selectedEndDate = date),
            ),
              SizedBox(height: 4),
              Text(
              "status".tr(),
              style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFFC69840)),
            ),
              SizedBox(height: 4),
            buildStatusRadioButtons((value) {
              setState(() {
                selectedStatus = value;
              });
            }),
              SizedBox(height: 10),
            Center(
              child: ElevatedButton(
                onPressed: () async {
                  if (selectedstart_date != null &&
                      selectedEndDate != null &&
                      selectedStatus != null) {
                    await miniParkCurbStoneViewModel .addMpCurb (MiniParkCurbStoneModel(
                        start_date: selectedstart_date,
                        expected_comp_date: selectedEndDate,
                        mini_park_curbstone_comp_status: selectedStatus,
                        date: _getFormattedDate(),
                        time: _getFormattedTime()
                    ));

                    await miniParkCurbStoneViewModel.fetchAllMpCurb();
                    await miniParkCurbStoneViewModel.postDataFromDatabaseToAPI();

                    ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                        content: Text('entry_added_successfully'.tr()),
                      ),
                    );
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                        content: Text('please_fill_in_all_fields'.tr()),
                      ),
                    );
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor:   Color(0xFFF3F4F6),
                  padding:
                        EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                  textStyle:   TextStyle(fontSize: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child:   Text('submit'.tr().tr(),
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Color(0xFFC69840))),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildDatePickerRow(
      String label, DateTime? selectedDate, ValueChanged<DateTime?> onChanged) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style:   TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.bold,
              color: Color(0xFFC69840)),
        ),
          SizedBox(height: 4),
        GestureDetector(
          onTap: () async {
            DateTime? pickedDate = await showDatePicker(
              context: context,
              initialDate: selectedDate ?? DateTime.now(),
              firstDate: DateTime(2000),
              lastDate: DateTime(2101),
            );
            onChanged(pickedDate);
          },
          child: Container(
            width: double.infinity,
            padding:   EdgeInsets.symmetric(vertical: 12, horizontal: 16),
            decoration: BoxDecoration(
              border: Border.all(color:   Color(0xFFC69840)),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(
              selectedDate != null
                  ? DateFormat('d MMM yyyy').format(selectedDate)
                  : 'select_date'.tr(),
              style:   TextStyle(
                fontSize: 12,
                color: Color(0xFFC69840),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget buildStatusRadioButtons(ValueChanged<String?> onChanged) {
    return Column(
      children: [
        RadioListTile<String>(
          title:   Text(
            'in_process'.tr(),
            style: TextStyle(fontSize: 14),
          ),
          value: 'in_process'.tr(),
          groupValue: selectedStatus,
          onChanged: onChanged,
          activeColor:   Color(0xFFC69840),
        ),
        RadioListTile<String>(
          title:   Text(
            'done'.tr(),
            style: TextStyle(fontSize: 14),
          ),
          value: 'done'.tr(),
          groupValue: selectedStatus,
          onChanged: onChanged,
          activeColor:   Color(0xFFC69840),
        ),
      ],
    );
  }
}

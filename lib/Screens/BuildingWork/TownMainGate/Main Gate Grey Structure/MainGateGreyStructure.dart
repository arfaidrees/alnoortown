import 'package:easy_localization/easy_localization.dart';
import 'package:al_noor_town/Models/BuildingWorkModels/TownMainGatesModel/mg_grey_structure_model.dart';
import 'package:al_noor_town/ViewModels/BuildingWorkViewModel/TownMainGatesViewModel/mg_grey_structure_view_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' show ExtensionSnackbar, Get, GetNavigation, Inst, Obx, SnackPosition;
import 'package:intl/intl.dart';
import 'MainGateGreySummary.dart';

class MainGateGreyStructure extends StatefulWidget {
    MainGateGreyStructure({super.key});

  @override
  _MainGateGreyStructureState createState() => _MainGateGreyStructureState();
}

class _MainGateGreyStructureState extends State<MainGateGreyStructure> {
  MgGreyStructureViewModel mgGreyStructureViewModel=Get.put(MgGreyStructureViewModel());
  final List<String> blocks = [
    "Block A",
    "Block B",
    "Block C",
    "Block D",
    "Block E",
    "Block F",
    "Block G"
  ];
  List<Map<String, dynamic>> containerDataList = [];

  String? selectedBlock;
  String? workStatus;

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
            icon:   Icon(Icons.history_edu_outlined, color: Color(0xFFC69840)),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => MainGateGreyStructureSummary(),
                ),
              );
            },
          ),
        ],
        title:   Text(
          'main_gate_grey_structure'.tr(),
          style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Color(0xFFC69840)),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          SizedBox(
            width: double.infinity,
            child: Image.asset(
              'assets/images/gateeee-01.png',
              fit: BoxFit.cover,
              height: 170.0,
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
      margin:   EdgeInsets.only(bottom: 16),
      elevation: 5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      color: Colors.white,
      child: Padding(
        padding:   EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            buildBlockRow((value) {
              setState(() {
                selectedBlock = value;
              });
            }),
              SizedBox(height: 16),
            buildWorkStatusField(),
              SizedBox(height: 16),
            Center(
              child: ElevatedButton(
                onPressed: () async {
                  if (selectedBlock != null && workStatus != null) {
                    await mgGreyStructureViewModel.addMainGrey(MgGreyStructureModel(
                      blockNo: selectedBlock,
                      workStatus: workStatus,
                        date: _getFormattedDate(),
                        time: _getFormattedTime()
                      // date:
                    ));

                    await mgGreyStructureViewModel.fetchAllMainGrey();

                    ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                        content: Text('entry_added_successfully'.tr()),
                      ),
                    );
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                        content: Text('Please fill all the fields.'),
                      ),
                    );
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor:   Color(0xFFF3F4F6),
                  padding:   EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                  textStyle:   TextStyle(fontSize: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                child:   Text('submit'.tr().tr(),
                    style: TextStyle(fontWeight: FontWeight.bold, color: Color(0xFFC69840))),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildBlockRow(ValueChanged<String?> onChanged) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
          Text('block_no'.tr(),
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Color(0xFFC69840))),
          SizedBox(height: 8),
        DropdownButtonFormField<String>(
          items: blocks.map((item) {
            return DropdownMenuItem(
              value: item,
              child: Text(item),
            );
          }).toList(),
          onChanged: onChanged,
          decoration:   InputDecoration(
            border: OutlineInputBorder(borderSide: BorderSide(color: Color(0xFFC69840))),
            contentPadding: EdgeInsets.symmetric(horizontal: 8),
          ),
        ),
      ],
    );
  }

  Widget buildWorkStatusField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
          Text('work_status'.tr(),
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Color(0xFFC69840))),
          SizedBox(height: 8),
        TextField(
          onChanged: (value) {
            setState(() {
              workStatus = value;
            });
          },
          maxLines: 3,
          decoration:   InputDecoration(
            border: OutlineInputBorder(borderSide: BorderSide(color: Color(0xFFC69840))),
            contentPadding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
          ),
        ),
      ],
    );
  }
}


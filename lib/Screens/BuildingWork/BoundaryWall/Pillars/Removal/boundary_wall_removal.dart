import 'package:al_noor_town/Globals/globals.dart';
import 'package:al_noor_town/Screens/BuildingWork/BoundaryWall/Pillars/Removal/pillars_removal_summary.dart';
import 'package:al_noor_town/ViewModels/BlockDetailsViewModel/block_details_view_model.dart';
import 'package:al_noor_town/ViewModels/BuildingWorkViewModel/BoundaryWallViewModel/PillarsViewModel/pillars_removal_view_model.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:al_noor_town/Models/BuildingWorkModels/TownMainGatesModel/mg_plaster_work_model.dart';
import 'package:al_noor_town/ViewModels/BuildingWorkViewModel/TownMainGatesViewModel/mg_plaster_work_view_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' show ExtensionSnackbar, Get, GetNavigation, Inst, Obx, SnackPosition;
import 'package:intl/intl.dart';

import '../../../../../Models/BuildingWorkModels/BoundarywallModel/PillarsModel/pillars_removal_model.dart';
import '../../../../../Widgets/custom_text_feild.dart';
import '../../../TownMainGate/Main Gate Plaster/MainGatePlasterSummary.dart';


class PillarsRemoval extends StatefulWidget {
  PillarsRemoval({super.key});

  @override
  PillarsRemovalState createState() => PillarsRemovalState();
}

class PillarsRemovalState extends State<PillarsRemoval> {
PillarsRemovalViewModel pillarsRemovalViewModel =Get.put(PillarsRemovalViewModel());
BlockDetailsViewModel blockDetailsViewModel = Get.put(BlockDetailsViewModel());

  String? selectedBlock;
String? No_of_Pillars;
String? Total_length;


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
                  builder: (context) => PillarsRemovalSummary(),
                ),
              );
            },
          ),
        ],
        title:   Text(
          'Pillars Removal'.tr(),
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
            buildWorkStatusField(
              'No. of Pillars Removal'.tr(),
                  (value) {
                setState(() {
                  No_of_Pillars = value;
                });
              },
            ),

            SizedBox(height: 16),
            buildWorkStatusField(
              'Total Length'.tr(),
                  (value) {
                setState(() {
                  Total_length = value;
                });
              },
            ),
            SizedBox(height: 16),
            Center(
              child: ElevatedButton(
                onPressed: () async {
                  if (selectedBlock != null && No_of_Pillars!= null && Total_length!=null) {
                    await pillarsRemovalViewModel.addPillarsRemoval(PillarsRemovalModel(
                        block: selectedBlock,
                        no_of_pillars: No_of_Pillars ,
                        total_length: Total_length,
                        date: _getFormattedDate(),
                        time: _getFormattedTime(),
                        user_id: userId

                    ));

                    await pillarsRemovalViewModel.fetchAllPillarsRemoval();
                    await pillarsRemovalViewModel.postDataFromDatabaseToAPI();

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
                child:   Text('submit'.tr(),
                    style: TextStyle(fontWeight: FontWeight.bold, color: Color(0xFFC69840))),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildBlockRow(ValueChanged<String?> onChanged) {
    final List<String> blocks = blockDetailsViewModel.allBlockDetails
        .map((blockDetail) => blockDetail.block.toString())
        .toSet()
        .toList();
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('block_no'.tr(),
              style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFFC69840))),
          SizedBox(height: 8),

          DropdownSearch<String>(
            items: blocks,
            onChanged: onChanged,
            dropdownDecoratorProps: DropDownDecoratorProps(
              dropdownSearchDecoration: InputDecoration(
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Color(0xFFC69840)),
                ),
                contentPadding: EdgeInsets.symmetric(horizontal: 8),
              ),
            ),
            popupProps: PopupProps.menu(
              showSearchBox: true,
            ),
          )
        ]
    );
  }

}

import 'package:al_noor_town/Database/db_helper.dart';
import 'package:al_noor_town/Globals/globals.dart';
import 'package:al_noor_town/Models/MaterialShiftingModels/shifting_work_model.dart';
import 'package:al_noor_town/ViewModels/MaterialShiftingViewModel/material_shifting_view_model.dart';
import 'package:al_noor_town/ViewModels/RoadDetailsViewModel/road_details_view_model.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart' show Get, GetNavigation, Inst, Obx;
import '../../ViewModels/BlockDetailsViewModel/block_details_view_model.dart';
import 'materialshiftingsummary.dart';

class MaterialShiftingPage extends StatefulWidget {
  const MaterialShiftingPage({Key? key}) : super(key: key);

  @override
  MaterialShiftingPageState createState() => MaterialShiftingPageState();
}

class MaterialShiftingPageState extends State<MaterialShiftingPage> {
  MaterialShiftingViewModel materialShiftingViewModel = Get.put(MaterialShiftingViewModel());
  BlockDetailsViewModel blockDetailsViewModel = Get.put(BlockDetailsViewModel());
  RoadDetailsViewModel roadDetailsViewModel = Get.put(RoadDetailsViewModel());
  DBHelper dbHelper = DBHelper();
  int? shiftId;
  // final List<String> blocks = ["Block A", "Block B", "Block C", "Block D", "Block E", "Block F", "Block G"];
  // final List<String> streets = ["Block A", "Block B", "Block C", "Block D", "Block E", "Block F", "Block G"];

  // Define a single data container
  Map<String, dynamic> containerData = {
    "selectedBlock": null,
    "selectedStreet": null,
    "selectedShifting": 0,
  };

  @override
  void initState() {
    super.initState();
  }

  String _getFormattedDate() {
    final now = DateTime.now();
    final formatter = DateFormat('d MMM yyyy');
    return formatter.format(now);
  }

  String _getFormattedTime() {
    final now = DateTime.now();
    final formatter = DateFormat('h:mm a');
    return formatter.format(now);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(200.0),
        child: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          flexibleSpace: Stack(
            children: [
              Container(
                width: double.infinity,
                height: double.infinity,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/shiftingworkimg.png'),
                    fit: BoxFit.fitHeight,
                  ),
                ),
              ),
            ],
          ),
          systemOverlayStyle: SystemUiOverlayStyle.dark,
          actions: [
            IconButton(
              icon: const Icon(Icons.summarize, color: Color(0xFFC69840)),
              onPressed: () {
                // Navigate to the summary page
                Get.to(() => MaterialShiftingSummaryPage());
              },
            ),
          ],
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Color(0xFFC69840)),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Align(
              alignment: Alignment.center,
              child: Padding(
                padding: EdgeInsets.only(bottom: 16.0),
                child: Text(
                  'Shifting Work',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Color(0xFFC69840)),
                ),
              ),
            ),
            buildContainer(),
            const SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  final from_block = containerData["selectedBlock"];
                  final to_block = containerData["selectedStreet"];
                  final no_of_shift = containerData["selectedShifting"];

                  // Call addShift without await since it's a void function
                  materialShiftingViewModel.addShift(ShiftingWorkModel(
                    id: shiftId,
                    from_block: from_block,
                    to_block: to_block,
                    no_of_shift: no_of_shift,
                    date: _getFormattedDate(),
                    time: _getFormattedTime(),
                    user_id: userId
                  ));

                   materialShiftingViewModel.fetchAllShifting();
                   materialShiftingViewModel.postDataFromDatabaseToAPI();
                  // Fetch all shifting data after adding
                  materialShiftingViewModel.fetchAllShifting();

                  setState(() {
                    // Clear the data container after submission
                    containerData = {
                      "selectedBlock": null,
                      "selectedStreet": null,
                      "selectedShifting": 0,
                    };
                  });

                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Data submitted and fields cleared.'),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFF3F4F6),
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                  textStyle: const TextStyle(fontSize: 14),
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.zero,
                  ),
                ),
                child: Text('submit'.tr(), style: const TextStyle(fontWeight: FontWeight.bold, color: Color(0xFFC69840))),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildContainer() {
    TextEditingController shiftingController = TextEditingController(text: containerData["selectedShifting"].toString());

    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            buildBlockStreetRow(),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'no_of_shifting'.tr(),
                  style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Color(0xFFC69840)),
                ),
                Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.remove),
                      onPressed: () {
                        setState(() {
                          if (containerData["selectedShifting"] > 0) {
                            containerData["selectedShifting"]--;
                            shiftingController.text = containerData["selectedShifting"].toString();
                          }
                        });
                      },
                    ),
                    SizedBox(
                      width: 60,
                      child: TextField(
                        controller: shiftingController,
                        keyboardType: TextInputType.number,
                        textAlign: TextAlign.center,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          contentPadding: EdgeInsets.symmetric(horizontal: 8),
                        ),
                        onChanged: (value) {
                          setState(() {
                            containerData["selectedShifting"] = int.tryParse(value) ?? 0;
                          });
                        },
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.add, color: Color(0xFFC69840)),
                      onPressed: () {
                        setState(() {
                          containerData["selectedShifting"]++;
                          shiftingController.text = containerData["selectedShifting"].toString();
                        });
                      },
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }


  Widget buildBlockStreetRow() {
    return Obx(() {
      // Dynamically get the blocks list from the BlockDetailsViewModel
      final List<String> blocks = blockDetailsViewModel.allBlockDetails
          .map((blockDetail) => blockDetail.block.toString())
          .toSet()
          .toList();
      // Dynamically get the streets list from the BlockDetailsViewModel
      final List<String> streets = roadDetailsViewModel.allRoadDetails
          .map((streetDetail) => streetDetail.street.toString())
          .toSet()
          .toList();

      return Row(
        children: [
          Expanded(
            child: buildDropdownField(
                "block_no".tr(),  "selectedBlock", blocks),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: buildDropdownField(
                "street_no".tr(),  "selectedStreet", streets),
          ),
        ],
      );
    });
  }
  Widget buildDropdownField(String title, String key, List<String> items) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Color(0xFFC69840)),
        ),
        SizedBox(height: 8),
        DropdownSearch<String>(
          items: items,
          selectedItem: containerData[key],
          dropdownDecoratorProps: DropDownDecoratorProps(
            dropdownSearchDecoration: InputDecoration(
              border: OutlineInputBorder(
                borderSide: const BorderSide(color: Color(0xFF4A4A4A)),
                borderRadius: BorderRadius.circular(8), // Slightly larger border radius
              ),
              contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8), // More padding for a cleaner look
            ),
          ),
          popupProps: PopupProps.menu(
            showSearchBox: true, // Enables the search feature
            itemBuilder: (context, item, isSelected) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                child: Text(
                  item,
                  style: const TextStyle(fontSize: 11), // Slightly larger font for dropdown items
                ),
              );
            },
          ),
          onChanged: (value) {
            setState(() {
              containerData[key] = value;
            });
          },
        ),
      ],
    );
  }
}

import 'package:al_noor_town/Screens/BuildingWork/BoundaryWall/Pillars/Fixing/boundary_wall_fixing.dart';
import 'package:al_noor_town/Screens/BuildingWork/FountainPark/BoundaryGril/boundary_gril_work.dart';
import 'package:al_noor_town/Screens/BuildingWork/FountainPark/GazeboWork/gazebo_work.dart';
import 'package:al_noor_town/Screens/BuildingWork/FountainPark/MainEntranceTilesWork/main_entrance_tiles.dart';
import 'package:al_noor_town/Screens/BuildingWork/FountainPark/MainStage/main_stage_work.dart';
import 'package:al_noor_town/Screens/BuildingWork/FountainPark/MudFilling/mud_filling_work.dart';
import 'package:al_noor_town/Screens/BuildingWork/FountainPark/PlantationWork/plantationwork.dart';
import 'package:al_noor_town/Screens/BuildingWork/FountainPark/SittingAreaWork/sittingareawork.dart';
import 'package:al_noor_town/Screens/BuildingWork/FountainPark/WalkingTracksWork/walking_tracks_work.dart';
import 'package:al_noor_town/Screens/BuildingWork/MiniPark/CurbstonesWorkMiniPark/Curbstones_minipark.dart';
import 'package:al_noor_town/Screens/BuildingWork/MiniPark/FancyLightPoles/FancyLightPoles.dart';
import 'package:al_noor_town/Screens/BuildingWork/MiniPark/GrassWork/grasswork.dart';
import 'package:al_noor_town/Screens/BuildingWork/MiniPark/MiniParkMudFilling/MP_Mud_Filling.dart';
import 'package:al_noor_town/Screens/BuildingWork/MiniPark/Monumentswork/MonumentsWork.dart';
import 'package:al_noor_town/Screens/BuildingWork/MiniPark/PlantationWorkMiniPark/minipark_plantation.dart';
import 'package:al_noor_town/Screens/BuildingWork/RoadSignBoard/Road_Sign_Board.dart';
import 'package:al_noor_town/Screens/BuildingWork/RoadsCompactionWork/BaseSubBaseCompaction/BaseSubBaseCompaction.dart';
import 'package:al_noor_town/Screens/BuildingWork/RoadsCompactionWork/CompactionAfterWaterBound/CompactionAfterWaterBound.dart';
import 'package:al_noor_town/Screens/BuildingWork/RoadsCompactionWork/SandCompaction/SandCompaction.dart';
import 'package:al_noor_town/Screens/BuildingWork/RoadsCompactionWork/SoilCompaction/SoilCompaction.dart';
import 'package:al_noor_town/Screens/BuildingWork/RoadsEdging/RoadsEdgingWork.dart';
import 'package:al_noor_town/Screens/BuildingWork/RoadsWaterSupply/WaterSupply/RoadsWaterSupplyWork.dart';
import 'package:al_noor_town/Screens/BuildingWork/RoadsWaterSupply/WaterSupplyBackfiling/BackfillingWs.dart';
import 'package:al_noor_town/Screens/BuildingWork/StreetRoadsWaterChannels/StreetRoadsWaterChannels.dart';
import 'package:al_noor_town/Screens/BuildingWork/TownMainGate/Canopy%20Coloumn%20Pouring/Canopy_coloumn_pouring.dart';
import 'package:al_noor_town/Screens/BuildingWork/TownMainGate/Main%20Gate%20Foundation/MainGateFoundation.dart';
import 'package:al_noor_town/Screens/BuildingWork/TownMainGate/Main%20Gate%20Grey%20Structure/MainGateGreyStructure.dart';
import 'package:al_noor_town/Screens/BuildingWork/TownMainGate/Main%20Gate%20Plaster/Main_Gate_Plaster_Work.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'BoundaryWall/Pillars/Removal/boundary_wall_removal.dart';
import 'BoundaryWall/Planks/Fixing/boundary_wall_fixing.dart';
import 'BoundaryWall/Planks/Removal/boundary_wall_removal.dart';
import 'FountainPark/CurbstonesWork/curbstones_work.dart';
import 'Mosque/CeilingWork/ceiling_work.dart';
import 'Mosque/DoorsWork/doors_work.dart';
import 'Mosque/ElectricityWork/electricity_work.dart';
import 'Mosque/FirstFloorWork/first_floor.dart';
import 'Mosque/FoundationWork/foundation_work.dart';
import 'Mosque/MosqueExcavationWork/mosque_excavation_work.dart';
import 'Mosque/PaintWork/paint_work.dart';
import 'Mosque/SanitaryWork/sanitory_work.dart';
import 'Mosque/TilesWork/tiles_work.dart';


import 'RoadsCurbstonesWork/RoadsCurbstonesWork2.dart';
import 'RoadsShouldersWork/RoadsShouldersWork.dart';
import 'TownMainGate/Main Gate Pillars Brick/MainGatePillarsbrick.dart';


class Building_Navigation_Page extends StatefulWidget {
    Building_Navigation_Page({super.key});

  @override
  State<Building_Navigation_Page> createState() =>
      _Building_Navigation_PageState();
}

class _Building_Navigation_PageState extends State<Building_Navigation_Page> {
  double screenHeight = 0;
  double screenWidth = 0;
  bool startAnimation = false;

  List<String> texts = [
    //"Mosque",
    'mosque'.tr(),
    'fountain_park'.tr(),
    'mini_parks'.tr(),
    'roads_compaction_work'.tr(),
    'roads_edging_work'.tr(),
    'roads_shoulders_work'.tr(),
    'roads_water_supply_work'.tr(),
    'roads_sign_boards'.tr(),
    'roads_curbstones_work'.tr(),
    'street_roads_water_channels'.tr(),
    'town_main_gates'.tr(),
    'Boundary Wall'.tr()
  ];

  List<String> imagePaths = [
    "assets/images/mosquee-01.png",
    "assets/images/waterfountain-01.png",
    "assets/images/garden-01.png",
    "assets/images/maindrain_work.png",
    "assets/images/road_maintenance.png",
    "assets/images/sewerage_work.png",
    "assets/images/light_poles_work.png",
    "assets/images/maindrain_work.png",
    "assets/images/road_maintenance.png",
    "assets/images/sewerage_work.png",
    "assets/images/light_poles_work.png",
    "assets/images/maindrain_work.png",
  ];

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      setState(() {
        startAnimation = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    screenHeight = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon:   Icon(Icons.arrow_back, color: Color(0xFFC69840)),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title:   Text(
          'building_work'.tr(),
          style: TextStyle(
            color: Color(0xFFC69840),
            fontWeight: FontWeight.w500,
            fontSize: 20,
          ),
        ),
        centerTitle: true,
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Scrollbar(
          thumbVisibility: true,
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              SingleChildScrollView(
                physics:   BouncingScrollPhysics(),
                padding: EdgeInsets.symmetric(
                  horizontal: screenWidth / 20,
                ),
                child: Column(
                  children: [
                    ListView.builder(
                      primary: false,
                      shrinkWrap: true,
                      itemCount: texts.length,
                      itemBuilder: (context, index) {
                        return item(index);
                      },
                    ),
                      SizedBox(height: 40),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget item(int index) {
    return GestureDetector(
      onTap: () {
        if (texts[index] == 'mosque'.tr() ||
            texts[index] == 'fountain_park'.tr() ||
            texts[index] == 'mini_parks'.tr() ||
            texts[index] == 'roads_compaction_work'.tr() ||
            texts[index] == 'roads_water_supply_work'.tr() ||
            texts[index] == 'town_main_gates'.tr()||
             texts[index] == 'Boundary Wall'.tr()
        ) {

          showAlertBox(index);
        } else {
          navigateToWorkPage(texts[index]);
        }
      },
      child: AnimatedContainer(
        height: 55,
        width: screenWidth,
        curve: Curves.linear,
        duration: Duration(milliseconds: 300 + (index * 200)),
        transform:
        Matrix4.translationValues(startAnimation ? 0 : screenWidth, 0, 0),
        margin:   EdgeInsets.only(
          bottom: 8,
        ),
        padding: EdgeInsets.symmetric(
          horizontal: screenWidth / 30,
        ),
        decoration: BoxDecoration(
          color:   Color(0xFFF3F4F6),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            Padding(
              padding:   EdgeInsets.all(4.0),
              child: Image.asset(
                imagePaths[index],
                height: 35,
                width: 35,
              ),
            ),
            Container(
              width: 0.7,
              height: 60,
              color: Colors.grey.withOpacity(0.3),
              margin:   EdgeInsets.symmetric(horizontal: 8),
            ),
            Expanded(
              child: Padding(
                padding:   EdgeInsets.only(left: 8.0),
                child: Text(
                  texts[index],
                  style:   TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFFC69840),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void showAlertBox(int index) {
    List<dynamic> mosqueNames = [
      'excavation_work'.tr(),
      'foundation_work'.tr(),
      'first_floor'.tr(),
      'tiles_work'.tr(),
      'sanitary_work'.tr(),
      'ceiling_work'.tr(),
      'paint_work'.tr(),
      'electricity_work'.tr(),
      'doors_work'.tr()
    ];

    List<IconData> mosqueIcons = [
      Icons.construction, // Excavation Work
      Icons.foundation, // Foundation Work
      Icons.account_balance, // First Floor
      Icons.grid_on, // Tiles Work
      Icons.plumbing, // Sanitary Work
      Icons.roofing, // Ceiling Work
      Icons.format_paint, // Paint Work
      Icons.electrical_services, // Electricity Work
      Icons.door_front_door, // Doors Work
    ];


    List<String> fountainParkNames = [
      'mud_filling_work'.tr(),
      'walking_tracks_work'.tr(),
      'curbstones_work'.tr(),
      'sitting_area_work'.tr(),
      'plantation_work'.tr(),
      'main_entrance_tiles_work'.tr(),
      'boundary_grill_work'.tr(),
      'gazebo_work'.tr(),
      'main_stage'.tr()
    ];

    List<IconData> fountainParkIcons = [
      Icons.landscape, // Mud Filling Work
      Icons.directions_walk, // Walking Tracks Work
      Icons.satellite, // Cubstones Work
      Icons.event_seat, // Sitting Area Work
      Icons.local_florist, // Plantation Work
      Icons.crop_square, // Main Entrance Tiles Work
      Icons.security, // Boundary Grill Work
      Icons.park, // Gazebo Work
      Icons.theater_comedy, // Main Stage
    ];

    List<String> miniParksNames = [
      'mini_park_mud_filling'.tr(),
      'grass_work'.tr(),
      'mini_park_curbstones_work'.tr(),
      'fancy_light_poles'.tr(),
      'plantation_work_mp'.tr(),
      'monuments_work'.tr(),
    ];

    List<IconData> miniParksIcons = [
      Icons.landscape, // Mud Filling Work
      Icons.grass, // Grass Work
      Icons.satellite, // Curbstones Work
      Icons.lightbulb, // Fancy Light
      Icons.lightbulb, // Fancy Light Poles
      Icons.local_florist, // Plantation Work mp
      Icons.account_balance, // Monuments Work
    ];

    List<String> roadsCompactionNames = [
      'sand_compaction'.tr(),
      'soil_compaction'.tr(),
      'base_sub_base_compaction'.tr(),
      'compaction_after_water_bound'.tr()
    ];

    List<IconData> roadsCompactionIcons = [
      Icons.terrain_sharp,
      Icons.terrain,
      Icons.layers,
      Icons.water_damage,
    ];

    List<String> roadsWaterSupplyNames = [
      'roads_water_supply_work'.tr(),
      'water_supply_back_filling'.tr(),
    ];

    List<IconData> roadsWaterSupplyIcons = [
      Icons.water,
      Icons.backup,
    ];

    List<String> townMainGatesNames = [
      'main_gate_foundation_work'.tr(),
      'main_gate_pillars_brick_work'.tr(),
      'main_gate_canopy_column_pouring_work'.tr(),
      'main_gate_grey_structure'.tr(),
      'main_gate_plaster_work'.tr()
    ];

    List<IconData> townMainGatesIcons = [
      Icons.home_work,
      Icons.stop,
      Icons.wifi_tethering,
      Icons.home,
      Icons.format_paint,
    ];
    List<dynamic> boundaryWallNames = [
      'Pillars'.tr(),
      'Planks'.tr()
    ];

    List<IconData> boundaryWallIcons = [
      Icons.construction, // Excavation Work
      Icons.foundation, // Foundation Work
      // Icons.account_balance, // First Floor
      // Icons.grid_on, // Tiles Work
      // Icons.plumbing, // Sanitary Work
      // Icons.roofing, // Ceiling Work
      // Icons.format_paint, // Paint Work
      // Icons.electrical_services, // Electricity Work
      // Icons.door_front_door, // Doors Work
    ];
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(texts[index]),
          content: SizedBox(
            width: double.maxFinite,
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: (texts[index] == 'mosque'.tr())
                  ? mosqueNames.length
                  : (texts[index] == 'fountain_park'.tr())
                  ? fountainParkNames.length
                  : (texts[index] == 'mini_parks'.tr())
                  ? miniParksNames.length
                  : (texts[index] == 'roads_compaction_work'.tr())
                  ? roadsCompactionNames.length
                  : (texts[index] == 'roads_water_supply_work'.tr())
                  ? roadsWaterSupplyNames.length
                  : (texts[index] == 'Boundary Wall'.tr())
                  ? boundaryWallNames.length
                  : townMainGatesNames.length,
              itemBuilder: (context, subIndex) {
                return ListTile(
                  leading: Icon(
                    (texts[index] == 'mosque'.tr())
                        ? mosqueIcons[subIndex]

                        : (texts[index] == 'fountain_park'.tr())
                        ? fountainParkIcons[subIndex]
                        : (texts[index] == 'mini_parks'.tr())
                        ? miniParksIcons[subIndex]
                        : (texts[index] == 'roads_compaction_work'.tr())
                        ? roadsCompactionIcons[subIndex]
                        : (texts[index] == 'roads_water_supply_work'.tr())
                        ? roadsWaterSupplyIcons[subIndex]
                        : (texts[index] == 'Boundary Wall'.tr())
                        ? boundaryWallIcons[subIndex]
                        : townMainGatesIcons[subIndex],
                  ),
                  title: Text(
                    (texts[index] == 'mosque'.tr())
                        ? mosqueNames[subIndex]
                        : (texts[index] == 'fountain_park'.tr())
                        ? fountainParkNames[subIndex]
                        : (texts[index] == 'mini_parks'.tr())
                        ? miniParksNames[subIndex]
                        : (texts[index] == 'roads_compaction_work'.tr())
                        ? roadsCompactionNames[subIndex]
                        : (texts[index] == 'roads_water_supply_work'.tr())
                        ? roadsWaterSupplyNames[subIndex]
                        : (texts[index] == 'Boundary Wall'.tr())
                        ? boundaryWallNames[subIndex]
                        : townMainGatesNames[subIndex],
                  ),
                  onTap: () {
                    if (texts[index] == 'Boundary Wall'.tr() &&
                        (boundaryWallNames[subIndex] == 'Pillars'.tr() ||
                            boundaryWallNames[subIndex] == 'Planks'.tr())) {
                      Navigator.pop(context);
                      showFixingRemovalOptions(boundaryWallNames[subIndex]);
                    } else {
                      Navigator.pop(context);
                      navigateToSubPage(texts[index], subIndex);
                    }
                  },
                );
              },
            ),
          ),
        );
      },
    );
  }

  void showFixingRemovalOptions(String item) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('$item Options'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                title: Text('Fixing'.tr()),
                onTap: () {
                  Navigator.pop(context); // Close the dialog first
                  if (item == 'Pillars'.tr()) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => PillarsFixing()),
                    );
                  } else if (item == 'Planks'.tr()) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => PlanksFixing()),
                    );
                  }
                },
              ),
              ListTile(
                title: Text('Removal'.tr()),
                onTap: () {
                  Navigator.pop(context); // Close the dialog first
                  if (item == 'Pillars'.tr()) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => PillarsRemoval()),
                    );
                  } else if (item == 'Planks'.tr()) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => PlanksRemoval()),
                    );
                  }
                },
              ),
            ],
          ),
        );
      },
    );
  }

  void navigateToWorkPage(dynamic workType) {
    String roadsEdgingWork = 'roads_edging_work'.tr();
    String roadsShouldersWork = 'roads_shoulders_work'.tr();
    String roadsSignBoards = 'roads_sign_boards'.tr();
    String roadsCurbstonesWork = 'roads_curbstones_work'.tr();
    String streetRoadsWaterChannels = 'street_roads_water_channels'.tr();

    if (workType == roadsEdgingWork) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => RoadsEdgingWork()),
      );
    } else if (workType == roadsShouldersWork) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => RoadsShouldersWork()),
      );
    } else if (workType == roadsSignBoards) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => RoadsSignBoards()),
      );
    } else if (workType == roadsCurbstonesWork) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => RoadsCurbstonesWork()),
      );
    } else if (workType == streetRoadsWaterChannels) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => StreetRoadsWaterChannels()),
      );
    } else {
      if (kDebugMode) {
        print('Unknown workType: $workType');
      }
    }
  }

  void navigateToSubPage(dynamic workType, int subIndex) {

    String translatedMosque = 'mosque'.tr();
    String fountainPark = 'fountain_park'.tr();
    String translatedMiniParks = 'mini_parks'.tr();
    String roadsCompactionWork = 'roads_compaction_work'.tr();
    String roadsWaterSupplyWork = 'roads_water_supply_work'.tr();
    String townMainGates = 'town_main_gates'.tr();
    String boundaryWall = 'Boundary Wall'.tr();

    if (workType == translatedMosque) {

        switch (subIndex) {
          case 0:
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) =>   MosqueExcavationWork()),
            );
            break;
          case 1:
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) =>   FoundationWork()),
            );
            break;
          case 2:
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) =>   FirstFloorWork()),
            );
            break;
          case 3:
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) =>   TilesWork()),
            );
            break;
          case 4:
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) =>   SanitaryWork()),
            );
            break;
          case 5:
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) =>   CeilingWork()),
            );
            break;
          case 6:
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) =>   PaintWork()),
            );
            break;
          case 7:
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) =>   ElectricityWork()),
            );
            break;
          case 8:
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) =>   DoorsWork()),
            );
            break;
        }
    }
      //  break;
      else if (workType == fountainPark) {
      switch (subIndex) {
        case 0:
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => MudFillingWork()),
          );
          break;
        case 1:
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => WalkingTracksWork()),
          );
          break;
        case 2:
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => CurbStonesWork()),
          );
          break;
        case 3:
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => SittingAreaWork()),
          );
          break;
        case 4:
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => PlantationWork()),
          );
          break;
        case 5:
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => MainEntranceTilesWork()),
          );
          break;
        case 6:
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => BoundaryGrillWork()),
          );
          break;
        case 7:
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => GazeboWork()),
          );
          break;
        case 8:
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => MainStageWork()),
          );
          break;
      }
    }
      else if( workType == translatedMiniParks) {
      switch (subIndex) {
        case 0:
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => MiniParkMudFilling()),
          );
          break;
        case 1:
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => GrassWork()),
          );
          break;
        case 2:
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => MiniParkCurbstonesWork()),
          );
          break;
        case 3:
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => FancyLightPoles()),
          );
          break;
        case 4:
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => PlantationWorkmp()),
          );
          break;
        case 5:
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => MonumentsWork()),
          );
          break;
      }
    }
     else if (workType == roadsCompactionWork) {
      switch (subIndex) {
        case 0:
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => SandCompaction()),
          );
          break;
        case 1:
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => SoilCompaction()),
          );
          break;
        case 2:
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => BaseSubBase()),
          );
          break;
        case 3:
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => CompactionAfterWaterBound()),
          );
          break;
      }
    }
      else if ( workType == roadsWaterSupplyWork) {
      switch (subIndex) {
        case 0:
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => RoadsWaterSupplyWork()),
          );
          break;
        case 1:
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) =>  BackFillingWs()),
          );
          break;
      }
    }      else if ( workType == boundaryWall) {
      switch (subIndex) {
        case 0:
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => PillarsFixing()),
          );
          break;
        case 1:
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) =>  BackFillingWs()),
          );
          break;
      }
    }
      else if(workType == townMainGates) {
      switch (subIndex) {
        case 0:
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => MainGateFoundationWork()),
          );
          break;
        case 1:
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => MainGatePillarsBrickWork()),
          );
          break;
        case 2:
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => CanopyColoumnPouring()),
          );
          break;
        case 3:
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => MainGateGreyStructure()),
          );
          break;
        case 4:
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => MainGatePlasterWork()),
          );
          break;
      }
    
    }
  }
}
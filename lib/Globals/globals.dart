import 'dart:async';
import 'dart:ui';

// String userId="";
// String password="";


String tableNameMachine= 'machine';
String tableNameWaterTanker='waterTanker';
String tableNameExcavation='excavation';
String tableNameBackFiling='backFiling';
String tableNameManholes='manholes';
String tableNamePipeLaying='pipeLaying';
String tableNameLightWires='lightWires';
String tableNamePolesExcavation='polesExcavation';
String tableNamePoles='poles';
String tableNameAsphaltWork='asphaltWork';
String tableNameBrickWork='brickWork';
String tableNameIronWork='ironWork';
String tableNameMainDrainExcavation='drainExcavation';
String tableNameManHolesSlabs='manHolesSlabs';
String tableNamePlasterWork='plasterWork';
String tableNameShutteringWork='shutteringWork';
String tableNameShiftingWork='shiftingWork';
String tableNameMosqueExcavationWork='mosqueExcavationWork';
String tableNameNewMaterials='newMaterials';
String tableNameAttendanceIn='attendanceIn';
String tableNameAttendanceOut='attendanceOut';
String tableNameFoundationWorkMosque='foundationWorkMosque';
String tableNameFirstFloorMosque='firstFloorMosque';
String tableNameTilesWorkMosque='tilesWorkMosque';
String tableNameSanitaryWorkMosque='sanitaryWorkMosque';
String tableNameCeilingWorkMosque='ceilingWorkMosque';
String tableNamePaintWorkMosque='paintWorkMosque';
String tableNameElectricityWorkMosque='electricityWorkMosque';
String tableNameDoorsWorkMosque='doorsWorkMosque';
String tableNameBoundaryGrillWork='boundaryGrillWork';
String tableNameCurbStonesWork='curbStonesWork';
String tableNameGazeboWork='gazeboWork';
String tableNameMainEntranceTilesWork='mainEntranceTilesWork';
String tableNameMainStage='mainStage';
String tableNameMudFillingWorkFountainPark='mudFillingWorkFountainPark';
String tableNamePlantationWorkFountainPark='plantationWorkFountainPark';
String tableNameSittingAreaWork='sittingAreaWork';
String tableNameWalkingTracksWork='walkingTracksWork';
String tableNameMudFillingMiniPark='mudFillingMiniPark';
String tableNameGrassWorkMiniPark='grassWorkMiniPark';
String tableNameCurbStonesWorkMiniPark='curbStonesWorkMiniPark';
String tableNameFancyLightPolesMiniPark='fancyLightPolesMiniPark';
String tableNamePlantationWorkMiniPark='plantationWorkMiniPark';
String tableNameMonumentWork='monumentWorks';
String tableNameBaseSubBaseCompaction='baseSubBaseCompaction';
String tableNameCompactionAfterWaterBound='compactionAfterWaterBound';
String tableNameSandCompaction='sandCompaction';
String tableNameSoilCompaction='soilCompaction';
String tableNameRoadsEdging='roadsEdging';
String tableNameRoadShoulder='roadShoulder';
String tableNameRoadsWaterSupplyWork='roadsWaterSupplyWork';
String tableNameWaterSupplyBackFilling='waterSupplyBackFilling';
String tableNameRoadsSignBoards='roadsSignBoards';
String tableNameRoadCurbStone='roadCurbStone';
String tableNameStreetRoadWaterChannels='streetRoadWaterChannels';
String tableNameMainGateCanopyColumnPouringWork='mainGateCanopyColumnPouringWork';
String tableNameFoundationWorkMainGate='foundationWorkMainGate';
String tableNamePillarsBrickWorkMainGate='pillarsBrickWorkMainGate';
String tableNameGreyStructureMainGate='greyStructureMainGate';
String tableNamePlasterWorkMainGate='plasterWorkMainGate';
String tableNameBlocksDetails='blocksDetails';
String tableNameLogin='login';
String tableNameRoadsDetail='roadsDetail';




const Color customColor = Color(0xFFC69840);
bool isClockedIn = false;
late Timer timer;
int secondsPassed=0;



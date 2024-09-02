class WaterFirstModel{
  int? id;
  String? blockNo;
  String? roadNo;
  String? roadSide;
  String? totalLength;
  DateTime? startDate;
  DateTime? expectedCompDate;
  String? waterSupplyCompStatus;
  dynamic date;
  dynamic time;
  WaterFirstModel({
    this.id,
    this.blockNo,
    this.roadNo,
    this.roadSide,
    this.totalLength,
    this.startDate,
    this.expectedCompDate,
    this.waterSupplyCompStatus,
    this.date,
    this.time
  });

  factory WaterFirstModel.fromMap(Map<dynamic,dynamic>json)
  {
    return WaterFirstModel(
        id: json['id'],
        blockNo: json['blockNo'],
        roadNo: json['roadNo'],
        roadSide: json['roadSide'],
        totalLength: json['totalLength'],
        startDate: json['startDate'] != null ? DateTime.parse(json['startDate']) : null,
        expectedCompDate: json['expectedCompDate'] != null ? DateTime.parse(json['expectedCompDate']) : null,
        waterSupplyCompStatus:json['waterSupplyCompStatus'],
        date:  json['date'],
        time:  json['time']
    );
  }

  Map<String, dynamic> toMap(){
    return {
      'id':id,
      'blockNo':blockNo,
      'roadNo':roadNo,
      'roadSide':roadSide,
      'totalLength':totalLength,
      'startDate': startDate?.toString(),
      'expectedCompDate': expectedCompDate?.toString(),
      'waterSupplyCompStatus':waterSupplyCompStatus,
      'date':date,
      'time':time,

    };
  }
}
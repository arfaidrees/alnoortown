class BaseSubBaseCompactionModel{
  int? id;
  String? blockNo;
  String? roadNo;
  String? totalLength;
  DateTime? startDate;
  DateTime? expectedCompDate;
  String? baseSubBaseCompStatus;
  dynamic date;
  dynamic time;
  int posted;  // New field to track whether data has been posted

  BaseSubBaseCompactionModel({
    this.id,
    this.blockNo,
    this.roadNo,
    this.totalLength,
    this.startDate,
    this.expectedCompDate,
    this.baseSubBaseCompStatus,
    this.date,
    this.time,
    this.posted = 0,  // Default to 0 (not posted)

  });

  factory BaseSubBaseCompactionModel.fromMap(Map<dynamic,dynamic>json)
  {
    return BaseSubBaseCompactionModel(
        id: json['id'],
        blockNo: json['blockNo'],
        roadNo: json['roadNo'],
        totalLength: json['totalLength'],
        startDate: json['startDate'] != null ? DateTime.parse(json['startDate']) : null,
        expectedCompDate: json['expectedCompDate'] != null ? DateTime.parse(json['expectedCompDate']) : null,
        baseSubBaseCompStatus:json['baseSubBaseCompStatus'],
        date:  json['date'],
        time:  json['time'],
      posted: json['posted'],  // Get the posted status from the database

    );
  }

  Map<String, dynamic> toMap(){
    return {
      'id':id,
      'blockNo':blockNo,
      'roadNo':roadNo,
      'totalLength':totalLength,
      'startDate': startDate?.toString(),
      'expectedCompDate': expectedCompDate?.toString(),
      'baseSubBaseCompStatus':baseSubBaseCompStatus,
      'date':date,
      'time':time,
      'posted': posted,  // Include the posted status


    };
  }
}

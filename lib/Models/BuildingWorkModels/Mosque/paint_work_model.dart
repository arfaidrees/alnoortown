class PaintWorkModel{
  int? id;
  dynamic  block_no;
  dynamic  paint_work_status;
  dynamic date;
  dynamic time;
  dynamic user_id;
  int posted;  // New field to track whether data has been posted

  PaintWorkModel({
    this.id,
    this.block_no,
    this.paint_work_status,
    this.date,
    this.time,
    this.user_id,
    this.posted = 0,  // Default to 0 (not posted)
  });

  factory PaintWorkModel.fromMap(Map<dynamic,dynamic>json)
  {
    return PaintWorkModel(
        id: json['id'],
        block_no: json['block_no'],
        paint_work_status: json['paint_work_status'],
        date:  json['paint_work_date'],
        time:  json['time'],
        user_id: json['user_id'],
      posted: json['posted']??0  // Get the posted status from the database

    );
  }

  Map<String, dynamic> toMap(){
    return {
      'id':id,
      'block_no':block_no,
      'paint_work_status':paint_work_status,
      'paint_work_date':date,
      'time':time,
      'user_id':user_id,
      'posted': posted,  // Include the posted status
    };
  }
}

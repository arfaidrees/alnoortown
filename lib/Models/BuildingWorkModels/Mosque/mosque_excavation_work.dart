class MosqueExcavationWorkModel{
  int? id;
  dynamic block_no;
  dynamic completion_status;
  dynamic date;
  dynamic time;
  dynamic user_id;
  int posted;  // New field to track whether data has been posted

  MosqueExcavationWorkModel({
    this.id,
    this.block_no,
    this.completion_status,
    this.date,
    this.time,
    this.user_id,
    this.posted = 0,  // Default to 0 (not posted)

  });

  factory MosqueExcavationWorkModel.fromMap(Map<dynamic,dynamic>json)
  {
    return MosqueExcavationWorkModel(
      id: json['id'],
      block_no: json['block_no'],
      completion_status: json['completion_status'],
        date:  json['mosque_excavation_work_date'],
        time: json['time'],
        user_id: json['user_id'],
      posted: json['posted']??0  // Get the posted status from the database
    );
  }

  Map<String, dynamic> toMap(){
    return {
      'id':id,
      'block_no':block_no,
      'completion_status':completion_status,
      'mosque_excavation_work_date':date,
      'time':time,
      'user_id':user_id,
      'posted': posted,  // Include the posted status
    };
  }
}

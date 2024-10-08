class AttendanceInModel{
  int? id;
  dynamic time_in;
  dynamic latitude;
  dynamic longitude;
  dynamic live_address;
  dynamic date;
  dynamic user_id;
  int posted;

  AttendanceInModel({
    this.id,
    this.time_in,
    this.latitude,
    this.longitude,
    this. live_address,
    this.date,
    this.user_id,
    this.posted = 0

  });

  factory AttendanceInModel.fromMap(Map<dynamic,dynamic>json)
  {
    return AttendanceInModel(
        id: json['id'],
        time_in: json['time_in'],
        latitude: json['latitude'],
        longitude: json['longitude'],
        live_address: json['live_address'],
        user_id: json['user_id'],
        date:  json['attendance_in_date'],
        posted: json['posted']?? 0

    );
  }

  Map<String, dynamic> toMap(){
    return {
      'id':id,
      'time_in':time_in,
      'latitude':latitude,
      'longitude':longitude,
      'live_address':live_address,
      'user_id':user_id,
      'posted':posted,
      'attendance_in_date':date

    };
  }
}

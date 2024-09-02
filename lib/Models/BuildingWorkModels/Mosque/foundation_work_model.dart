class FoundationWorkModel{
  int? id;
  dynamic blockNo;
  dynamic brickWork;
  dynamic mudFiling;
  dynamic plasterWork;
  dynamic date;
  dynamic time;

  FoundationWorkModel({
    this.id,
    this.blockNo,
    this.brickWork,
    this.mudFiling,
    this.plasterWork,
    this.date,
    this.time

  });

  factory FoundationWorkModel.fromMap(Map<dynamic,dynamic>json)
  {
    return FoundationWorkModel(
        id: json['id'],
        blockNo: json['blockNo'],
        brickWork: json['brickWork'],
        mudFiling: json['mudFiling'],
        plasterWork: json['plasterWork'],
        date:  json['date'],
        time:  json['time']
    );
  }

  Map<String, dynamic> toMap(){
    return {
      'id':id,
      'blockNo':blockNo,
      'brickWork':brickWork,
      'mudFiling':mudFiling,
      'plasterWork':plasterWork,
      'date':date,
      'time':time,


    };
  }
}
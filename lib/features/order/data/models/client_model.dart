class ClientModel {
  final int? clientId;
   String? clientName;
   ClientModel({this.clientId, this.clientName});


  Map<String, dynamic> toJson() => {
        'clientId': clientId,
        'clientName': clientName,
      };
  factory ClientModel.fromJson(Map<String, dynamic> json) =>ClientModel (
       clientId: json['clientId'],
       clientName:json['clientName'] ,
  );
}

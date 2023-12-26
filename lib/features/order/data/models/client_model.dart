class ClientModel {
  final int? clientId;
  String? clientName;
  ClientModel({this.clientId, this.clientName});

  Map<String, dynamic> toJson() => {
        'id': clientId,
        'name': clientName,
      };
  factory ClientModel.fromJson(Map<String, dynamic> json) => ClientModel(
        clientId: json['id'],
        clientName: json['name'],
      );
}

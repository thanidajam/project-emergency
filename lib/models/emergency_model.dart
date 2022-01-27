import 'dart:convert';

class EmergencyModel {
  final String EID;
  final String E_type;
  final String E_name;
  final String E_date;
  final String Pic;
  final String lat;
  final String lng;
  final String Location;
  final String Status;
  final String Send_emer;
  final String Rec_emer;
  EmergencyModel({
    required this.EID,
    required this.E_type,
    required this.E_name,
    required this.E_date,
    required this.Pic,
    required this.lat,
    required this.lng,
    required this.Location,
    required this.Status,
    required this.Send_emer,
    required this.Rec_emer,
  });

  EmergencyModel copyWith({
    String? EID,
    String? E_type,
    String? E_name,
    String? E_date,
    String? pic,
    String? lat,
    String? lng,
    String? Location,
    String? Status,
    String? Send_emer,
    String? Rec_emer,
  }) {
    return EmergencyModel(
      EID: EID ?? this.EID,
      E_type: E_type ?? this.E_type,
      E_name: E_name ?? this.E_name,
      E_date: E_date ?? this.E_date,
      Pic: pic ?? this.Pic,
      lat: lat ?? this.lat,
      lng: lng ?? this.lng,
      Location: Location ?? this.Location,
      Status: Status ?? this.Status,
      Send_emer: Send_emer ?? this.Send_emer,
      Rec_emer: Rec_emer ?? this.Rec_emer,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'EID': EID,
      'E_type': E_type,
      'E_name': E_name,
      'E_date': E_date,
      'pic': Pic,
      'lat': lat,
      'lng': lng,
      'Location': Location,
      'Status': Status,
      'Send_emer': Send_emer,
      'Rec_emer': Rec_emer,
    };
  }

  factory EmergencyModel.fromMap(Map<String, dynamic> map) {
    return EmergencyModel(
      EID: map['EID'] ?? '',
      E_type: map['E_type'] ?? '',
      E_name: map['E_name'] ?? '',
      E_date: map['E_date'] ?? '',
      Pic: map['Pic'] ?? '',
      lat: map['lat'] ?? '',
      lng: map['lng'] ?? '',
      Location: map['Location'] ?? '',
      Status: map['Status'] ?? '',
      Send_emer: map['Send_emer'] ?? '',
      Rec_emer: map['Rec_emer'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory EmergencyModel.fromJson(String source) => EmergencyModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'EmergencyModel(EID: $EID, E_type: $E_type, E_name: $E_name, E_date: $E_date, Pic: $Pic, lat: $lat, lng: $lng, Location: $Location, Status: $Status, Send_emer: $Send_emer, Rec_emer: $Rec_emer)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is EmergencyModel &&
      other.EID == EID &&
      other.E_type == E_type &&
      other.E_name == E_name &&
      other.E_date == E_date &&
      other.Pic == Pic &&
      other.lat == lat &&
      other.lng == lng &&
      other.Location == Location &&
      other.Status == Status &&
      other.Send_emer == Send_emer &&
      other.Rec_emer == Rec_emer;
  }

  @override
  int get hashCode {
    return EID.hashCode ^
      E_type.hashCode ^
      E_name.hashCode ^
      E_date.hashCode ^
      Pic.hashCode ^
      lat.hashCode ^
      lng.hashCode ^
      Location.hashCode ^
      Status.hashCode ^
      Send_emer.hashCode ^
      Rec_emer.hashCode;
  }
}

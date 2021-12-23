import 'dart:convert';

class FirstaidModel {
  final String FID;
  final String Code;
  final String Title;
  final String Text;
  final String Status;
  final String Media;
  FirstaidModel({
    required this.FID,
    required this.Code,
    required this.Title,
    required this.Text,
    required this.Status,
    required this.Media,
  });

  FirstaidModel copyWith({
    String? FID,
    String? Code,
    String? Title,
    String? Text,
    String? Status,
    String? Media,
  }) {
    return FirstaidModel(
      FID: FID ?? this.FID,
      Code: Code ?? this.Code,
      Title: Title ?? this.Title,
      Text: Text ?? this.Text,
      Status: Status ?? this.Status,
      Media: Media ?? this.Media,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'FID': FID,
      'Code': Code,
      'Title': Title,
      'Text': Text,
      'Status': Status,
      'Media': Media,
    };
  }

  factory FirstaidModel.fromMap(Map<String, dynamic> map) {
    return FirstaidModel(
      FID: map['FID'],
      Code: map['Code'],
      Title: map['Title'],
      Text: map['Text'],
      Status: map['Status'],
      Media: map['Media'],
    );
  }

  String toJson() => json.encode(toMap());

  factory FirstaidModel.fromJson(String source) => FirstaidModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'FirstaidModel(FID: $FID, Code: $Code, Title: $Title, Text: $Text, Status: $Status, Media: $Media)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is FirstaidModel &&
      other.FID == FID &&
      other.Code == Code &&
      other.Title == Title &&
      other.Text == Text &&
      other.Status == Status &&
      other.Media == Media;
  }

  @override
  int get hashCode {
    return FID.hashCode ^
      Code.hashCode ^
      Title.hashCode ^
      Text.hashCode ^
      Status.hashCode ^
      Media.hashCode;
  }
}

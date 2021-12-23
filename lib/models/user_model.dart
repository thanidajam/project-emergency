import 'dart:convert';

class UserModel {
  final String UID;
  final String Code;
  final String Username;
  final String Password;
  final String Name;
  final String Email;
  final String Phone;
  final String Type;
  final String image;
  UserModel({
    required this.UID,
    required this.Code,
    required this.Username,
    required this.Password,
    required this.Name,
    required this.Email,
    required this.Phone,
    required this.Type,
    required this.image,
  });

  UserModel copyWith({
    String? UID,
    String? Code,
    String? Username,
    String? Password,
    String? Name,
    String? Email,
    String? Phone,
    String? Type,
    String? image,
  }) {
    return UserModel(
      UID: UID ?? this.UID,
      Code: Code ?? this.Code,
      Username: Username ?? this.Username,
      Password: Password ?? this.Password,
      Name: Name ?? this.Name,
      Email: Email ?? this.Email,
      Phone: Phone ?? this.Phone,
      Type: Type ?? this.Type,
      image: image ?? this.image,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'UID': UID,
      'Code': Code,
      'Username': Username,
      'Password': Password,
      'Name': Name,
      'Email': Email,
      'Phone': Phone,
      'Type': Type,
      'image': image,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      UID: map['UID'],
      Code: map['Code'],
      Username: map['Username'],
      Password: map['Password'],
      Name: map['Name'],
      Email: map['Email'],
      Phone: map['Phone'],
      Type: map['Type'],
      image: map['image'],
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) => UserModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'UserModel(UID: $UID, Code: $Code, Username: $Username, Password: $Password, Name: $Name, Email: $Email, Phone: $Phone, Type: $Type, image: $image)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is UserModel &&
      other.UID == UID &&
      other.Code == Code &&
      other.Username == Username &&
      other.Password == Password &&
      other.Name == Name &&
      other.Email == Email &&
      other.Phone == Phone &&
      other.Type == Type &&
      other.image == image;
  }

  @override
  int get hashCode {
    return UID.hashCode ^
      Code.hashCode ^
      Username.hashCode ^
      Password.hashCode ^
      Name.hashCode ^
      Email.hashCode ^
      Phone.hashCode ^
      Type.hashCode ^
      image.hashCode;
  }
}

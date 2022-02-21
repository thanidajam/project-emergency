import 'dart:convert';

class UserModel {
  String UID;
  String Code;
  String Username;
  String Password;
  String Name;
  String Email;
  String Phone;
  String Type;
  String image;
  String Token;
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
    required this.Token,
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
    String? Token,
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
      Token: Token ?? this.Token,
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
      'Token': Token,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      UID: map['UID'] ?? '',
      Code: map['Code'] ?? '',
      Username: map['Username'] ?? '',
      Password: map['Password'] ?? '',
      Name: map['Name'] ?? '',
      Email: map['Email'] ?? '',
      Phone: map['Phone'] ?? '',
      Type: map['Type'] ?? '',
      image: map['image'] ?? '',
      Token: map['Token'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) => UserModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'UserModel(UID: $UID, Code: $Code, Username: $Username, Password: $Password, Name: $Name, Email: $Email, Phone: $Phone, Type: $Type, image: $image, Token: $Token)';
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
      other.image == image &&
      other.Token == Token;
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
      image.hashCode ^
      Token.hashCode;
  }
}

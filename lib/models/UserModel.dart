import 'dart:convert';

class UserModel {
  final int id;
  final String name;
  final String email;
  final String mobilePhone;
  
  UserModel({
    required this.id,
    required this.name,
    required this.email,
    required this.mobilePhone,
  });
  

  UserModel copyWith({
    int? id,
    String? name,
    String? email,
    String? mobilePhone,
  }) {
    return UserModel(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      mobilePhone: mobilePhone ?? this.mobilePhone,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'mobilePhone': mobilePhone,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: map['id'],
      name: map['name'],
      email: map['email'],
      mobilePhone: map['mobilePhone'],
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) => UserModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'UserModel(id: $id, name: $name, email: $email, mobilePhone: $mobilePhone)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is UserModel &&
      other.id == id &&
      other.name == name &&
      other.email == email &&
      other.mobilePhone == mobilePhone;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      name.hashCode ^
      email.hashCode ^
      mobilePhone.hashCode;
  }
}

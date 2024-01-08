import 'dart:convert';

class User {
  String? id;
  String? name;
  String? email;
  String? nip;
  String? idUnit;
  String? jabatan;
  String? img;
  String? username;
  String? token;

  User({
    this.id,
    this.name,
    this.email,
    this.nip,
    this.idUnit,
    this.jabatan,
    this.img,
    this.username,
    this.token,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["data"]["id"],
        name: json["data"]["name"],
        email: json["data"]["email"],
        nip: json["data"]["nip"],
        idUnit: json["data"]["id_unit"],
        jabatan: json["data"]["jabatan"],
        img: json["data"]["img"],
        username: json["data"]["username"],
        token: json["data"]["token"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "email": email,
        "nip": nip,
        "id_unit": idUnit,
        "jabatan": jabatan,
        "img": img,
        "username": username,
        "token": token,
      };
}

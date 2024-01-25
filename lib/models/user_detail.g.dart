// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_detail.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserDetailImpl _$$UserDetailImplFromJson(Map<String, dynamic> json) =>
    _$UserDetailImpl(
      id: json['id'] as int?,
      name: json['name'] as String?,
      email: json['email'] as String?,
      emailVerifiedAt: json['email_verified_at'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      nip: json['nip'] as String?,
      idUnit: json['id_unit'] as int?,
      jabatan: json['jabatan'] as String?,
      img: json['img'] as String?,
      username: json['username'] as String?,
      currentLogin: json['current_login'],
      nmUnit: json['nm_unit'] as String?,
      lat: json['lat'] as String?,
      long: json['long'] as String?,
      radius: json['radius'] as int?,
    );

Map<String, dynamic> _$$UserDetailImplToJson(_$UserDetailImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'email': instance.email,
      'email_verified_at': instance.emailVerifiedAt,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
      'nip': instance.nip,
      'id_unit': instance.idUnit,
      'jabatan': instance.jabatan,
      'img': instance.img,
      'username': instance.username,
      'current_login': instance.currentLogin,
      'nm_unit': instance.nmUnit,
      'lat': instance.lat,
      'long': instance.long,
      'radius': instance.radius,
    };

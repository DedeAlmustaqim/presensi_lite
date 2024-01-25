// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserModelImpl _$$UserModelImplFromJson(Map<String, dynamic> json) =>
    _$UserModelImpl(
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
      token: json['token'] as String?,
    );

Map<String, dynamic> _$$UserModelImplToJson(_$UserModelImpl instance) =>
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
      'token': instance.token,
    };

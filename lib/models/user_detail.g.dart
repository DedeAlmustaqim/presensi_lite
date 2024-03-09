// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_detail.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserDetailImpl _$$UserDetailImplFromJson(Map<String, dynamic> json) =>
    _$UserDetailImpl(
      success: json['success'] as bool?,
      id: json['id'] as int?,
      name: json['name'] as String?,
      email: json['email'] as String?,
      nik: json['nik'] as String?,
      nip: json['nip'] as String?,
      jabatan: json['jabatan'] as String?,
      img: json['img'] as String?,
      isAgree: json['is_agree'] as String?,
      nmUnit: json['nm_unit'] as String?,
      lat: json['lat'] as String?,
      long: json['long'] as String?,
    );

Map<String, dynamic> _$$UserDetailImplToJson(_$UserDetailImpl instance) =>
    <String, dynamic>{
      'success': instance.success,
      'id': instance.id,
      'name': instance.name,
      'email': instance.email,
      'nik': instance.nik,
      'nip': instance.nip,
      'jabatan': instance.jabatan,
      'img': instance.img,
      'is_agree': instance.isAgree,
      'nm_unit': instance.nmUnit,
      'lat': instance.lat,
      'long': instance.long,
    };

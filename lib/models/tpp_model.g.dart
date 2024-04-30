// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tpp_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TppModelImpl _$$TppModelImplFromJson(Map<String, dynamic> json) =>
    _$TppModelImpl(
      id: json['id'] as int?,
      idUser: json['id_user'] as int?,
      tl1: (json['tl1'] as num?)?.toDouble(),
      tl2: json['tl2'] as int?,
      tl3: json['tl3'] as int?,
      tl4: json['tl4'] as int?,
      psw1: json['psw1'] as int?,
      psw2: json['psw2'] as int?,
      psw3: json['psw3'] as int?,
      psw4: (json['psw4'] as num?)?.toDouble(),
      thck1: json['thck1'] as int?,
      thck2: json['thck2'] as int?,
      thck3: json['thck3'] as int?,
      tk: json['tk'] as int?,
      tu: json['tu'] as int?,
      lhkpn: json['lhkpn'] as int?,
      tptgr: json['tptgr'] as String?,
      dk: (json['dk'] as num?)?.toDouble(),
      subtraction: (json['subtraction'] as num?)?.toDouble(),
      month: json['month'] as int?,
      year: json['year'] as int?,
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
      updatedBy: json['updated_by'] as String?,
      name: json['name'] as String?,
      statusPeg: json['status_peg'] as String?,
      lhkpnLhasn: json['lhkpn_lhasn'] as String?,
      nip: json['nip'] as String?,
    );

Map<String, dynamic> _$$TppModelImplToJson(_$TppModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'id_user': instance.idUser,
      'tl1': instance.tl1,
      'tl2': instance.tl2,
      'tl3': instance.tl3,
      'tl4': instance.tl4,
      'psw1': instance.psw1,
      'psw2': instance.psw2,
      'psw3': instance.psw3,
      'psw4': instance.psw4,
      'thck1': instance.thck1,
      'thck2': instance.thck2,
      'thck3': instance.thck3,
      'tk': instance.tk,
      'tu': instance.tu,
      'lhkpn': instance.lhkpn,
      'tptgr': instance.tptgr,
      'dk': instance.dk,
      'subtraction': instance.subtraction,
      'month': instance.month,
      'year': instance.year,
      'updated_at': instance.updatedAt?.toIso8601String(),
      'updated_by': instance.updatedBy,
      'name': instance.name,
      'status_peg': instance.statusPeg,
      'lhkpn_lhasn': instance.lhkpnLhasn,
      'nip': instance.nip,
    };

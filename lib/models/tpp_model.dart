import 'package:freezed_annotation/freezed_annotation.dart';

part 'tpp_model.freezed.dart';
part 'tpp_model.g.dart';

@freezed
class TppModel with _$TppModel {
  factory TppModel({
    int? id,
    @JsonKey(name: 'id_user') int? idUser,
    double? tl1,
    int? tl2,
    int? tl3,
    int? tl4,
    int? psw1,
    int? psw2,
    int? psw3,
    double? psw4,
    int? thck1,
    int? thck2,
    int? thck3,
    int? tk,
    int? tu,
    int? lhkpn,
    String? tptgr,
    double? dk,
    double? subtraction,
    int? month,
    int? year,
    @JsonKey(name: 'updated_at') DateTime? updatedAt,
    @JsonKey(name: 'updated_by') String? updatedBy,
    String? name,
    @JsonKey(name: 'status_peg') String? statusPeg,
    @JsonKey(name: 'lhkpn_lhasn') String? lhkpnLhasn,
    String? nip,
  }) = _TppModel;

  factory TppModel.fromJson(Map<String, dynamic> json) =>
      _$TppModelFromJson(json);
}

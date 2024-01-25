// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_detail.freezed.dart';
part 'user_detail.g.dart';

@freezed
class UserDetail with _$UserDetail {
  factory UserDetail({
    int? id,
    String? name,
    String? email,
    @JsonKey(name: 'email_verified_at') dynamic emailVerifiedAt,
    @JsonKey(name: 'created_at') dynamic createdAt,
    @JsonKey(name: 'updated_at') dynamic updatedAt,
    String? nip,
    @JsonKey(name: 'id_unit') int? idUnit,
    String? jabatan,
    String? img,
    String? username,
    @JsonKey(name: 'current_login') dynamic currentLogin,
    @JsonKey(name: 'nm_unit') String? nmUnit,
    String? lat,
    String? long,
    int? radius,
  }) = _UserDetail;

  factory UserDetail.fromJson(Map<String, dynamic> json) =>
      _$UserDetailFromJson(json);
}

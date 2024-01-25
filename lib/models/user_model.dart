// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_model.freezed.dart';
part 'user_model.g.dart';

@freezed
class UserModel with _$UserModel {
  factory UserModel({
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
    String? token,
  }) = _UserModel;

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);
}

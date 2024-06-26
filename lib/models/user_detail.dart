// ignore_for_file: invalid_annotation_target, duplicate_ignore

import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_detail.freezed.dart';
part 'user_detail.g.dart';

@freezed
class UserDetail with _$UserDetail {
  factory UserDetail({
    bool? success,
    int? id,
    String? name,
    String? email,
    String? nik,
    String? nip,
    String? jabatan,
    String? img,
    // ignore: invalid_annotation_target
    @JsonKey(name: 'is_agree') String? isAgree,
    @JsonKey(name: 'nm_unit') String? nmUnit,
    String? lat,
    String? long,
  }) = _UserDetail;

  factory UserDetail.fromJson(Map<String, dynamic> json) =>
      _$UserDetailFromJson(json);
}

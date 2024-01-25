// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UserModel _$UserModelFromJson(Map<String, dynamic> json) {
  return _UserModel.fromJson(json);
}

/// @nodoc
mixin _$UserModel {
  int? get id => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get email => throw _privateConstructorUsedError;
  @JsonKey(name: 'email_verified_at')
  dynamic get emailVerifiedAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  dynamic get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_at')
  dynamic get updatedAt => throw _privateConstructorUsedError;
  String? get nip => throw _privateConstructorUsedError;
  @JsonKey(name: 'id_unit')
  int? get idUnit => throw _privateConstructorUsedError;
  String? get jabatan => throw _privateConstructorUsedError;
  String? get img => throw _privateConstructorUsedError;
  String? get username => throw _privateConstructorUsedError;
  @JsonKey(name: 'current_login')
  dynamic get currentLogin => throw _privateConstructorUsedError;
  String? get token => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserModelCopyWith<UserModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserModelCopyWith<$Res> {
  factory $UserModelCopyWith(UserModel value, $Res Function(UserModel) then) =
      _$UserModelCopyWithImpl<$Res, UserModel>;
  @useResult
  $Res call(
      {int? id,
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
      String? token});
}

/// @nodoc
class _$UserModelCopyWithImpl<$Res, $Val extends UserModel>
    implements $UserModelCopyWith<$Res> {
  _$UserModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? email = freezed,
    Object? emailVerifiedAt = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? nip = freezed,
    Object? idUnit = freezed,
    Object? jabatan = freezed,
    Object? img = freezed,
    Object? username = freezed,
    Object? currentLogin = freezed,
    Object? token = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      emailVerifiedAt: freezed == emailVerifiedAt
          ? _value.emailVerifiedAt
          : emailVerifiedAt // ignore: cast_nullable_to_non_nullable
              as dynamic,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as dynamic,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as dynamic,
      nip: freezed == nip
          ? _value.nip
          : nip // ignore: cast_nullable_to_non_nullable
              as String?,
      idUnit: freezed == idUnit
          ? _value.idUnit
          : idUnit // ignore: cast_nullable_to_non_nullable
              as int?,
      jabatan: freezed == jabatan
          ? _value.jabatan
          : jabatan // ignore: cast_nullable_to_non_nullable
              as String?,
      img: freezed == img
          ? _value.img
          : img // ignore: cast_nullable_to_non_nullable
              as String?,
      username: freezed == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String?,
      currentLogin: freezed == currentLogin
          ? _value.currentLogin
          : currentLogin // ignore: cast_nullable_to_non_nullable
              as dynamic,
      token: freezed == token
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserModelImplCopyWith<$Res>
    implements $UserModelCopyWith<$Res> {
  factory _$$UserModelImplCopyWith(
          _$UserModelImpl value, $Res Function(_$UserModelImpl) then) =
      __$$UserModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? id,
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
      String? token});
}

/// @nodoc
class __$$UserModelImplCopyWithImpl<$Res>
    extends _$UserModelCopyWithImpl<$Res, _$UserModelImpl>
    implements _$$UserModelImplCopyWith<$Res> {
  __$$UserModelImplCopyWithImpl(
      _$UserModelImpl _value, $Res Function(_$UserModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? email = freezed,
    Object? emailVerifiedAt = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? nip = freezed,
    Object? idUnit = freezed,
    Object? jabatan = freezed,
    Object? img = freezed,
    Object? username = freezed,
    Object? currentLogin = freezed,
    Object? token = freezed,
  }) {
    return _then(_$UserModelImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      emailVerifiedAt: freezed == emailVerifiedAt
          ? _value.emailVerifiedAt
          : emailVerifiedAt // ignore: cast_nullable_to_non_nullable
              as dynamic,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as dynamic,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as dynamic,
      nip: freezed == nip
          ? _value.nip
          : nip // ignore: cast_nullable_to_non_nullable
              as String?,
      idUnit: freezed == idUnit
          ? _value.idUnit
          : idUnit // ignore: cast_nullable_to_non_nullable
              as int?,
      jabatan: freezed == jabatan
          ? _value.jabatan
          : jabatan // ignore: cast_nullable_to_non_nullable
              as String?,
      img: freezed == img
          ? _value.img
          : img // ignore: cast_nullable_to_non_nullable
              as String?,
      username: freezed == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String?,
      currentLogin: freezed == currentLogin
          ? _value.currentLogin
          : currentLogin // ignore: cast_nullable_to_non_nullable
              as dynamic,
      token: freezed == token
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserModelImpl implements _UserModel {
  _$UserModelImpl(
      {this.id,
      this.name,
      this.email,
      @JsonKey(name: 'email_verified_at') this.emailVerifiedAt,
      @JsonKey(name: 'created_at') this.createdAt,
      @JsonKey(name: 'updated_at') this.updatedAt,
      this.nip,
      @JsonKey(name: 'id_unit') this.idUnit,
      this.jabatan,
      this.img,
      this.username,
      @JsonKey(name: 'current_login') this.currentLogin,
      this.token});

  factory _$UserModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserModelImplFromJson(json);

  @override
  final int? id;
  @override
  final String? name;
  @override
  final String? email;
  @override
  @JsonKey(name: 'email_verified_at')
  final dynamic emailVerifiedAt;
  @override
  @JsonKey(name: 'created_at')
  final dynamic createdAt;
  @override
  @JsonKey(name: 'updated_at')
  final dynamic updatedAt;
  @override
  final String? nip;
  @override
  @JsonKey(name: 'id_unit')
  final int? idUnit;
  @override
  final String? jabatan;
  @override
  final String? img;
  @override
  final String? username;
  @override
  @JsonKey(name: 'current_login')
  final dynamic currentLogin;
  @override
  final String? token;

  @override
  String toString() {
    return 'UserModel(id: $id, name: $name, email: $email, emailVerifiedAt: $emailVerifiedAt, createdAt: $createdAt, updatedAt: $updatedAt, nip: $nip, idUnit: $idUnit, jabatan: $jabatan, img: $img, username: $username, currentLogin: $currentLogin, token: $token)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.email, email) || other.email == email) &&
            const DeepCollectionEquality()
                .equals(other.emailVerifiedAt, emailVerifiedAt) &&
            const DeepCollectionEquality().equals(other.createdAt, createdAt) &&
            const DeepCollectionEquality().equals(other.updatedAt, updatedAt) &&
            (identical(other.nip, nip) || other.nip == nip) &&
            (identical(other.idUnit, idUnit) || other.idUnit == idUnit) &&
            (identical(other.jabatan, jabatan) || other.jabatan == jabatan) &&
            (identical(other.img, img) || other.img == img) &&
            (identical(other.username, username) ||
                other.username == username) &&
            const DeepCollectionEquality()
                .equals(other.currentLogin, currentLogin) &&
            (identical(other.token, token) || other.token == token));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      name,
      email,
      const DeepCollectionEquality().hash(emailVerifiedAt),
      const DeepCollectionEquality().hash(createdAt),
      const DeepCollectionEquality().hash(updatedAt),
      nip,
      idUnit,
      jabatan,
      img,
      username,
      const DeepCollectionEquality().hash(currentLogin),
      token);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UserModelImplCopyWith<_$UserModelImpl> get copyWith =>
      __$$UserModelImplCopyWithImpl<_$UserModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserModelImplToJson(
      this,
    );
  }
}

abstract class _UserModel implements UserModel {
  factory _UserModel(
      {final int? id,
      final String? name,
      final String? email,
      @JsonKey(name: 'email_verified_at') final dynamic emailVerifiedAt,
      @JsonKey(name: 'created_at') final dynamic createdAt,
      @JsonKey(name: 'updated_at') final dynamic updatedAt,
      final String? nip,
      @JsonKey(name: 'id_unit') final int? idUnit,
      final String? jabatan,
      final String? img,
      final String? username,
      @JsonKey(name: 'current_login') final dynamic currentLogin,
      final String? token}) = _$UserModelImpl;

  factory _UserModel.fromJson(Map<String, dynamic> json) =
      _$UserModelImpl.fromJson;

  @override
  int? get id;
  @override
  String? get name;
  @override
  String? get email;
  @override
  @JsonKey(name: 'email_verified_at')
  dynamic get emailVerifiedAt;
  @override
  @JsonKey(name: 'created_at')
  dynamic get createdAt;
  @override
  @JsonKey(name: 'updated_at')
  dynamic get updatedAt;
  @override
  String? get nip;
  @override
  @JsonKey(name: 'id_unit')
  int? get idUnit;
  @override
  String? get jabatan;
  @override
  String? get img;
  @override
  String? get username;
  @override
  @JsonKey(name: 'current_login')
  dynamic get currentLogin;
  @override
  String? get token;
  @override
  @JsonKey(ignore: true)
  _$$UserModelImplCopyWith<_$UserModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

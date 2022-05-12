import 'package:json_annotation/json_annotation.dart';
import 'user_support_response.dart';
import 'user_data_response.dart';

part 'user_response.g.dart';

@JsonSerializable()
class UserResponse {
  /// The generated code assumes these values exist in JSON.
  final UserDataResponse data;
  final UserSupportResponse support;

  UserResponse({required this.data, required this.support});

  /// Connect the generated [_$UserResponseFromJson] function to the `fromJson`
  /// factory.
  factory UserResponse.fromJson(Map<String, dynamic> json) =>
      _$UserResponseFromJson(json);

  /// Connect the generated [_$UserResponseToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$UserResponseToJson(this);
}

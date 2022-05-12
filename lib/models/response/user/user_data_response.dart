import 'package:json_annotation/json_annotation.dart';

part 'user_data_response.g.dart';

@JsonSerializable()
class UserDataResponse {
  /// The generated code assumes these values exist in JSON.
  final String id, email, first_name, last_name, avatar;

  UserDataResponse({
    required this.id,
    required this.email,
    required this.first_name,
    required this.last_name,
    required this.avatar,
  });

  /// Connect the generated [_$UserDataResponseFromJson] function to the `fromJson`
  /// factory.
  factory UserDataResponse.fromJson(Map<String, dynamic> json) =>
      _$UserDataResponseFromJson(json);

  /// Connect the generated [_$UserDataResponseToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$UserDataResponseToJson(this);
}

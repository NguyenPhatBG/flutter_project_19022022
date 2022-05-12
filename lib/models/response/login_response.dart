import 'package:json_annotation/json_annotation.dart';

part 'login_response.g.dart';

@JsonSerializable()
class LoginResponse {
  /// The generated code assumes these values exist in JSON.
  final String? token, error;

  LoginResponse({this.token, this.error});

  /// Connect the generated [_$LoginResponseFromJson] function to the `fromJson`
  /// factory.
  factory LoginResponse.fromJson(Map<String, dynamic> json) => _$LoginResponseFromJson(json);

  /// Connect the generated [_$LoginResponseToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$LoginResponseToJson(this);
}
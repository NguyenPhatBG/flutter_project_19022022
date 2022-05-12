import 'package:json_annotation/json_annotation.dart';

part 'register_response.g.dart';

@JsonSerializable()
class RegisterResponse {
  /// The generated code assumes these values exist in JSON.
  final String? id, token, error;

  RegisterResponse({this.id, this.token, this.error});

  /// Connect the generated [_$RegisterResponseFromJson] function to the `fromJson`
  /// factory.
  factory RegisterResponse.fromJson(Map<String, dynamic> json) =>
      _$RegisterResponseFromJson(json);

  /// Connect the generated [_$RegisterResponseToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$RegisterResponseToJson(this);
}

import 'package:json_annotation/json_annotation.dart';

part 'user_support_response.g.dart';

@JsonSerializable()
class UserSupportResponse {
  /// The generated code assumes these values exist in JSON.
  final String url, text;

  UserSupportResponse({required this.url, required this.text});

  /// Connect the generated [_$UserSupportResponseFromJson] function to the `fromJson`
  /// factory.
  factory UserSupportResponse.fromJson(Map<String, dynamic> json) =>
      _$UserSupportResponseFromJson(json);

  /// Connect the generated [_$UserSupportResponseToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$UserSupportResponseToJson(this);
}

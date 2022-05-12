import 'package:json_annotation/json_annotation.dart';
import 'user_support_response.dart';
import 'user_data_response.dart';

part 'user_list_response.g.dart';

@JsonSerializable()
class UserListResponse {
  /// The generated code assumes these values exist in JSON.
  final int page;
  final int per_page;
  final int total;
  final int total_pages;
  final List<UserDataResponse> data;
  final UserSupportResponse support;

  UserListResponse({
    required this.page,
    required this.per_page,
    required this.total,
    required this.total_pages,
    required this.data,
    required this.support,
  });

  /// Connect the generated [_$UserListResponseFromJson] function to the `fromJson`
  /// factory.
  factory UserListResponse.fromJson(Map<String, dynamic> json) =>
      _$UserListResponseFromJson(json);

  /// Connect the generated [_$UserListResponseToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$UserListResponseToJson(this);
}

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_list_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserListResponse _$UserListResponseFromJson(Map<String, dynamic> json) =>
    UserListResponse(
      page: json['page'] as int,
      per_page: json['per_page'] as int,
      total: json['total'] as int,
      total_pages: json['total_pages'] as int,
      data: (json['data'] as List<dynamic>)
          .map((e) => UserDataResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
      support:
          UserSupportResponse.fromJson(json['support'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$UserListResponseToJson(UserListResponse instance) =>
    <String, dynamic>{
      'page': instance.page,
      'per_page': instance.per_page,
      'total': instance.total,
      'total_pages': instance.total_pages,
      'data': instance.data,
      'support': instance.support,
    };

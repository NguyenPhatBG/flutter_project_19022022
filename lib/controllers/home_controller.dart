import 'dart:async';

import 'package:flutter/material.dart';
import 'package:project_19022022/data/api_resource.dart';
import 'package:project_19022022/data/base_network.dart';
import 'package:project_19022022/models/response/user/user_list_response.dart';
import 'package:project_19022022/models/response/user/user_support_response.dart';

class HomeController extends ChangeNotifier {
  var users = UserListResponse.withEmpty(
    2,
    6,
    12,
    2,
    [],
    UserSupportResponse(text: '', url: ''),
  );
  int currentPage = 1;

  HomeController() {
    getListUser();
  }

  void requestToUserDetail(
      BuildContext context, int id, UserListResponse user) {
    Navigator.of(context).pushNamed(
      '/user_detail',
      arguments: {'id': id, 'user': user},
    );
  }

  Future<void> getListUser() async {
    try {
      var json = await BaseService()
          .get(ApiResource.getListUsers + '?page=$currentPage')
          .catchError((error) {});
      if (json != null) {
        users = UserListResponse.fromJson(json);
        notifyListeners();
      }
    } catch (exception) {
      throw Exception(exception.toString());
    }
  }
}

import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter_clean_architecture_bloc/core/error/exceptions.dart';
import 'package:flutter_clean_architecture_bloc/core/network/rest_client_service.dart';

abstract class HomeRemoteDataSource {
  Future<bool> logoutUser(String token);
}

class HomeRemoteDataSourceImpl extends HomeRemoteDataSource {
  final RestClientService restClientService;

  HomeRemoteDataSourceImpl({@required this.restClientService});

  @override
  Future<bool> logoutUser(String token) async {
    final response = await restClientService.logoutUser(
        jsonEncode({
          'token': token,
        }),
        token);
    if (response.statusCode != 204) {
      throw ServerException();
    }
    return true;
  }
}

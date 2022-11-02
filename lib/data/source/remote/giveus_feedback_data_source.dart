import 'dart:convert';

import 'package:dio/dio.dart';

import 'package:online_shop/data/common/http_validate_respone.dart';
import 'package:online_shop/data/entity/product_entity.dart';

abstract class IRemoteGiveUsFeedBackDataSource {
  Future<int> sendGiveUsFeedBack(
      String email, String name, String subject, String message);
}

class RemoteGiveUsFeedBackDataSource
    with HttpValidateRespone
    implements IRemoteGiveUsFeedBackDataSource {
  final Dio httpCliend;
  RemoteGiveUsFeedBackDataSource(this.httpCliend);
  @override
  Future<int> sendGiveUsFeedBack(
      String email, String name, String subject, String message) async {
    final respone = await httpCliend.post(
      ProdcutSort().emailSendGiveUsFeedBack,
      data: json.encode({
        "service_id": "service_thha95k",
        "template_id": "template_u19u98f",
        "user_id": "XZHT9xJ29pArXSCz2",
        "template_params": {
          "name": name,
          "user_email": email,
          "subject": subject,
          "message": message
        }
      }),
    );
    validateRespone(respone);
    return respone.statusCode ?? 201;
  }
}

import 'package:dio/dio.dart';

import '../../common/exception.dart';

mixin HttpValidateRespone {
  validateRespone(Response response) {
    if (response.statusCode != 200) {
      throw AppException();
    }
  }
}

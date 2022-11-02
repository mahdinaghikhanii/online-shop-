import 'package:dio/dio.dart';

final httpClients = Dio(BaseOptions(baseUrl: "https://fakestoreapi.com/"));
final httpClientsEmailSend = Dio(
  BaseOptions(baseUrl: "https://api.emailjs.com/", headers: {
    'origin': 'http://localhost',
    'Content-Type': 'application/json',
  }),
);

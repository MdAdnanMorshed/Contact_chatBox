import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import '../../main.dart';

class NewsRepo {

  Future getMessageHistoryList(String userId) async {
    print('NewsRepo.getMessageHistoryList >> userId : $userId');

    var token= await prefs.getString('Token');
    var baseUrl = 'http://svkraft.shop/api/sms-history?to_user=$userId';
    Uri url = Uri.parse(baseUrl);
    try {
      final response = await http.get(url, headers: {
        "Accept": "application/json",
        "Authorization": 'Bearer $token'
      });
      if (kDebugMode) {
        print(' url  $url');
        print(' Status Code ${response.statusCode.toString()}');
        print(' res  ${response.body.toString()}');
      }
      return response;
    } on Exception catch (exception) {
      rethrow;
    } catch (error) {
      throw Exception(error);
    }
  }

  ///done
  Future getContactList() async {
    var token= await prefs.getString('Token');
    print('token : $token');
    var baseUrl = 'http://svkraft.shop/api/chat-list';
    Uri url = Uri.parse(baseUrl);


     Map<String, String> headerMapWithToken = {
      "Accept": "application/json",
      "Authorization": 'Bearer $token'
    };

    print('token <<<<<<< >>>>>>>>>> $token');
    try {
      final response = await http.get(url, headers: headerMapWithToken);
      if (kDebugMode) {
        print(' url  $url');
        print(' Status Code ${response.statusCode.toString()}');
        print(' res  ${response.body.toString()}');
      }
      return response;
    } on Exception catch (exception) {
      rethrow;
    } catch (error) {
      throw Exception(error);
    }
  }

  Future sendMessage(String email, String password) async {
    var baseUrl = 'http://svkraft.shop/api/send-sms';

    Uri url = Uri.parse(baseUrl);
    try {
      final response = await http.post(url,
          body: jsonEncode({
            'to_user': email.toString(),
            'message': password.toString(),
          }),
          headers: {
            "Accept": "application/json",
          });
      if (kDebugMode) {
        print(' url  $url');
        print(' Status Code ${response.statusCode.toString()}');
        print(' res  ${jsonDecode(response.body.toString())}');
      }
      return response;
    } on Exception catch (exception) {
      rethrow;
    } catch (error) {
      throw Exception(error);
    }
  }
  ///done
  Future signInAuth(String mailOrPhone, String password) async {
    print('mailOrPhone : $mailOrPhone '  ' pass : $password');
    var baseUrl = 'http://svkraft.shop/api/login';
    Uri url = Uri.parse(baseUrl);
    try {
      final response = await http.post(url,
          body: {
            'phone': mailOrPhone.toString(),
            'password': password.toString(),
          },
          headers: {
            "Accept": "application/json",
          });
      if (kDebugMode) {
        print(' url  $url');
        print(' Status Code ${response.statusCode.toString()}');
        print(' res  ${jsonDecode(response.body)}');
      }
      return response;
    } on Exception catch (exception) {
      rethrow;
    } catch (error) {
      throw Exception(error);
    }
  }

}

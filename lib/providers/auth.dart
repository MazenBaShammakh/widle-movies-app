import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Auth with ChangeNotifier {
  String? _username;

  String? get username => _username;

  Future<bool> authenticate(String username, BuildContext context) async {
    final _url =
        Uri.parse('http://165.22.75.82/v1/users/$username/authentication');
    bool isSuccess = true;
    try {
      final response = await http.get(_url);
      final responseData = json.decode(response.body);
      if (responseData['data']['new_user'] == true) {
        await showDialog(
          context: context,
          builder: (_) => AlertDialog(
            title: const Text('Username doesn\'t exist'),
            content: const Text('Do want to create a new username?'),
            actions: [
              TextButton(
                onPressed: () {
                  isSuccess = false;
                  Navigator.of(context).pop();
                },
                child: const Text('No'),
              ),
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('Yes'),
              ),
            ],
          ),
        );
      }
      _username = username;
      notifyListeners();
      return isSuccess;
    } catch (error) {
      rethrow;
    }
  }

  void logout() {
    _username = null;
    notifyListeners();
  }
}

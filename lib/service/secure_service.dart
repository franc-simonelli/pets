import 'dart:convert';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:petsguide/model/logged_user_mode.dart';

class SecureService {
  FlutterSecureStorage? _storage;
  LoggedUser? _loggedUser;
  final String _userLoggedKey = "LOGGED_USER";
  final String _userDataKey = "USER_DATA";

  SecureService() {
    _storage = new FlutterSecureStorage();
  }

  Future<bool> isLogged() async {
    var loggedUser = await getLoggedUser();
    return loggedUser != null;
  }

  Future<LoggedUser?> getLoggedUser() async {
    var value = await _storage!.read(key: _userLoggedKey);
    if (value == null || value.isEmpty) {
      _loggedUser = null;
    } else {
      _loggedUser = LoggedUser.fromJson(json.decode(value));
    }
    return _loggedUser;
  }

  Future<String?> getUserId() async {
    var value = await _storage!.read(key: _userLoggedKey);
    if (value == null || value.isEmpty) {
      _loggedUser = null;
    } else {
      _loggedUser = LoggedUser.fromJson(json.decode(value));
    }
    return _loggedUser!.userId;
  }

  Future setLoggedUser(LoggedUser? value) async {
    if (value != null) {
      var serUser = jsonEncode(value.toJson());
      _storage!.write(key: _userLoggedKey, value: serUser);
    } else {
      _storage!.delete(key: _userLoggedKey);
    }
    _loggedUser = value;
  }

}
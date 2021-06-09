/// username : "coding"
/// password : "123456"
/// isRead : true
/// accessToken : "xsaxasxasxasx"

class User {
  String _username;
  String _password;
  bool _isRead;
  String _accessToken;

  String get username => _username;
  String get password => _password;
  bool get isRead => _isRead;
  String get accessToken => _accessToken;

  User({
      String username, 
      String password, 
      bool isRead, 
      String accessToken}){
    _username = username;
    _password = password;
    _isRead = isRead;
    _accessToken = accessToken;
}

  User.fromJson(dynamic json) {
    _username = json["username"];
    _password = json["password"];
    _isRead = json["isRead"];
    _accessToken = json["accessToken"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["username"] = _username;
    map["password"] = _password;
    map["isRead"] = _isRead;
    map["accessToken"] = _accessToken;
    return map;
  }

}
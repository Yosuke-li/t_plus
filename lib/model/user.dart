/// username : "coding"
/// password : "123456"
/// isRead : true
/// accessToken : "xsaxasxasxasx"

class User {
  String username;
  String password;
  bool isRead;
  String accessToken;
  String refreshToken;

  User({
      String username, 
      String password, 
      String refreshToken,
      bool isRead,
      String accessToken}){
    username = username;
    password = password;
    isRead = isRead;
    accessToken = accessToken;
    refreshToken = refreshToken;
}

  User.fromJson(dynamic json) {
    username = json["username"];
    password = json["password"];
    isRead = json["isRead"];
    accessToken = json["accessToken"];
    refreshToken = json["refreshToken"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["username"] = username;
    map["password"] = password;
    map["isRead"] = isRead;
    map["accessToken"] = accessToken;
    map["refreshToken"] = refreshToken;
    return map;
  }

}
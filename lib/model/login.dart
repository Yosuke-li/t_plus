class LoginModel {
  String? msg;
  int? code;
  String? accessToken;
  String? refreshToken;

  LoginModel({
    this.accessToken,
    this.refreshToken,
    this.code,
    this.msg,
  });

  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();
    map['msg'] = msg;
    map['code'] = code;
    map['refreshToken'] = refreshToken;
    map['accessToken'] = accessToken;
    return map;
  }

  LoginModel.fromJson(Map<String, dynamic> map) {
    this.msg = map['msg'];
    this.code = map['code'];
    this.accessToken = map['access_token'];
    this.refreshToken = map['refresh_token'];
  }

  String toString() {
    return 'LoginModel[msg=$msg, code=$code, refreshToken=$refreshToken, accessToken=$accessToken]';
  }

  static List<LoginModel> listFromJson(List<dynamic> json) {
    return json == null
        ? <LoginModel>[]
        : json.map((e) => LoginModel.fromJson(e)).toList();
  }
}

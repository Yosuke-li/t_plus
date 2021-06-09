class LoginModel {
  String msg;
  int code;
  dynamic data;

  LoginModel({
    this.data,
    this.code,
    this.msg,
  });

  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();
    map['msg'] = msg;
    map['code'] = code;
    map['data'] = data;
    return map;
  }

  LoginModel.fromJson(Map<String, dynamic> map) {
    this.msg = map['msg'];
    this.code = map['code'];
    this.data = map['data'];
  }

  String toString() {
    return 'LoginModel[msg=$msg, code=$code, data=$data]';
  }

  static List<LoginModel> listFromJson(List<dynamic> json) {
    return json == null
        ? <LoginModel>[]
        : json.map((e) => LoginModel.fromJson(e)).toList();
  }
}

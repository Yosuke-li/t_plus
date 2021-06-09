 // usingCode : "123"
 // price : 23
 // ordQty : 12
 // side : 1
 // ordType : 2
 // tif : 3
 // refId : "1asdasd"
 // account : "coding1"
 // username : "coding"
 // openFlag : 4
 // hedgeFlag : 3

class OrderSubmit {
  String usingCode;
  double price;
  int ordQty;
  int side;
  int ordType;
  int tif;
  String refId;
  String account;
  String username;
  int openFlag;
  int hedgeFlag;

  OrderSubmit(
      {String usingCode,
      double price,
      int ordQty,
      int side,
      int ordType,
      int tif,
      String refId,
      String account,
      String username,
      int openFlag,
      int hedgeFlag});

  OrderSubmit.fromJson(dynamic json) {
    usingCode = json["usingCode"];
    price = json["price"];
    ordQty = json["ordQty"];
    side = json["side"];
    ordType = json["ordType"];
    tif = json["tif"];
    refId = json["refId"];
    account = json["account"];
    username = json["username"];
    openFlag = json["openFlag"];
    hedgeFlag = json["hedgeFlag"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["usingCode"] = usingCode;
    map["price"] = price;
    map["ordQty"] = ordQty;
    map["side"] = side;
    map["ordType"] = ordType;
    map["tif"] = tif;
    map["refId"] = refId;
    map["account"] = account;
    map["username"] = username;
    map["openFlag"] = openFlag;
    map["hedgeFlag"] = hedgeFlag;
    return map;
  }
}

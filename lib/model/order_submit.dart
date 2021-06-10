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
  int rawSide;
  int rawOrdType;
  int rawTif;
  String refId;
  String account;
  String username;
  int rawOpenFlag;
  int rawHedgeFlag;

  OrderSubmit(
      {String usingCode,
      double price,
      int ordQty,
      int rawside,
      int rawordType,
      int rawtif,
      String refId,
      String account,
      String username,
      int rawOpenFlag,
      int rawHedgeFlag});

  OrderSubmit.fromJson(dynamic json) {
    usingCode = json["usingCode"];
    price = json["price"];
    ordQty = json["ordQty"];
    rawSide = json["rawSide"];
    rawOrdType = json["rawOrdType"];
    rawTif = json["rawTif"];
    refId = json["refId"];
    account = json["account"];
    username = json["username"];
    rawOpenFlag = json["rawOpenFlag"];
    rawHedgeFlag = json["rawHedgeFlag"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["usingCode"] = usingCode;
    map["price"] = price;
    map["ordQty"] = ordQty;
    map["rawSide"] = rawSide;
    map["rawOrdType"] = rawOrdType;
    map["rawTif"] = rawTif;
    map["refId"] = refId;
    map["account"] = account;
    map["username"] = username;
    map["rawOpenFlag"] = rawOpenFlag;
    map["rawHedgeFlag"] = rawHedgeFlag;
    return map;
  }
}

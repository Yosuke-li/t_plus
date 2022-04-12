class Entrust {
  int? id;
  String? price;
  String? unsettled;
  String? settled;
  String? cell;
  String? buy;
  String? status;
  String? head;
  String? open;
  String? detail;

  Entrust({
    this.id,
    this.price,
    this.unsettled,
    this.settled,
    this.buy,
    this.status,
    this.open,
    this.head,
    this.detail,
    this.cell});

  Entrust.fromJson(dynamic json) {
    id = json["id"];
    price = json["price"];
    unsettled = json["unsettled"];
    settled = json["settled"];
    buy = json["buy"];
    status = json["status"];
    open = json["open"];
    head = json["head"];
    detail = json["detail"];
    cell = json["cell"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["id"] = id;
    map["price"] = price;
    map["unsettled"] = unsettled;
    map["settled"] = settled;
    map["buy"] = buy;
    map["status"] = status;
    map["open"] = open;
    map["head"] = head;
    map["detail"] = detail;
    map["cell"] = cell;
    return map;
  }
}
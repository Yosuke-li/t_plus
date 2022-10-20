class Quotation {
  int? id;
  String? contractCode;
  String? contractName;
  double? recentQuotation;
  double? amountIncreased;
  double? increased;
  double? beginningPrice;
  double? endingPrice;
  double? buyingVolume;
  double? sellingVolume;
  double? volume;
  double? openInterest;
  double? presentVolume;
  double? limitUpPrice;
  double? limitDownPrice;
  double? openingPrice;
  double? PrevClose;
  double? high;
  double? low;
  double? turnover;
  double? exchange;
  int? updateTime;

  Quotation(
      {this.id,
      this.amountIncreased,
      this.beginningPrice,
      this.buyingVolume,
      this.contractCode,
      this.contractName,
      this.endingPrice,
      this.exchange,
      this.high,
      this.increased,
      this.limitDownPrice,
      this.limitUpPrice,
      this.low,
      this.openingPrice,
      this.openInterest,
      this.presentVolume,
      this.PrevClose,
      this.recentQuotation,
      this.sellingVolume,
      this.turnover,
      this.updateTime,
      this.volume});
}



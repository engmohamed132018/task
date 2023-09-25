class Cards {
  int? adId;
  String? label;
  bool? isNegotionable;
  String? negotionablePrice;
  double? price;
  double? initialPrice;
  bool? showCategoryinName;
  String? currency;
  List<String>? name;
  List<String>? subOptions;
  List<String>? unit;
  int? cityId;
  String? city;
  String? image;
  int? categoryId;
  String? category;
  int? categoryStatus;
  String? createdAt;
  int? customerId;
  String? customerName;
  String? boxMessage;
  bool? isSold;
  bool? hasAcceptedBid;
  int? bidCount;
  int? adsCount;
  String? sharingUrl;
  List? topBids;

  Cards(
      {this.adId,
      this.label,
      this.isNegotionable,
      this.negotionablePrice,
      this.price,
      this.initialPrice,
      this.showCategoryinName,
      this.currency,
      this.name,
      this.subOptions,
      this.unit,
      this.cityId,
      this.city,
      this.image,
      this.categoryId,
      this.category,
      this.categoryStatus,
      this.createdAt,
      this.customerId,
      this.customerName,
      this.boxMessage,
      this.isSold,
      this.hasAcceptedBid,
      this.bidCount,
      this.adsCount,
      this.sharingUrl,
      this.topBids});

  Cards.fromJson(Map<String, dynamic> json) {
    adId = json['adId'];
    label = json['label'];
    isNegotionable = json['isNegotionable'];
    negotionablePrice = json['negotionablePrice'];
    price = json['price'];
    initialPrice = json['initialPrice'];
    showCategoryinName = json['showCategoryinName'];
    currency = json['currency'];
    name = json['name'].cast<String>();
    subOptions = json['subOptions'].cast<String>();
    unit = json['unit'].cast<String>();
    cityId = json['cityId'];
    city = json['city'];
    image = json['image'];
    categoryId = json['categoryId'];
    category = json['category'];
    categoryStatus = json['categoryStatus'];
    createdAt = json['createdAt'];
    customerId = json['customerId'];
    customerName = json['customerName'];
    boxMessage = json['boxMessage'];
    isSold = json['isSold'];
    hasAcceptedBid = json['hasAcceptedBid'];
    bidCount = json['bidCount'];
    adsCount = json['adsCount'];
    sharingUrl = json['sharingUrl'];
    if (json['topBids'] != null) {
      topBids = [];
      // json['topBids'].forEach((v) {
      //   topBids!.add(Null.fromJson(v));
      // });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['adId'] = this.adId;
    data['label'] = this.label;
    data['isNegotionable'] = this.isNegotionable;
    data['negotionablePrice'] = this.negotionablePrice;
    data['price'] = this.price;
    data['initialPrice'] = this.initialPrice;
    data['showCategoryinName'] = this.showCategoryinName;
    data['currency'] = this.currency;
    data['name'] = this.name;
    data['subOptions'] = this.subOptions;
    data['unit'] = this.unit;
    data['cityId'] = this.cityId;
    data['city'] = this.city;
    data['image'] = this.image;
    data['categoryId'] = this.categoryId;
    data['category'] = this.category;
    data['categoryStatus'] = this.categoryStatus;
    data['createdAt'] = this.createdAt;
    data['customerId'] = this.customerId;
    data['customerName'] = this.customerName;
    data['boxMessage'] = this.boxMessage;
    data['isSold'] = this.isSold;
    data['hasAcceptedBid'] = this.hasAcceptedBid;
    data['bidCount'] = this.bidCount;
    data['adsCount'] = this.adsCount;
    data['sharingUrl'] = this.sharingUrl;
    if (this.topBids != null) {
      // data['topBids'] = this.topBids!.map((v) => v?.toJson()).toList();
    }
    return data;
  }
}

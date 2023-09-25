// ignore_for_file: unnecessary_this

import 'cards_models.dart';

class Category {
  int? categoryId;
  String? name;
  String? image;
  String? mobileImage;
  String? bannerImage;
  List<Cards>? cards;

  Category(
      {this.categoryId,
      this.name,
      this.image,
      this.mobileImage,
      this.bannerImage,
      this.cards});

  Category.fromJson(Map<String, dynamic> json) {
    categoryId = json['categoryId'];
    name = json['name'];
    image = json['image'];
    mobileImage = json['mobileImage'];
    bannerImage = json['bannerImage'];
    if (json['cards'] != null) {
      cards = <Cards>[];
      json['cards'].forEach((v) {
        cards!.add(new Cards.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['categoryId'] = this.categoryId;
    data['name'] = this.name;
    data['image'] = this.image;
    data['mobileImage'] = this.mobileImage;
    data['bannerImage'] = this.bannerImage;
    if (this.cards != null) {
      data['cards'] = this.cards!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

// ignore_for_file: file_names

import 'package:flutter/material.dart';

import 'dart:convert';

class Product {
  final int id;
  final String title, description;
  final List<String> images;
  final List<Color> colors;
  final double rating, price;
  final bool isFavourite, isPopular;

  Product({
    required this.id,
    required this.images,
    required this.colors,
    this.rating = 0.0,
    this.isFavourite = false,
    this.isPopular = false,
    required this.title,
    required this.price,
    required this.description,
  });
}

// Our demo Products

List<Product> demoProducts = [
  Product(
    id: 1,
    images: [
      "assets/images/ps4_console_white_1.png",
      "assets/images/ps4_console_white_2.png",
      "assets/images/ps4_console_white_3.png",
      "assets/images/ps4_console_white_4.png",
    ],
    colors: [
      Color(0xFFF6625E),
      Color(0xFF836DB8),
      Color(0xFFDECB9C),
      Colors.white,
    ],
    title: "Wireless Controller™",
    price: 64.99,
    description: description,
    rating: 4.8,
    isFavourite: true,
    isPopular: true,
  ),
  Product(
    id: 2,
    images: [
      "assets/images/Image Popular Product 2.png",
    ],
    colors: [
      Color(0xFFF6625E),
      Color(0xFF836DB8),
      Color(0xFFDECB9C),
      Colors.white,
    ],
    title: "Nike Sport White - Man Pant",
    price: 50.5,
    description: description,
    rating: 4.1,
    isPopular: true,
  ),
  Product(
    id: 3,
    images: [
      "assets/images/glap.png",
    ],
    colors: [
      Color(0xFFF6625E),
      Color(0xFF836DB8),
      Color(0xFFDECB9C),
      Colors.white,
    ],
    title: "Gloves XC Omega - Polygon",
    price: 36.55,
    description: description,
    rating: 4.1,
    isFavourite: true,
    isPopular: true,
  ),
  Product(
    id: 4,
    images: [
      "assets/images/wireless headset.png",
    ],
    colors: [
      Color(0xFFF6625E),
      Color(0xFF836DB8),
      Color(0xFFDECB9C),
      Colors.white,
    ],
    title: "Logitech Head",
    price: 20.20,
    description: description,
    rating: 4.1,
    isFavourite: true,
  ),
];

const String description =
    "Wireless Controller for PS4™ gives you what you want in your gaming from over precision control your games to sharing …";
/*
// To parse this JSON data, do
//
//     final popProducts = popProductsFromJson(jsonString);

PopProducts popProductsFromJson(String str) =>
    PopProducts.fromJson(json.decode(str));

String popProductsToJson(PopProducts data) => json.encode(data.toJson());

class PopProducts {
  PopProducts({
    required this.data,
    required this.links,
    required this.meta,
  });

  final List<Datum> data;
  final Links links;
  final Meta meta;

  factory PopProducts.fromJson(Map<String, dynamic> json) => PopProducts(
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
        links: Links.fromJson(json["links"]),
        meta: Meta.fromJson(json["meta"]),
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "links": links.toJson(),
        "meta": meta.toJson(),
      };
}

class Datum {
  Datum({
    required this.id,
    required this.sku,
    required this.type,
    required this.name,
    required this.urlKey,
    required this.price,
    required this.formatedPrice,
    required this.shortDescription,
    required this.description,
    required this.images,
    required this.videos,
    required this.baseImage,
    required this.createdAt,
    required this.updatedAt,
    required this.reviews,
    required this.inStock,
    required this.isSaved,
    required this.isWishlisted,
    required this.isItemInCart,
    required this.showQuantityChanger,
  });

  final int id;
  final String sku;
  final String type;
  final String name;
  final String urlKey;
  final String price;
  final String formatedPrice;
  final String shortDescription;
  final String description;
  final List<Image> images;
  final List<dynamic> videos;
  final BaseImage baseImage;
  final DateTime createdAt;
  final DateTime updatedAt;
  final Reviews reviews;
  final bool inStock;
  final bool isSaved;
  final bool isWishlisted;
  final bool isItemInCart;
  final bool showQuantityChanger;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        sku: json["sku"],
        type: json["type"],
        name: json["name"],
        urlKey: json["url_key"],
        price: json["price"],
        formatedPrice: json["formated_price"],
        shortDescription: json["short_description"],
        description: json["description"],
        images: List<Image>.from(json["images"].map((x) => Image.fromJson(x))),
        videos: List<dynamic>.from(json["videos"].map((x) => x)),
        baseImage: BaseImage.fromJson(json["base_image"]),
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        reviews: Reviews.fromJson(json["reviews"]),
        inStock: json["in_stock"],
        isSaved: json["is_saved"],
        isWishlisted: json["is_wishlisted"],
        isItemInCart: json["is_item_in_cart"],
        showQuantityChanger: json["show_quantity_changer"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "sku": sku,
        "type": type,
        "name": name,
        "url_key": urlKey,
        "price": price,
        "formated_price": formatedPrice,
        "short_description": shortDescription,
        "description": description,
        "images": List<dynamic>.from(images.map((x) => x.toJson())),
        "videos": List<dynamic>.from(videos.map((x) => x)),
        "base_image": baseImage.toJson(),
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "reviews": reviews.toJson(),
        "in_stock": inStock,
        "is_saved": isSaved,
        "is_wishlisted": isWishlisted,
        "is_item_in_cart": isItemInCart,
        "show_quantity_changer": showQuantityChanger,
      };
}

class BaseImage {
  BaseImage({
    required this.smallImageUrl,
    required this.mediumImageUrl,
    required this.largeImageUrl,
    required this.originalImageUrl,
  });

  final String smallImageUrl;
  final String mediumImageUrl;
  final String largeImageUrl;
  final String originalImageUrl;

  factory BaseImage.fromJson(Map<String, dynamic> json) => BaseImage(
        smallImageUrl: json["small_image_url"],
        mediumImageUrl: json["medium_image_url"],
        largeImageUrl: json["large_image_url"],
        originalImageUrl: json["original_image_url"],
      );

  Map<String, dynamic> toJson() => {
        "small_image_url": smallImageUrl,
        "medium_image_url": mediumImageUrl,
        "large_image_url": largeImageUrl,
        "original_image_url": originalImageUrl,
      };
}

class Image {
  Image({
    required this.id,
    required this.path,
    required this.url,
    required this.originalImageUrl,
    required this.smallImageUrl,
    required this.mediumImageUrl,
    required this.largeImageUrl,
  });

  final int id;
  final String path;
  final String url;
  final String originalImageUrl;
  final String smallImageUrl;
  final String mediumImageUrl;
  final String largeImageUrl;

  factory Image.fromJson(Map<String, dynamic> json) => Image(
        id: json["id"],
        path: json["path"],
        url: json["url"],
        originalImageUrl: json["original_image_url"],
        smallImageUrl: json["small_image_url"],
        mediumImageUrl: json["medium_image_url"],
        largeImageUrl: json["large_image_url"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "path": path,
        "url": url,
        "original_image_url": originalImageUrl,
        "small_image_url": smallImageUrl,
        "medium_image_url": mediumImageUrl,
        "large_image_url": largeImageUrl,
      };
}

class Reviews {
  Reviews({
    required this.total,
    required this.totalRating,
    required this.averageRating,
    required this.percentage,
  });

  final int total;
  final int totalRating;
  final int averageRating;
  final List<dynamic> percentage;

  factory Reviews.fromJson(Map<String, dynamic> json) => Reviews(
        total: json["total"],
        totalRating: json["total_rating"],
        averageRating: json["average_rating"],
        percentage: List<dynamic>.from(json["percentage"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "total": total,
        "total_rating": totalRating,
        "average_rating": averageRating,
        "percentage": List<dynamic>.from(percentage.map((x) => x)),
      };
}

class Links {
  Links({
    required this.first,
    required this.last,
    required this.prev,
    required this.next,
  });

  final String first;
  final String last;
  final dynamic prev;
  final dynamic next;

  factory Links.fromJson(Map<String, dynamic> json) => Links(
        first: json["first"],
        last: json["last"],
        prev: json["prev"],
        next: json["next"],
      );

  Map<String, dynamic> toJson() => {
        "first": first,
        "last": last,
        "prev": prev,
        "next": next,
      };
}

class Meta {
  Meta({
    required this.currentPage,
    required this.from,
    required this.lastPage,
    required this.links,
    required this.path,
    required this.perPage,
    required this.to,
    required this.total,
  });

  final int currentPage;
  final int from;
  final int lastPage;
  final List<Link> links;
  final String path;
  final int perPage;
  final int to;
  final int total;

  factory Meta.fromJson(Map<String, dynamic> json) => Meta(
        currentPage: json["current_page"],
        from: json["from"],
        lastPage: json["last_page"],
        links: List<Link>.from(json["links"].map((x) => Link.fromJson(x))),
        path: json["path"],
        perPage: json["per_page"],
        to: json["to"],
        total: json["total"],
      );

  Map<String, dynamic> toJson() => {
        "current_page": currentPage,
        "from": from,
        "last_page": lastPage,
        "links": List<dynamic>.from(links.map((x) => x.toJson())),
        "path": path,
        "per_page": perPage,
        "to": to,
        "total": total,
      };
}

class Link {
  Link({
    required this.url,
    required this.label,
    required this.active,
  });

  final String url;
  final String label;
  final bool active;

  factory Link.fromJson(Map<String, dynamic> json) => Link(
        url: json["url"] == null ? null : json["url"],
        label: json["label"],
        active: json["active"],
      );

  Map<String, dynamic> toJson() => {
        "url": url == null ? null : url,
        "label": label,
        "active": active,
      };
}
*/
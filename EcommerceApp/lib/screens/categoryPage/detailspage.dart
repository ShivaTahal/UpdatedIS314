// import 'dart:js';

// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:provider/provider.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'category_list_page.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'dart:math';
import 'dart:async'; // To parse this JSON data, do
//
//     final products = productsFromJson(jsonString);

import 'each_page.dart';

import 'package:meta/meta.dart';
import 'dart:convert';

Products productsFromJson(String str) => Products.fromJson(json.decode(str));

String productsToJson(Products data) => json.encode(data.toJson());

class Products {
  Products({
    required this.productsList,
    required this.links,
    required this.meta,
  });

  final List<ProductList> productsList;
  final Links links;
  final Meta meta;

  factory Products.fromJson(Map<String, dynamic> json) => Products(
        productsList: List<ProductList>.from(
            json["data"].map((x) => ProductList.fromJson(x))),
        links: Links.fromJson(json["links"]),
        meta: Meta.fromJson(json["meta"]),
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(productsList.map((x) => x.toJson())),
        "links": links.toJson(),
        "meta": meta.toJson(),
      };
}

class ProductList {
  ProductList({
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
  final dynamic urlKey;
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

  factory ProductList.fromJson(Map<String, dynamic> json) => ProductList(
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

  final dynamic smallImageUrl;
  final dynamic mediumImageUrl;
  final dynamic largeImageUrl;
  final dynamic originalImageUrl;

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

  final dynamic id;
  final String path;
  final dynamic url;
  final dynamic originalImageUrl;
  final dynamic smallImageUrl;
  final dynamic mediumImageUrl;
  final dynamic largeImageUrl;

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
  final dynamic totalRating;
  final dynamic averageRating;
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

  final dynamic first;
  final dynamic last;
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

  final dynamic currentPage;
  final dynamic from;
  final dynamic lastPage;
  final List<Link> links;
  final dynamic path;
  final dynamic perPage;
  final dynamic to;
  final dynamic total;

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

  final dynamic url;
  final String label;
  final bool active;

  factory Link.fromJson(Map<String, dynamic> json) => Link(
        url: json["url"],
        label: json["label"],
        active: json["active"],
      );

  Map<String, dynamic> toJson() => {
        "url": url,
        "label": label,
        "active": active,
      };
}

class DetailPage extends StatefulWidget {
  // final All_categories products;
  final Datum dataCategory;
  Random random = new Random();

  // DetailPage(this.products);
  DetailPage(this.dataCategory, {Key? key}) : super(key: key);

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  // late products_as_argument;
  late Future<Products> futurePost;

  @override
  void initState() {
    super.initState();
    futurePost = fetchEachPost();
  }

  @override
  Widget build(BuildContext context) {
    // products_as_argument = ModalRoute.of(context)!.settings.arguments as All_categories;
    return Scaffold(
      appBar: AppBar(
        title: Text('Products'),
        backgroundColor: Color.fromRGBO(46, 204, 113, 1),
      ),
      body: Center(
        child: FutureBuilder<Products>(
          future: futurePost,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              if (snapshot.data!.productsList.isEmpty) {
                return Center(
                    child: Text('No products under this category',
                        style: TextStyle(color: Colors.black)));
              } else {
                return ListView.builder(
                    itemCount: snapshot.data!.productsList.length,
                    itemBuilder: (_, index) {
                      return InkWell(
                          child: Container(
                            height: 150.0,
                            margin: EdgeInsets.all(10.0),
                            decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10.0)),
                                gradient: LinearGradient(
                                    colors: [Colors.yellow, Colors.redAccent],
                                    begin: Alignment.centerLeft,
                                    end: Alignment.centerRight,
                                    tileMode: TileMode.clamp)),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Padding(
                                    padding: EdgeInsets.only(
                                        left: 10.0, right: 10.0),
                                    child: CircleAvatar(
                                      radius: 35.0,
                                      backgroundImage: NetworkImage(
                                          'https://loremflickr.com/320/240/music?lock=$index'),
                                    )),
                                Expanded(
                                    child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      snapshot.data!.productsList[index].name,
                                      style: TextStyle(
                                          fontSize: 20.0,
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(
                                      height: 8.0,
                                    ),
                                    // ignore: prefer_const_constructors
                                    // Text(
                                    //   'Sunny',
                                    //   style: TextStyle(
                                    //       fontSize: 12.0,
                                    //       color: Colors.white70),
                                    // ),
                                    SizedBox(
                                      height: 10.0,
                                    ),
                                    Row(
                                      children: <Widget>[
                                        RatingBar.builder(
                                          initialRating: 3,
                                          minRating: 1,
                                          direction: Axis.horizontal,
                                          allowHalfRating: true,
                                          itemCount: 5,
                                          itemPadding: EdgeInsets.symmetric(
                                              horizontal: 4.0),
                                          itemBuilder: (context, _) => Icon(
                                            Icons.star,
                                            color: Colors.black,
                                          ),
                                          onRatingUpdate: (rating) {
                                            print(rating);
                                          },
                                          //   ),
                                          //   Column(
                                          //     // ignore: prefer_const_literals_to_create_immutables
                                          //     children: <Widget>[
                                          //       Text(
                                          //           snapshot
                                          //               .data!
                                          //               .productsList[index]
                                          //               .shortDescription,
                                          //           style: TextStyle(
                                          //               fontSize: 12.0,
                                          //               color: Colors.white)),
                                          //       Text('Popularity',
                                          //           style: TextStyle(
                                          //               fontSize: 10.0,
                                          //               color: Colors.white)),
                                          //     ],
                                          //   ),
                                          //   Column(
                                          //     children: <Widget>[
                                          //       Text('2342',
                                          //           style: TextStyle(
                                          //               fontSize: 12.0,
                                          //               color: Colors.white)),
                                          //       Text('Like',
                                          //           style: TextStyle(
                                          //               fontSize: 10.0,
                                          //               color: Colors.white)),
                                          //     ],
                                          //   ),
                                          //   Column(
                                          //     children: <Widget>[
                                          //       Text('2342',
                                          //           style: TextStyle(
                                          //               fontSize: 12.0,
                                          //               color: Colors.white)),
                                          //       Text('Followed',
                                          //           style: TextStyle(
                                          //               fontSize: 10.0,
                                          //               color: Colors.white)),
                                          //     ],
                                        )
                                      ],
                                    )
                                  ],
                                )),
                                Padding(
                                    padding: EdgeInsets.only(
                                        left: 10.0, right: 10.0),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: <Widget>[
                                        Text(
                                          '→',
                                          style: TextStyle(
                                              fontSize: 30.0,
                                              color: Colors.white70),
                                        ),
                                        Text(
                                          'Item',
                                          style: TextStyle(
                                              fontSize: 14.0,
                                              color: Colors.white70),
                                        ),
                                      ],
                                    ))
                              ],
                            ),
                          ),
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        EachProduct(snapshot.data, index)));
                          });
                    });
              }
            } else if (snapshot.hasError) {
              return Text('${snapshot.error}');
            }

            // By default, show a loading spinner.
            return const CircularProgressIndicator();
          },
        ),
      ),
    );
  }

  Future<Products> fetchEachPost() async {
    var id = widget.dataCategory.id;
    print("here" + "${id}");
    // ignore: prefer_adjacent_string_concatenation
    String url = "http://192.168.8.102:8000/api/products?category_id=" + "$id";
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      return Products.fromJson(jsonDecode(response.body));
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load album');
    }
  }
}

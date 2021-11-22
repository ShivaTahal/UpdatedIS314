// import 'package:ecommerece_velocity_app/models/category.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';
// import 'dart:async';
// import 'dart:convert';
// import 'package:meta/meta.dart';

// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;

// Future<All_categories> fetchAlbum() async {
//   final response =
//       await http.get(Uri.parse('http://192.168.8.102:8000/api/categories/'));

//   if (response.statusCode == 200) {
//     // If the server did return a 200 OK response,
//     // then parse the JSON.
//     return All_categories.fromJson(jsonDecode(response.body));
//   } else {
//     // If the server did not return a 200 OK response,
//     // then throw an exception.
//     throw Exception('Failed to load album');
//   }
// }
// // To parse this JSON data, do
// //
// //     final category = categoryFromJson(jsonString);

// All_categories categoryFromJson(String str) =>
//     All_categories.fromJson(json.decode(str));

// String categoryToJson(All_categories dataCategory) =>
//     json.encode(dataCategory.toJson());

// class All_categories {
//   All_categories({
//     required this.dataCategory,
//     required this.links,
//     required this.meta,
//   });

//   final List<Datum> dataCategory;
//   final Links links;
//   final Meta meta;

//   factory All_categories.fromJson(Map<String, dynamic> json) => All_categories(
//         dataCategory:
//             List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
//         links: Links.fromJson(json["links"]),
//         meta: Meta.fromJson(json["meta"]),
//       );

//   Map<String, dynamic> toJson() => {
//         "data": List<dynamic>.from(dataCategory.map((x) => x.toJson())),
//         "links": links.toJson(),
//         "meta": meta.toJson(),
//       };
// }

// class Datum {
//   Datum({
//     required this.id,
//     required this.code,
//     required this.name,
//     required this.slug,
//     required this.displayMode,
//     required this.description,
//     required this.metaTitle,
//     required this.metaDescription,
//     required this.metaKeywords,
//     required this.status,
//     required this.imageUrl,
//     required this.categoryIconPath,
//     required this.additional,
//     required this.createdAt,
//     required this.updatedAt,
//   });

//   final int id;
//   final dynamic code;
//   final String name;
//   final String slug;
//   final String displayMode;
//   final String description;
//   final String metaTitle;
//   final String metaDescription;
//   final String metaKeywords;
//   final int status;
//   final dynamic imageUrl;
//   final dynamic categoryIconPath;
//   final dynamic additional;
//   final DateTime createdAt;
//   final DateTime updatedAt;

//   factory Datum.fromJson(Map<String, dynamic> json) => Datum(
//         id: json["id"],
//         code: json["code"],
//         name: json["name"],
//         slug: json["slug"],
//         displayMode: json["display_mode"],
//         description: json["description"],
//         metaTitle: json["meta_title"],
//         metaDescription: json["meta_description"],
//         metaKeywords: json["meta_keywords"],
//         status: json["status"],
//         imageUrl: json["image_url"],
//         categoryIconPath: json["category_icon_path"],
//         additional: json["additional"],
//         createdAt: DateTime.parse(json["created_at"]),
//         updatedAt: DateTime.parse(json["updated_at"]),
//       );

//   Map<String, dynamic> toJson() => {
//         "id": id,
//         "code": code,
//         "name": name,
//         "slug": slug,
//         "display_mode": displayMode,
//         "description": description,
//         "meta_title": metaTitle,
//         "meta_description": metaDescription,
//         "meta_keywords": metaKeywords,
//         "status": status,
//         "image_url": imageUrl,
//         "category_icon_path": categoryIconPath,
//         "additional": additional,
//         "created_at": createdAt.toIso8601String(),
//         "updated_at": updatedAt.toIso8601String(),
//       };
// }

// class Links {
//   Links({
//     required this.first,
//     required this.last,
//     required this.prev,
//     required this.next,
//   });

//   final String first;
//   final String last;
//   final dynamic prev;
//   final dynamic next;

//   factory Links.fromJson(Map<String, dynamic> json) => Links(
//         first: json["first"],
//         last: json["last"],
//         prev: json["prev"],
//         next: json["next"],
//       );

//   Map<String, dynamic> toJson() => {
//         "first": first,
//         "last": last,
//         "prev": prev,
//         "next": next,
//       };
// }

// class Meta {
//   Meta({
//     required this.currentPage,
//     required this.from,
//     required this.lastPage,
//     //required this.links,
//     required this.path,
//     required this.perPage,
//     required this.to,
//     required this.total,
//   });

//   final int currentPage;
//   final int from;
//   final int lastPage;
//   //final List<Link> links;
//   final String path;
//   final int perPage;
//   final int to;
//   final int total;

//   factory Meta.fromJson(Map<String, dynamic> json) => Meta(
//         currentPage: json["current_page"],
//         from: json["from"],
//         lastPage: json["last_page"],
//         //links: List<Link>.from(json["links"].map((x) => Link.fromJson(x))),
//         path: json["path"],
//         perPage: json["per_page"],
//         to: json["to"],
//         total: json["total"],
//       );

//   Map<String, dynamic> toJson() => {
//         "current_page": currentPage,
//         "from": from,
//         "last_page": lastPage,
//         // "links": List<dynamic>.from(links.map((x) => x.toJson())),
//         "path": path,
//         "per_page": perPage,
//         "to": to,
//         "total": total,
//       };
// }

// // class Link {
// //   Link({
// //     required this.url,
// //     required this.label,
// //     required this.active,
// //   });

// //   final String url;
// //   final String label;
// //   final bool active;

// //   factory Link.fromJson(Map<String, dynamic> json) => Link(
// //         url: json["url"] == null ? null : json["url"],
// //         label: json["label"],
// //         active: json["active"],
// //       );

// //   Map<String, dynamic> toJson() => {
// //         "url": url,
// //         "label": label,
// //         "active": active,
// //       };
// // }

// class CategoryPage extends StatefulWidget {
//   Category category;

//   Function onCardClick;
//   CategoryPage({required this.category, required this.onCardClick});

//   @override
//   State<CategoryPage> createState() => _CategoryPageState();
// }

// class _CategoryPageState extends State<CategoryPage> {
//   late Future<All_categories> futureAlbum;

//   @override
//   void initState() {
//     super.initState();
//     futureAlbum = fetchAlbum();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: () {
//         this.widget.onCardClick();
//       },
//       child: Container(
//           margin: EdgeInsets.all(20),
//           height: 150,
//           child: Stack(
//             children: [
//               Positioned.fill(
//                 child: ClipRRect(
//                   borderRadius: BorderRadius.circular(20),
//                   child: Image.asset(
//                     'assets/images/testImages/' +
//                         this.widget.category.imgName +
//                         '.png',
//                     fit: BoxFit.cover,
//                   ),
//                 ),
//               ),
//               Positioned(
//                   bottom: 0,
//                   left: 0,
//                   right: 0,
//                   child: Container(
//                     height: 120,
//                     decoration: BoxDecoration(
//                         borderRadius: BorderRadius.only(
//                             bottomLeft: Radius.circular(20),
//                             bottomRight: Radius.circular(20)),
//                         gradient: LinearGradient(
//                             begin: Alignment.bottomCenter,
//                             end: Alignment.topCenter,
//                             colors: [
//                               Colors.black.withOpacity(0.7),
//                               Colors.transparent
//                             ])),
//                   )),
//               Positioned(
//                 bottom: 0,
//                 child: Row(children: [
//                   Padding(
//                     padding: EdgeInsets.only(left: 10),
//                     child: FutureBuilder<All_categories>(
//                       future: futureAlbum,
//                       builder: (context, snapshot) {
//                         if (snapshot.hasData) {
//                           return Container(
//                               child: ListView.builder(
//                                   itemCount: snapshot.data?.dataCategory.length,
//                                   scrollDirection: Axis.horizontal,
//                                   itemBuilder:
//                                       (BuildContext context, int index) {
//                                     return Text(
//                                         '${snapshot.data!.dataCategory[index].name}',
//                                         style: TextStyle(
//                                             color: Colors.white, fontSize: 25));
//                                   }
                                  
                                  
//                                   );
//                         } else if (snapshot.hasError) {
//                           return Text('${snapshot.error}');
//                         }

//                         // By default, show a loading spinner.
//                         return const CircularProgressIndicator();
//                       },
//                     ),
//                   )
//                 ]),
//               )
//             ],
//           )),
//     );
//   }
// }

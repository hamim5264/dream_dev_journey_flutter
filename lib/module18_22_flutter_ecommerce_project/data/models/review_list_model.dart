// class ReviewModel {
//   int? id;
//   String? description;
//   String? rating;
//   int? customerId;
//   int? productId;
//   String? createdAt;
//   String? updatedAt;
//   ProfileModel? profile;
//
//   ReviewModel({
//     this.id,
//     this.description,
//     this.rating,
//     this.customerId,
//     this.productId,
//     this.createdAt,
//     this.updatedAt,
//     this.profile,
//   });
//
//   factory ReviewModel.fromJson(Map<String, dynamic> json) {
//     return ReviewModel(
//       id: json["id"],
//       description: json["description"],
//       rating: json["rating"],
//       customerId: json["customer_id"],
//       productId: json["product_id"],
//       createdAt: json["created_at"],
//       updatedAt: json["updated_at"],
//       profile: json["profile"] != null
//           ? ProfileModel.fromJson(json["profile"])
//           : null,
//     );
//   }
// }
// class ReviewModel {
//   final int id;
//   final String description;
//   final double rating; // Ensure rating is a double
//   final int customerId;
//   final int productId;
//   final String createdAt;
//   final String updatedAt;
//   final String customerName;
//
//   ReviewModel({
//     required this.id,
//     required this.description,
//     required this.rating,
//     required this.customerId,
//     required this.productId,
//     required this.createdAt,
//     required this.updatedAt,
//     required this.customerName,
//   });
//
//   factory ReviewModel.fromJson(Map<String, dynamic> json) {
//     return ReviewModel(
//       id: json['id'],
//       description: json['description'] ?? "",
//       rating: (json['rating'] is int) ? (json['rating'] as int).toDouble() : double.tryParse(json['rating'].toString()) ?? 0.0,
//       customerId: json['customer_id'],
//       productId: json['product_id'],
//       createdAt: json['created_at'] ?? "",
//       updatedAt: json['updated_at'] ?? "",
//       customerName: json['profile']?['cus_name'] ?? "Anonymous",
//     );
//   }
// }
//
//
// class ProfileModel {
//   int? id;
//   String? customerName;
//
//   ProfileModel({this.id, this.customerName});
//
//   factory ProfileModel.fromJson(Map<String, dynamic> json) {
//     return ProfileModel(
//       id: json["id"],
//       customerName: json["cus_name"],
//     );
//   }
// }

class ReviewModel {
  final int id;
  final String description;
  final double rating;
  final int customerId;
  final int productId;
  final String createdAt;
  final String updatedAt;
  final String customerName;

  ReviewModel({
    required this.id,
    required this.description,
    required this.rating,
    required this.customerId,
    required this.productId,
    required this.createdAt,
    required this.updatedAt,
    required this.customerName,
  });

  factory ReviewModel.fromJson(Map<String, dynamic> json) {
    return ReviewModel(
      id: json['id'] ?? 0,
      description: json['description'] ?? "",
      rating: (json['rating'] is int)
          ? (json['rating'] as int).toDouble()
          : double.tryParse(json['rating'].toString()) ?? 0.0,
      customerId: json['customer_id'] ?? 0,
      productId: json['product_id'] ?? 0,
      createdAt: json['created_at'] ?? "",
      updatedAt: json['updated_at'] ?? "",
      customerName: json['profile']?['cus_name'] ?? "Anonymous",
    );
  }
}




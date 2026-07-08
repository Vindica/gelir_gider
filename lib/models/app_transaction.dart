// To parse this JSON data, do
//
//     final appTransaction = appTransactionFromJson(jsonString);

import 'dart:convert';

AppTransaction appTransactionFromJson(String str) =>
    AppTransaction.fromJson(json.decode(str));

String appTransactionToJson(AppTransaction data) => json.encode(data.toJson());

class AppTransaction {
  final String? id;
  final double? amount;
  final String? type;
  final String? description;
  final DateTime? date;
  final String? categoryId;
  final String? userId;

  AppTransaction({
    this.id,
    this.amount,
    this.type,
    this.description,
    this.date,
    this.categoryId,
    this.userId,
  });

  factory AppTransaction.fromJson(Map<String, dynamic> json) => AppTransaction(
    id: json["id"],
    amount: json["amount"] is String
        ? double.tryParse(json['amount'])
        : (json['amount'] as num?)?.toDouble(),
    type: json["type"],
    description: json["description"],
    date: json["date"] == null ? null : DateTime.parse(json["date"]),
    categoryId: json["category_id"],
    userId: json["user_id"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "amount": amount,
    "type": type,
    "description": description,
    "date":
        "${date!.year.toString().padLeft(4, '0')}-${date!.month.toString().padLeft(2, '0')}-${date!.day.toString().padLeft(2, '0')}",
    "category_id": categoryId,
    "user_id": userId,
  };
}

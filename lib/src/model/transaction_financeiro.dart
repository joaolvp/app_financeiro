import 'dart:convert';

class TransactionFinanceiro {
  String uid;
  final TransactionType type;
  final num value;
  final String description;
  final CategoryType category;
  final DateTime date;
  final bool received;
  final DateTime created_at;

  TransactionFinanceiro({
    this.uid = '',
    required this.type,
    required this.value,
    required this.description,
    required this.category,
    required this.date,
    required this.received,
    required this.created_at,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'type': type.type(), // Convert enum to string
      'value': value,
      'description': description,
      'category': category.type(), // Convert enum to string
      'date': date.millisecondsSinceEpoch,
      'received': received,
      'created_at': created_at.millisecondsSinceEpoch,
    };
  }

  factory TransactionFinanceiro.fromMap(Map<String, dynamic> map) {
    return TransactionFinanceiro(
      type: TransactionTypeExtension.fromString(map['type'] as String),
      value: map['value'] as num,
      description: map['description'] as String,
      category: CategoryTypeExtension.fromString(map['category'] as String),
      date: DateTime.fromMillisecondsSinceEpoch(map['date'] as int),
      received: map['received'] as bool,
      created_at: DateTime.fromMillisecondsSinceEpoch(map['created_at'] as int),
    );
  }

  String toJson() => json.encode(toMap());

  factory TransactionFinanceiro.fromJson(String source) => TransactionFinanceiro.fromMap(json.decode(source) as Map<String, dynamic>);
}

enum TransactionType { income, expense }

extension TransactionTypeExtension on TransactionType {
  String type() {
    switch (this) {
      case TransactionType.income:
        return 'income';
      case TransactionType.expense:
        return 'expense';
    }
  }

  static TransactionType fromString(String type) {
    switch (type) {
      case 'income':
        return TransactionType.income;
      case 'expense':
        return TransactionType.expense;
      default:
        throw Exception('Unknown TransactionType: $type');
    }
  }
}

enum CategoryType {
  work,
  investment,
  services,
  business,
  house,
  health,
  education,
  transportation,
  food,
  others
}

extension CategoryTypeExtension on CategoryType {
  String type() {
    switch (this) {
      case CategoryType.work:
        return 'work';
      case CategoryType.investment:
        return 'investment';
      case CategoryType.services:
        return 'services';
      case CategoryType.business:
        return 'business';
      case CategoryType.house:
        return 'house';
      case CategoryType.health:
        return 'health';
      case CategoryType.education:
        return 'education';
      case CategoryType.transportation:
        return 'transportation';
      case CategoryType.food:
        return 'food';
      case CategoryType.others:
        return 'others';
    }
  }

  static CategoryType fromString(String category) {
    switch (category) {
      case 'work':
        return CategoryType.work;
      case 'investment':
        return CategoryType.investment;
      case 'services':
        return CategoryType.services;
      case 'business':
        return CategoryType.business;
      case 'house':
        return CategoryType.house;
      case 'health':
        return CategoryType.health;
      case 'education':
        return CategoryType.education;
      case 'transportation':
        return CategoryType.transportation;
      case 'food':
        return CategoryType.food;
      case 'others':
        return CategoryType.others;
      default:
        throw Exception('Unknown CategoryType: $category');
    }
  }
}

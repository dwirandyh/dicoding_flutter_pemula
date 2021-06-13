import 'package:dicoding_flutter_pemula/external/transaction_type.dart';

class TransactionModel {
  final String name;
  final String description;
  final String imagePath;
  final int amount;
  final TransactionType type;
  final DateTime date;
  TransactionModel(this.name, this.description, this.imagePath, this.amount,
      this.type, this.date);
}

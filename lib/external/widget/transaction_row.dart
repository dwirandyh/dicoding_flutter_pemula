import 'package:dicoding_flutter_pemula/data/transaction_model.dart';
import 'package:dicoding_flutter_pemula/external/transaction_type.dart';
import 'package:flutter/widgets.dart';

import '../constant.dart';
import '../extension.dart';

class TransactionRow extends StatelessWidget {
  final TransactionModel transaction;
  const TransactionRow({Key? key, required this.transaction}) : super(key: key);

  Widget amountSection() {
    Color textColor = transaction.type == TransactionType.transactionIn
        ? Constant.textGreen
        : Constant.textRed;
    String prefix =
        transaction.type == TransactionType.transactionIn ? "+" : "-";
    return Text(
      prefix + transaction.amount.toCurrency(),
      style: TextStyle(
          fontFamily: Constant.fontNinotoSans,
          fontSize: 18,
          fontWeight: FontWeight.w700,
          color: textColor),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 25),
      padding: EdgeInsets.all(16),
      color: Constant.backgroundWhite,
      child: Row(
        children: [
          Image.asset(transaction.imagePath),
          SizedBox(width: 15),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  transaction.name,
                  style: TextStyle(
                    fontFamily: Constant.fontNinotoSans,
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: Constant.textPrimary,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  transaction.description,
                  style: TextStyle(
                    fontFamily: Constant.fontNinotoSans,
                    fontSize: 14,
                    color: Constant.textSecondary,
                  ),
                ),
              ],
            ),
          ),
          amountSection()
        ],
      ),
    );
  }
}

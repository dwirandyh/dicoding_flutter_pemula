import 'package:dicoding_flutter_pemula/data/transaction_model.dart';
import 'package:dicoding_flutter_pemula/external/constant.dart';
import 'package:dicoding_flutter_pemula/external/transaction_type.dart';
import 'package:dicoding_flutter_pemula/external/widget/transaction_row.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HistoryPage extends StatefulWidget {
  HistoryPage({Key? key}) : super(key: key);

  @override
  _HistoryPageState createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  List<TransactionModel> transactionHistory = [
    TransactionModel("Samuel Suhi", "Transfer", "assets/images/samuel.png",
        50000, TransactionType.transactionIn, DateTime.parse("2021-06-13")),
    TransactionModel("Spotify", "Subscription", "assets/images/spotify.png",
        49000, TransactionType.transactionOut, DateTime.parse("2021-06-12")),
    TransactionModel("Netflix", "Subscription", "assets/images/netflix.png",
        149000, TransactionType.transactionOut, DateTime.parse("2021-06-04")),
    TransactionModel("Bobi Sammy", "Transfer", "assets/images/bobi.png",
        1150000, TransactionType.transactionIn, DateTime.parse("2021-06-03")),
    TransactionModel("Momo Taro", "Transfer", "assets/images/momo.png", 200000,
        TransactionType.transactionOut, DateTime.parse("2021-06-02"))
  ];

  void orderData({bool isAscending = true}) {
    setState(() {
      transactionHistory.sort((a, b) {
        if (isAscending) {
          return a.date.compareTo(b.date);
        } else {
          return b.date.compareTo(a.date);
        }
      });
    });
  }

  void backToPreviousPage() {
    Navigator.pop(context);
  }

  Widget headerSection() {
    return Container(
      padding: EdgeInsets.only(left: 16, top: 32, right: 16, bottom: 24),
      decoration: BoxDecoration(
        color: Constant.primary,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(24),
          bottomRight: Radius.circular(24),
        ),
      ),
      child: Row(
        children: [
          TextButton(
            onPressed: backToPreviousPage,
            style: ButtonStyle(
              minimumSize: MaterialStateProperty.all(Size(28, 28)),
            ),
            child: Image.asset(
              "assets/images/arrow-left.png",
              width: 28,
              height: 28,
            ),
          ),
          SizedBox(width: 16),
          Text(
            "History",
            style: TextStyle(
                fontFamily: Constant.fontNinotoSans,
                fontSize: 20,
                fontWeight: FontWeight.w700,
                color: Constant.textWhite),
          ),
        ],
      ),
    );
  }

  Widget historySection() {
    return Container(
      padding: EdgeInsets.only(top: 16),
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        physics: NeverScrollableScrollPhysics(),
        itemCount: transactionHistory.length,
        itemBuilder: (context, index) {
          return TransactionRow(transaction: transactionHistory[index]);
        },
      ),
    );
  }

  Widget historyFilterSection() {
    return Container(
      padding: EdgeInsets.only(left: 16, top: 24, right: 16, bottom: 24),
      child: Row(
        children: [
          SizedBox(
            width: 57,
            height: 57,
            child: ElevatedButton(
              onPressed: () {
                orderData();
              },
              style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all(Constant.backgroundWhite),
              ),
              child: Image.asset(
                "assets/images/arrow-up.png",
                color: Constant.textRed,
              ),
            ),
          ),
          SizedBox(width: 20),
          SizedBox(
            width: 57,
            height: 57,
            child: ElevatedButton(
              onPressed: () {
                orderData(isAscending: false);
              },
              style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all(Constant.backgroundWhite),
              ),
              child: Image.asset(
                "assets/images/arrow-bottom.png",
                color: Constant.textGreen,
              ),
            ),
          ),
          SizedBox(width: 20),
          Expanded(
            child: SizedBox(
              height: 57,
              child: ElevatedButton(
                onPressed: () {},
                style: ButtonStyle(
                  shape: MaterialStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  backgroundColor:
                      MaterialStateProperty.all(Constant.backgroundWhite),
                ),
                child: Text(
                  "Filter by Date",
                  style: TextStyle(
                    fontFamily: Constant.fontNinotoSans,
                    fontSize: 18,
                    color: Constant.primary,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Constant.primary,
      body: SafeArea(
        child: Container(
          color: Constant.backgroundGray,
          child: Column(
            children: [
              headerSection(),
              Expanded(
                child: Container(
                  color: Constant.backgroundGray,
                  width: double.infinity,
                  child: SingleChildScrollView(
                    child: historySection(),
                  ),
                ),
              ),
              historyFilterSection()
            ],
          ),
        ),
      ),
    );
  }
}

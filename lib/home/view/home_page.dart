import 'package:dicoding_flutter_pemula/data/transaction_model.dart';
import 'package:dicoding_flutter_pemula/external/transaction_type.dart';
import 'package:dicoding_flutter_pemula/external/constant.dart';
import 'package:dicoding_flutter_pemula/external/extension.dart';
import 'package:dicoding_flutter_pemula/external/widget/transaction_row.dart';
import 'package:dicoding_flutter_pemula/history/view/history_page.dart';
import 'package:dicoding_flutter_pemula/profile/view/profile_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<TransactionModel> historyData = [
    TransactionModel("Samuel Suhi", "Transfer", "assets/images/samuel.png",
        50000, TransactionType.transactionIn, DateTime.now()),
    TransactionModel("Spotify", "Subscription", "assets/images/spotify.png",
        49000, TransactionType.transactionOut, DateTime.now()),
    TransactionModel("Netflix", "Subscription", "assets/images/netflix.png",
        149000, TransactionType.transactionOut, DateTime.now()),
    TransactionModel("Bobi Sammy", "Transfer", "assets/images/bobi.png",
        1150000, TransactionType.transactionIn, DateTime.now()),
  ];

  void navigateToHistory() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => HistoryPage(),
      ),
    );
  }

  void navigateTohistory() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ProfilePage(),
      ),
    );
  }

  Widget buildHeaderSection() {
    return Container(
      child: Container(
        padding: EdgeInsets.only(top: 40, left: 16, right: 16, bottom: 40),
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
              onPressed: navigateTohistory,
              style: ButtonStyle(
                padding: MaterialStateProperty.all(EdgeInsets.zero),
                minimumSize: MaterialStateProperty.all(Size(52, 52)),
              ),
              child: Image.asset(
                "assets/images/profile.png",
                width: 52,
                height: 52,
                fit: BoxFit.contain,
              ),
            ),
            SizedBox(width: 20),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Balance",
                    style: TextStyle(
                        fontFamily: Constant.fontNinotoSans,
                        fontSize: 14,
                        color: Constant.textGray),
                  ),
                  SizedBox(height: 8),
                  Text(
                    1200000.toCurrency(),
                    style: TextStyle(
                        fontFamily: Constant.fontNinotoSans,
                        fontSize: 24,
                        color: Constant.textWhite,
                        fontWeight: FontWeight.w700),
                  ),
                ],
              ),
            ),
            Image.asset("assets/images/bell.png")
          ],
        ),
      ),
    );
  }

  Widget buildActivitySection() {
    return Container(
      padding: EdgeInsets.only(left: 16, top: 30, right: 16),
      child: Row(
        children: [
          Expanded(
            child: Container(
              height: 57,
              child: ElevatedButton(
                onPressed: null,
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(
                    Constant.buttonGray,
                  ),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                      side: BorderSide(color: Constant.buttonGray),
                    ),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(
                      "assets/images/arrow-up.png",
                      width: 28,
                      height: 28,
                    ),
                    SizedBox(width: 8),
                    Text(
                      "Transfer",
                      style: TextStyle(
                        fontFamily: Constant.fontNinotoSans,
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        color: Constant.textPrimary,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(width: 20),
          Expanded(
            child: Container(
              height: 57,
              child: ElevatedButton(
                onPressed: null,
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(
                    Constant.buttonGray,
                  ),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14),
                      side: BorderSide(color: Constant.buttonGray),
                    ),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(
                      "assets/images/plus.png",
                      width: 28,
                      height: 28,
                    ),
                    SizedBox(width: 8),
                    Text(
                      "Transfer",
                      style: TextStyle(
                        fontFamily: Constant.fontNinotoSans,
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        color: Constant.textPrimary,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget transactionHistoryHeaderSection() {
    return Container(
      padding: EdgeInsets.only(left: 16, top: 40, right: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Transaction History",
            style: TextStyle(
                fontFamily: Constant.fontNinotoSans,
                fontSize: 18,
                fontWeight: FontWeight.w700,
                color: Constant.textPrimary),
          ),
          TextButton(
            onPressed: this.navigateToHistory,
            child: Text(
              "See All",
              style: TextStyle(
                fontFamily: Constant.fontNinotoSans,
                fontSize: 14,
                fontWeight: FontWeight.w700,
                color: Constant.primary,
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
          child: SingleChildScrollView(
            child: Column(
              children: [
                buildHeaderSection(),
                buildActivitySection(),
                transactionHistoryHeaderSection(),
                ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  scrollDirection: Axis.vertical,
                  itemCount: historyData.length,
                  itemBuilder: (context, index) {
                    return TransactionRow(transaction: historyData[index]);
                  },
                ),
                SizedBox(
                  height: 24,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

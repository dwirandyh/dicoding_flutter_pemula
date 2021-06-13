import 'package:dicoding_flutter_pemula/external/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  void backToPreviousPage() {
    Navigator.of(context).pop(context);
  }

  void logout() {
    Navigator.of(context).popUntil((route) => route.isFirst);
  }

  Widget profileSection() {
    return Container(
      padding: EdgeInsets.only(bottom: 24),
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            "assets/images/profile.png",
            width: 80,
            height: 80,
          ),
          SizedBox(height: 14),
          Text(
            "Robert Chandler",
            style: TextStyle(
              fontFamily: Constant.fontNinotoSans,
              fontSize: 24,
              color: Constant.textPrimary,
              fontWeight: FontWeight.w700,
            ),
          ),
          SizedBox(height: 12),
          Text(
            "+62 813-9387-7946",
            style: TextStyle(
                fontFamily: Constant.fontNinotoSans,
                fontSize: 16,
                color: Constant.textSecondary),
          )
        ],
      ),
    );
  }

  Widget actionSection(String title, bool isIconShown, {Function()? action}) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      child: GestureDetector(
        onTap: action,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          decoration: BoxDecoration(
            color: Constant.backgroundDarkGray,
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
          ),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  title,
                  style: TextStyle(
                    fontFamily: Constant.fontNinotoSans,
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              isIconShown
                  ? Image.asset("assets/images/arrow-right.png")
                  : Text("")
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Constant.backgroundGray,
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.only(top: 24, bottom: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextButton(
                onPressed: backToPreviousPage,
                child: Image.asset(
                  "assets/images/arrow-left.png",
                  color: Constant.textPrimary,
                ),
              ),
              profileSection(),
              actionSection("Personal Information", true),
              actionSection("Change Password", true),
              actionSection("Change Pin", true),
              actionSection("Logout", false, action: logout)
            ],
          ),
        ),
      ),
    );
  }
}

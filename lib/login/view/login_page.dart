import 'package:dicoding_flutter_pemula/external/constant.dart';
import 'package:dicoding_flutter_pemula/external/widget/text_field.dart';
import 'package:dicoding_flutter_pemula/home/view/home_page.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailTextcontroller = TextEditingController();
  final passwordTextController = TextEditingController();

  @override
  void dispose() {
    emailTextcontroller.dispose();
    passwordTextController.dispose();
    super.dispose();
  }

  void login() {
    String email = this.emailTextcontroller.text;
    String password = this.passwordTextController.text;

    if (email == "randy@gmail.com" && password == "12345") {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => HomePage(),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("Username/Password salah"),
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Constant.backgroundGray,
      body: SafeArea(
        child: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraint) {
            return SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight: constraint.maxHeight,
                  minWidth: constraint.maxWidth,
                ),
                child: IntrinsicHeight(
                  child: Column(
                    children: <Widget>[
                      Expanded(
                        flex: 2,
                        child: Container(
                          color: Constant.backgroundGray,
                          padding: EdgeInsets.only(top: 72),
                          child: Text(
                            "ZWallet",
                            style: TextStyle(
                              fontFamily: Constant.fontNinotoSans,
                              color: Constant.primary,
                              fontSize: 26,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 6,
                        child: Container(
                          decoration: BoxDecoration(
                            color: Constant.backgroundWhite,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(24),
                              topRight: Radius.circular(24),
                            ),
                          ),
                          child: Column(
                            children: [
                              SizedBox(height: 40),
                              Center(
                                child: Text(
                                  "Login",
                                  style: TextStyle(
                                    fontFamily: Constant.fontNinotoSans,
                                    fontSize: 24,
                                    fontWeight: FontWeight.w700,
                                    color: Constant.textPrimary,
                                  ),
                                ),
                              ),
                              SizedBox(height: 20),
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 40, right: 40),
                                child: Center(
                                  child: Text(
                                    "Login to your existing account to access all the features in Zwallet.",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontFamily: Constant.fontNinotoSans,
                                      color: Constant.textSecondary,
                                      height: 1.5,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(height: 24),
                              Container(
                                padding: EdgeInsets.only(left: 16, right: 16),
                                child: ZTextField(
                                  textEditingController:
                                      this.emailTextcontroller,
                                  hint: "Enter your e-mail",
                                  prefixIcon: Icon(Icons.mail_outline),
                                ),
                              ),
                              SizedBox(height: 16),
                              Container(
                                padding: EdgeInsets.only(left: 16, right: 16),
                                child: ZTextField(
                                  textEditingController:
                                      this.passwordTextController,
                                  obsecureText: true,
                                  hint: "Enter your password",
                                  prefixIcon: Icon(Icons.lock_outline),
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.only(right: 16, top: 16),
                                width: double.infinity,
                                child: Text(
                                  "Forgot password?",
                                  textAlign: TextAlign.right,
                                ),
                              ),
                              SizedBox(height: 32),
                              Container(
                                padding: EdgeInsets.only(left: 16, right: 16),
                                width: double.infinity,
                                height: 57,
                                child: ElevatedButton(
                                  onPressed: this.login,
                                  child: Text('Sign in'),
                                  style: ButtonStyle(
                                    backgroundColor: MaterialStateProperty.all(
                                        Constant.primary),
                                  ),
                                ),
                              ),
                              SizedBox(height: 16),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    "Don't have an account? Let's ",
                                    style: TextStyle(
                                      fontFamily: Constant.fontNinotoSans,
                                      fontSize: 16,
                                    ),
                                  ),
                                  Text(
                                    "Sign Up",
                                    style: TextStyle(
                                      color: Constant.primary,
                                      fontFamily: Constant.fontNinotoSans,
                                      fontWeight: FontWeight.w700,
                                      fontSize: 16,
                                    ),
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

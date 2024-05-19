import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:islamy/Dialogs.dart';
import 'package:islamy/providers/settings_provider.dart';
import 'package:islamy/ui/Home/Home_Screen.dart';
import 'package:islamy/ui/Login/custom_form_field.dart';
import 'package:islamy/ui/Register/register_screen.dart';
import 'package:islamy/validationutils.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  static const String routename = "LoginScreen";

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var formKey = GlobalKey<FormState>();

  var emailcontroller = TextEditingController();

  var passwordcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<SettingsProvider>(context);
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(provider.getBackgroundImage()),
          fit: BoxFit.fill,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: Text("Login"),
        ),
        body: Container(
          padding: EdgeInsets.all(12),
          child: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.3,
                  ),
                  CustomFormField(
                    controller: emailcontroller,
                    label: "Email Address",
                    keyboardType: TextInputType.emailAddress,
                    validator: (text) {
                      if (text == null || text.trim().isEmpty) {
                        return "Please Enter Email";
                      }
                      if (!ValidationUtils.isValidEmail(text)) {
                        return "Email not valid";
                      }
                    },
                  ),
                  CustomFormField(
                    controller: passwordcontroller,
                    label: "Password",
                    keyboardType: TextInputType.text,
                    isPassword: true,
                    validator: (text) {
                      if (text == null || text.trim().isEmpty) {
                        return "Please Enter Password";
                      }
                      if (text.length < 6) {
                        return "Password should be at least 6 characters";
                      }
                    },
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        Login();
                      },
                      style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.symmetric(vertical: 12)),
                      child: Text(
                        "Login",
                        style: TextStyle(fontSize: 24),
                      )),
                  TextButton(
                      onPressed: () {
                        Navigator.pushReplacementNamed(
                            context, RegisterScreen.routeName);
                      },
                      child: Text("Don't Have an account? "))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void Login() async {
    if (formKey.currentState?.validate() == false) {
      return;
    }
    try {
      dialogs.showloadingdialog(context, "Loading...");
      var result = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailcontroller.text,
        password: passwordcontroller.text,
      );
      // if (user == null) {
      //   // user is authenticated but not found in the database
      //   dialogs.showMessage(context, "Can't find user in database",dismissable: false,PosActionName: "Ok");
      // }
      // var authProvider = Provider.of<AuthProvider>(context, listen: false);
      // authProvider.updateUser(user!);
      dialogs.showMessage(context, "User Successfully Logged in",
          dismissable: false, PosActionName: "Ok", PosAction: () {
        Navigator.pushReplacementNamed(context, HomeScreen.routeName);
      });
    } on FirebaseAuthException catch (e) {
      dialogs.hidedialog(context);
      String errorMessage = 'Something went wrong';
      if (e.code == 'user-not-found') {
        errorMessage = 'user-not-found';
      } else if (e.code == 'wrong-password') {
        errorMessage = 'Wrong password provided for that user.';
      }
      dialogs.showMessage(context, e.toString(), PosActionName: "Ok");
    } catch (e) {
      dialogs.hidedialog(context);
      String errorMessage = 'Something went wrong';
      dialogs.showMessage(context, e.toString(),
          PosActionName: "Cancel", NegActionName: "Try again", NegAction: () {
        Login();
      });
    }
  }
}

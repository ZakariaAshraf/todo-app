import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:todo_app/core/widgets/custom_text_form_field.dart';
import 'package:todo_app/home_layout/home_layout_view.dart';
import 'package:todo_app/pages/register/register_view.dart';

class LoginView extends StatefulWidget {
  static const String routeName = "login";

  LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  TextEditingController emailController = new TextEditingController();

  TextEditingController passwordController = new TextEditingController();

  bool isVisabile = false;

  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage(
              "assets/images/login_pattern.png",
            ),
          )),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          toolbarHeight: 40,
          elevation: 0,
          centerTitle: true,
          backgroundColor: Colors.transparent,
          title: Text(
            "Login",
            style: theme.textTheme.titleLarge!.copyWith(
              color: Colors.white,
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Form(
            key: formKey,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.20,
                  ),
                  Text(
                    textAlign: TextAlign.start,
                    "Welcom back! ",
                    style: theme.textTheme.bodyLarge!.copyWith(
                      fontSize: 24,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  CustomTextFormField(
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return "Please enter your e-mail address";
                      }
                      var regex = RegExp(
                          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
                      if (!regex.hasMatch(value)) {
                        return "invalid e-mail address";
                      }
                    },
                    controller: emailController,
                    label: "Email",
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  CustomTextFormField(
                    obsecure: !isVisabile,
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return "Please enter your password";
                      }
                      return null;
                    },
                    suffixIcon: GestureDetector(
                      onTap: () {
                        isVisabile = !isVisabile;
                        setState(() {});
                      },
                      child: isVisabile == true
                          ? Icon(Icons.visibility_off_outlined)
                          : Icon(Icons.visibility),
                    ),
                    controller: passwordController,
                    label: "password",
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  Text(
                    textAlign: TextAlign.start,
                    "forget password ? ",
                    style: theme.textTheme.bodyLarge!.copyWith(
                      fontSize: 14,
                      color: Colors.black,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  MaterialButton(
                    onPressed: () {
                      login();
                    },
                    elevation: 0,
                    color: theme.primaryColor,
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          textAlign: TextAlign.start,
                          "Login",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                          ),
                        ),
                        Icon(color: Colors.white, Icons.navigate_next),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, RegisterView.routeName);
                      },
                      child: Text(
                        textAlign: TextAlign.start,
                        "Or Create a new account ",
                        style: theme.textTheme.bodyLarge!.copyWith(
                          fontSize: 17,
                          color: Colors.black,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 90,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  login() async {
    if (formKey.currentState!.validate()) {
      EasyLoading.show();
      try {
        //call api
        final credential = await FirebaseAuth.instance
            .signInWithEmailAndPassword(
                email: emailController.text, password: passwordController.text);
        EasyLoading.dismiss();
        Navigator.pushNamedAndRemoveUntil(context, HomeLayoutView.routeName, (route) => false);
        print(credential.user?.uid);

      } on FirebaseAuthException catch (e) {
        if (e.code == 'user-not-found') {
          print('No user found for that email.');
        } else if (e.code == 'wrong-password') {
          print('Wrong password provided for that user.');
        }
      }
    }
  }
}

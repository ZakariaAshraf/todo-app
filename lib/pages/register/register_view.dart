import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:todo_app/core/widgets/custom_text_form_field.dart';
import 'package:todo_app/pages/home_view/home_view.dart';
import 'package:todo_app/pages/login/login_view.dart';

class RegisterView extends StatefulWidget {
  static const String routeName = "register";

  RegisterView({Key? key}) : super(key: key);

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  TextEditingController nameController = new TextEditingController();
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
            "Create account",
            style: theme.textTheme.titleLarge!.copyWith(
              color: Colors.white,
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.20,
                  ),
                  CustomTextFormField(
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return "Please enter your name";
                      }
                    },
                    controller: nameController,
                    label: "first name",
                  ),
                  const SizedBox(
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
                    height: 40,
                  ),
                  CustomTextFormField(
                    obsecure: !isVisabile,
                    validator: (value) {
                      var regexx = RegExp(
                          r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
                      if (value == null || value.trim().isEmpty) {
                        return "Please enter your password";
                      } else {
                        if (!regexx.hasMatch(value)) {
                          return 'Enter valid password';
                        } else {
                          return null;
                        }
                      }
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
                    height: 60,
                  ),
                  MaterialButton(
                    onPressed: () {
                      register();
                    },
                    elevation: 0,
                    color: theme.primaryColor,
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          textAlign: TextAlign.start,
                          "create new account",
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
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  register() async {
    if (formKey.currentState!.validate()) {
      EasyLoading.show();
      try {
        //call api
       final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
            email: emailController.text, password: passwordController.text);
        EasyLoading.dismiss();
        Navigator.pop(context);
        print(credential.user?.uid);
      } on FirebaseAuthException catch (e) {
        if (e.code == 'weak-password') {
          EasyLoading.dismiss();
          print('The password provided is too weak.');
        } else if (e.code == 'email-already-in-use') {
          print('The account already exists for that email.');
          EasyLoading.dismiss();
        }
      } catch (e) {
        print(e);
      }
    }
  }
}

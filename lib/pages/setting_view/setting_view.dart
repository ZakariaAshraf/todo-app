import 'package:flutter/material.dart';
import 'package:todo_app/core/bottom_sheet/show_language_bottom_sheet.dart';
import 'package:todo_app/core/bottom_sheet/show_theme_bottom_sheet.dart';

class SettingView extends StatefulWidget {
  const SettingView({Key? key}) : super(key: key);
  static String routeName = "Setting";

  @override
  State<SettingView> createState() => _SettingViewState();
}

class _SettingViewState extends State<SettingView> {
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            "Setting",
            style: TextStyle(color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text("Language",
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                  )),
              InkWell(
                onTap: () {
                  showLanguageBottomSheet();
                },
                child: Container(
                  margin: EdgeInsets.symmetric(vertical: 20, horizontal: 18),
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    border: Border.symmetric(
                        horizontal:
                            BorderSide(color: theme.primaryColor, width: 1),
                        vertical:
                            BorderSide(color: theme.primaryColor, width: 2)),
                    shape: BoxShape.rectangle,
                  ),
                  child: const Text("arabic",
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      )),
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              const Text(
                "Theme",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                ),
              ),
              InkWell(
                onTap: () {
                  showThemeBottomSheet();
                },
                child: Container(
                  margin: EdgeInsets.symmetric(vertical: 20, horizontal: 18),
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    border: Border.symmetric(
                        horizontal:
                            BorderSide(color: theme.primaryColor, width: 1),
                        vertical:
                            BorderSide(color: theme.primaryColor, width: 2)),
                    shape: BoxShape.rectangle,
                  ),
                  child: const Text("Light",
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      )),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  showLanguageBottomSheet() {
    showModalBottomSheet(
      shape: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.transparent),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(35),
            topRight: Radius.circular(35),
          )),
      context: context,
      builder: (context) => LanguageBottomSheet(),
    );
  }

  showThemeBottomSheet() {
    showModalBottomSheet(
      shape: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.transparent),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(35),
            topRight: Radius.circular(35),
          )),
      context: context,
      builder: (context) => ThemingBottomSheet(),
    );
  }
}

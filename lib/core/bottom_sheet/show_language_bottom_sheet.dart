import 'package:flutter/material.dart';

class LanguageBottomSheet extends StatelessWidget {
  LanguageBottomSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    //var provider=Provider.of<MyProvider>(context);
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            InkWell(
              onTap: () {
                  //provider.changeLanguage("en");
              },
              child: Row(
                children: [
                  Text("English",style: theme.textTheme.bodyMedium!.copyWith(color: theme.primaryColor),),
                  Spacer(),
                  //provider.languageCode=="en" ? Icon(Icons.done) : SizedBox.shrink(),
                ],
              ),
            ),
            InkWell(
              onTap: () {
                //provider.changeLanguage("ar");
              },
              child: Row(
                children: [
                  Text("عربي",style: theme.textTheme.bodyMedium!.copyWith(color: Colors.black),),
                  Spacer(),
                  //provider.languageCode=="en" ? SizedBox.shrink() : Icon(Icons.done),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';


class ThemingBottomSheet extends StatelessWidget {
  const ThemingBottomSheet({Key? key}) : super(key: key);

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

              },
              child: Row(
                children: [
                  Text("Light",style: theme.textTheme.bodyMedium!.copyWith(color: theme.primaryColor),),
                  Spacer(),
                  // provider.languageCode=="en" ? Icon(Icons.done) : SizedBox.shrink(),
                ],
              ),
            ),
            InkWell(
              onTap: () {

              },
              child: Row(
                children: [
                  Text("Dark",style: theme.textTheme.bodyMedium!.copyWith(color: Colors.black),),
                  Spacer(),
                  // provider.languageCode=="en" ? SizedBox.shrink() : Icon(Icons.done),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

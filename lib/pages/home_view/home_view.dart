import 'package:calendar_timeline/calendar_timeline.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/core/network_layer/firestore_utils.dart';
import 'package:todo_app/core/widgets/task_item_widget.dart';
import 'package:todo_app/modal/task_modal.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);
  static String routeName = "Home_View";

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Column(
      children: [
        Stack(
          alignment: Alignment(0, 2.6),
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              alignment: Alignment.centerLeft,
              color: theme.primaryColor,
              height: 160,
              width: double.infinity,
              child: Text(
                "To Do List",
                style: theme.textTheme.titleLarge,
              ),
            ),
            CalendarTimeline(
              dayNameColor: Colors.white,
              initialDate: DateTime.now(),
              firstDate: DateTime.now(),
              lastDate: DateTime.now().add(Duration(
                days: 365,
              )),
              onDateSelected: (date) => print(date),
              leftMargin: 20,
              monthColor: Colors.black,
              dayColor: Colors.black,
              activeDayColor: theme.primaryColor,
              dotsColor: theme.primaryColor,
              activeBackgroundDayColor: Colors.white,
              selectableDayPredicate: (date) => date.day != 23,
              locale: 'en_ISO',
              shrink: true,
            )
          ],
        ),
        SizedBox(height: 40),
        FutureBuilder<List<TaskModal>>(
          future: FirestoreUtils.getDataFromFirestore(

          ),
          builder: (context, snapshot) {
            if(snapshot.hasError){
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(snapshot.error.toString()),
                  SizedBox(height: 40),
                  IconButton(onPressed: () {
                    //call the api
                  }, icon: Icon(
                    Icons.refresh,
                  ))
                ],


              );
            }
            if(snapshot.connectionState==ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(
                  color: theme.primaryColor,
                ),
              );
            }
            var tasksList = snapshot.data ?? [];
            return Expanded(
                child: ListView.builder(
                  padding: EdgeInsets.zero,
                  itemBuilder: (context, index) => TaskItemWidget(taskModal: tasksList[index]),
                  itemCount: tasksList.length,
                ));
          },
        ),
        // Expanded(
        //     child: ListView.builder(
        //       padding: EdgeInsets.zero,
        //   itemBuilder: (context, index) => TaskItemWidget(),
        //   itemCount: 5,
        // )),
      ],
    );
  }
}

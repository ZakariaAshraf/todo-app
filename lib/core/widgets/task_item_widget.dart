import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:todo_app/modal/task_modal.dart';

class TaskItemWidget extends StatelessWidget {
  final TaskModal taskModal;
  const TaskItemWidget({Key? key, required this.taskModal}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var theme=Theme.of(context);
    return Container(
      width: 352,
      height: 115,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.red,
      ),
      margin: EdgeInsets.symmetric(horizontal: 20,vertical: 10),

      child: Slidable(
        startActionPane: ActionPane(extentRatio: 0.25,motion: DrawerMotion(), children: [
          SlidableAction(
            // An action can be bigger than the others.
            flex: 2,
            onPressed: (BuildContext context) {

            },
            backgroundColor: Colors.red,
            foregroundColor: Colors.white,
            icon: Icons.delete,
            label: 'Delete',
            borderRadius: BorderRadius.circular(15.0),
          ),
        ]),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Colors.white,
          ),
          width: 352,
          height: 115,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(
                  color:theme.primaryColor ,
                  borderRadius: BorderRadius.circular(20),
                ),
                width: 8,
                height:100,

              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment:MainAxisAlignment.start,

                children: [
                  Text(
                      taskModal.title,
                  style: theme.textTheme.titleLarge!.copyWith(color:theme.primaryColor),
                  ),
                  SizedBox(height: 10,),
                  Row(
                    children: [
                      Icon(Icons.access_time_rounded) ,
                      Text(
                          taskModal.description,
                      style: theme.textTheme.bodySmall!.copyWith(color:Colors.black,fontSize: 15),
                      ),
                    ],
                  ),


                ],
              ),
              Container(
                decoration: BoxDecoration(
                  color:theme.primaryColor,
                  borderRadius: BorderRadius.circular(20),
                ),
                width: 80,
                height:50,
                child: Icon(
                  Icons.check,
                  color:Colors.white,
                  size: 30,
                ),
              ),


            ],
          ),

        ),
      ),
    );
  }
}

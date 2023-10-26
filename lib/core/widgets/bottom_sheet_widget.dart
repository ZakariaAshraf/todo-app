import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:todo_app/core/network_layer/firestore_utils.dart';
import 'package:todo_app/core/widgets/custom_text_form_field.dart';
import 'package:todo_app/modal/task_modal.dart';

class BottomSheetWidget extends StatefulWidget {
  BottomSheetWidget({Key? key}) : super(key: key);

  @override
  State<BottomSheetWidget> createState() => _BottomSheetWidgetState();
}

class _BottomSheetWidgetState extends State<BottomSheetWidget> {
  TextEditingController titleController = TextEditingController();

  TextEditingController descriptionController = TextEditingController();

  DateTime selectedTime = DateTime.now();

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var formKey = GlobalKey<FormState>();
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Form(
        key: formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              textAlign: TextAlign.center,
              "Add a new task",
              style: theme.textTheme.titleLarge!.copyWith(color: Colors.black),
            ),
            CustomTextFormField(
                validator: (String? value) {
                  if (value == null || value.trim().isEmpty) {
                    return "Please enter a title";
                  } else if (value.length < 10) {
                    return "Title must be at least 10 characters";
                  } else
                    return null;
                },
                title: "Enter your task title",
                controller: titleController),
            CustomTextFormField(
                maxLines: 4,
                validator: (String? value) {
                  if (value == null || value.trim().isEmpty) {
                    return "Please enter a description";
                  } else if (value.length < 10) {
                    return "Title must be at least 10 characters";
                  } else
                    return null;
                },
                title: "Enter your task description",
                controller: descriptionController),
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  "Select time",
                  style:
                      theme.textTheme.bodyLarge!.copyWith(color: Colors.black),
                ),
                GestureDetector(
                  onTap: () {
                    ShowCalendar(context);
                  },
                  child: Text(
                    DateFormat.yMMMd().format(selectedTime),
                    textAlign: TextAlign.center,
                    style: theme.textTheme.bodyMedium!
                        .copyWith(color: theme.primaryColor),
                  ),
                ),
              ],
            ),
            ElevatedButton(
                onPressed: () async {
                  if (formKey.currentState!.validate()) {
                    var modal = TaskModal(
                      title: titleController.text,
                      description: descriptionController.text,
                      dateTime: DateTime.now(),
                      isDone: false,
                    );
                    await FirestoreUtils.addDataToFirestore(modal);
                    Navigator.pop(context);
                    print(titleController.text);
                  }
                },
                child: Text(
                  "Add task",
                  style:
                      theme.textTheme.bodyLarge!.copyWith(color: Colors.white),
                )),
          ],
        ),
      ),
    );
  }

  ShowCalendar(BuildContext context) async {
    var dateSelected = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime.now(),
        lastDate: DateTime.now().add((const Duration(days: 365,)),
        ),
    );
    if (dateSelected==null)return;
    selectedTime=dateSelected;
    setState(() {});
  }
}

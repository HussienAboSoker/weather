import 'package:flutter/material.dart';

class CustomTextFiled extends StatelessWidget {
  const CustomTextFiled(
      {super.key,
      required this.hintText,
      required this.onSubmitted,
      //required this.textEditingController
      });
  final String hintText;
  final Function(String) onSubmitted;
 //  TextEditingController textEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      //take hinttext
      //onSubmitted
      child: TextField(
        //controller: textEditingController,
        onSubmitted: (value) {
          onSubmitted(value);
        },
        decoration: InputDecoration(
          hintText: hintText,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0), // Set your border radius
          ),
        ),
      ),
    );
  }
}

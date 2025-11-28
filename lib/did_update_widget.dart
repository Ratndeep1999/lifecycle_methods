import 'package:flutter/material.dart';
import 'custom_button.dart';

class ParentWidget extends StatefulWidget {
  const ParentWidget({super.key});

  @override
  State<ParentWidget> createState() {
    return ParentWidgetState();
  }
}

class ParentWidgetState extends State<ParentWidget> {
  bool isUpdateChild = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('didUpdateWidget() Demo'), centerTitle: true),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              /// Custom Button
              CustomButton(
                label: 'Change in Parent Widget Update Child State',
                onPress: () {
                  setState(() {
                    isUpdateChild = true;
                  });
                },
              ),

              SizedBox(height: 40.0),

              /// Child Widget
              ChildWidget(isUpdateWidget: isUpdateChild),
            ],
          ),
        ),
      ),
    );
  }
}

/// Child Widget Where Actually State Change
class ChildWidget extends StatefulWidget {
  final bool isUpdateWidget;

  const ChildWidget({super.key, required this.isUpdateWidget});

  @override
  State<ChildWidget> createState() {
    return ChildWidgetState();
  }
}

/// Child Widget State
class ChildWidgetState extends State<ChildWidget> {
  late int index = 0;

  // It initialize index
  _initialize() {
    index = 0;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Text("Counting : $index"),

          SizedBox(height: 20),

          // It Increase index
          CustomButton(
            label: 'Increase Count',
            onPress: () {
              setState(() {
                index++;
              });
            },
          ),
        ],
      ),
    );
  }
}

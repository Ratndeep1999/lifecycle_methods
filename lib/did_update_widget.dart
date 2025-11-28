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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('didUpdateWidget() Demo'), centerTitle: true),
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              CustomButton(label: 'Change in Parent class', onPress: () {}),
            ],
          ),
        ),
      ),
    );
  }
}

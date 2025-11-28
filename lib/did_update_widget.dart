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

  ChildWidget({super.key, required this.isUpdateWidget}) {
    debugPrint('ChildWidget Constructor Called');
  }

  @override
  State<ChildWidget> createState() {
    debugPrint('createState() Called');
    return ChildWidgetState();
  }
}

/// Child Widget State
class ChildWidgetState extends State<ChildWidget> {
  late int index;

  @override
  void initState() {
    debugPrint('initState() Called');
    _initialize();
    super.initState();
  }

  @override
  void didChangeDependencies() {
    debugPrint('didChangeDependencies() Called');
    super.didChangeDependencies();
  }

  @override
  void didUpdateWidget(ChildWidget oldWidget) {
    debugPrint('didUpdateWidget() Called');

    if (widget.isUpdateWidget != oldWidget.isUpdateWidget){
      _initialize();
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  void deactivate() {
    debugPrint('deactivated() Called');
    super.deactivate();
  }

  @override
  void dispose() {
    debugPrint('dispose() Called');
    super.dispose();
  }

  // It initialize index
  _initialize() {
    debugPrint('_initialize() Called');
    index = 0;
  }

  @override
  Widget build(BuildContext context) {
    debugPrint('Build() Called Counting : $index');
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

/// When Page Load at First Time
// I/flutter (25831): ChildWidget Constructor Called
// I/flutter (25831): createState() Called
// I/flutter (25831): initState() Called
// I/flutter (25831): _initialize() Called
// I/flutter (25831): didChangeDependencies() Called
// I/flutter (25831): Build() Called Counting : 0

/// When setState() called twice
// I/flutter (25831): Build() Called Counting : 1
// I/flutter (25831): Build() Called Counting : 2

/// When Parent State Change the, Child change only Widget State
// I/flutter (25831): ChildWidget Constructor Called
// I/flutter (25831): didUpdateWidget() Called
// I/flutter (25831): _initialize() Called
// I/flutter (25831): Build() Called Counting : 0


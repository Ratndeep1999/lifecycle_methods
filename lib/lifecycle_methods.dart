import 'package:flutter/material.dart';

class LifecycleMethods extends StatefulWidget {
  const LifecycleMethods({Key? key}) : super(key: key);

  @override
  State<LifecycleMethods> createState() {
    return LifecycleMethodsState();
  }
}

class LifecycleMethodsState extends State<LifecycleMethods> {
  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: Text('Lifecycle Methods'), centerTitle: true),
    body: SafeArea(
      child: Center(
        child: ElevatedButton(
          onPressed: () {
            /// setState to call build()
            setState(() {});
          },
          child: Text('set state'),
        ),
      ),
    ),
  );
}

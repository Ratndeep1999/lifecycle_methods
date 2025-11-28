import 'package:flutter/material.dart';

class LifecycleMethods extends StatefulWidget {
  LifecycleMethods({Key? key}) : super(key: key) {
    debugPrint('Constructor called');
  }

  @override
  State<LifecycleMethods> createState() {
    debugPrint('createState() called');
    return LifecycleMethodsState();
  }
}

class LifecycleMethodsState extends State<LifecycleMethods> {
  @override
  void initState() {
    debugPrint('initState() called');
    super.initState();
  }

  @override
  void didChangeDependencies() {
    debugPrint('didChangeDependencies() called');
    super.didChangeDependencies();
  }

  @override
  void didUpdateWidget(LifecycleMethods oldWidget) {
    debugPrint('didUpdateWidget called');
    super.didUpdateWidget(oldWidget);
  }

  @override
  void deactivate() {
    debugPrint('deactivate() called');
    super.deactivate();
  }

  @override
  void dispose() {
    debugPrint('dispose() called');
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    debugPrint('build() called');
    return Scaffold(
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
}

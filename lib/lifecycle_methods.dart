import 'package:flutter/material.dart';

class LifecycleMethods extends StatefulWidget {
  LifecycleMethods({super.key}) {
    debugPrint('constructor called\n');
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
    debugPrint('\ndidUpdateWidget() called');
    super.didUpdateWidget(oldWidget);
  }

  @override
  void deactivate() {
    debugPrint('\ndeactivate() called');
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
              setState(() {
                debugPrint('\nsetState() called');
              });
            },
            child: Text('set state'),
          ),
        ),
      ),
    );
  }
}

/// First time run
// I/flutter (27432): constructor called
// I/flutter (27432):
// I/flutter (27432): createState() called
// I/flutter (27432): initState() called
// I/flutter (27432): didChangeDependencies() called
// I/flutter (27432): build() called

/// setState() called
// I/flutter (27432): setState() called
// I/flutter (27432): build() called

/// Hot Reload
// I/flutter (27432): constructor called
// I/flutter (27432):
// I/flutter (27432):
// I/flutter (27432): didUpdateWidget() called
// I/flutter (27432): build() called

/// Hot Restart
// I/flutter (27432): constructor called
// I/flutter (27432):
// I/flutter (27432): createState() called
// I/flutter (27432): initState() called
// I/flutter (27432): didChangeDependencies() called
// I/flutter (27432): build() called
// I/flutter (27432): constructor called
// I/flutter (27432):
// I/flutter (27432):
// I/flutter (27432): didUpdateWidget() called
// I/flutter (27432): build() called


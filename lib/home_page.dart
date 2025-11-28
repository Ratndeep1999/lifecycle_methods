import 'package:flutter/material.dart';
import 'package:lifecycle_methods/custom_button.dart';
import 'package:lifecycle_methods/did_update_widget.dart';
import 'package:lifecycle_methods/lifecycle_methods.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Home Page'), centerTitle: true),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              /// Lifecycle methods
              CustomButton(
                label: 'Lifecycle Methods',
                onPress: _navigateToLifecyclePage(context),
              ),

              /// DidUpdateWidget Demo
              CustomButton(
                label: 'didUpdateWidget() demo',
                onPress: _navigateToDidUpdateWidgetDemo(context),
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// LifecycleMethods page route
  _navigateToLifecyclePage(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => LifecycleMethods()),
    );
  }

  /// DidUpdateWidget demo Page
  _navigateToDidUpdateWidgetDemo(context) {
    Navigator.push(context, MaterialPageRoute(builder: (_) => ParentWidget()));
  }
}

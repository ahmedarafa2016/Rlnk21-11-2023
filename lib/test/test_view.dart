import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';

class TestView extends StatelessWidget {
  const TestView({super.key});

  static const headerStyle = TextStyle(
      color: Color(0xffffffff), fontSize: 18, fontWeight: FontWeight.bold);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          color: Colors.blueGrey,
          child: const Padding(
            padding: EdgeInsets.all(10.0),
            child: Column(
              children: [
                GFAccordion(
                    title: 'GF Accordion',
                    content:
                        'GetFlutter is an open source library that comes with pre-build 1000+ UI components.',
                    collapsedIcon: Text('Show'),
                    expandedIcon: Text('Hide')),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

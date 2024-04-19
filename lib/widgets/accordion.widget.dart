import 'package:flutter/material.dart';
import 'package:omegainc_lib/helper/responsivefontsize.helper.dart';

class AccordionWidget extends StatefulWidget {
  String title;
  Widget content;
  bool startExpanded = false;

  AccordionWidget({
    required this.title,
    required this.content,
    this.startExpanded = false,
  });

  @override
  _AccordionWidgetState createState() => _AccordionWidgetState();
}

class _AccordionWidgetState extends State<AccordionWidget> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    isExpanded = widget.startExpanded;

    return Card(
      child: ExpansionTile(
        title: Text(
          widget.title,
          style: TextStyle(
            fontSize: ResponsiveFontSizeHelper.sp(context, 11),
          ),
        ),
        onExpansionChanged: (bool expanding) {
          setState(() {
            isExpanded = expanding;
          });
        },
        initiallyExpanded: isExpanded,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: widget.content,
          ),
        ],
      ),
    );
  }
}

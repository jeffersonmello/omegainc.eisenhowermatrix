import 'package:eisenhowermatrix/widgets/card.widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class QuadrantWidget extends StatefulWidget {
  Color color;
  String title;

  QuadrantWidget({required this.color, required this.title, super.key});

  @override
  State<QuadrantWidget> createState() => _QuadrantWidgetState();
}

class _QuadrantWidgetState extends State<QuadrantWidget> {
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;

    return Expanded(
      flex: 1,
      child: Container(
        margin: const EdgeInsets.all(3.0),
        height: (screenHeight * 0.44),
        child: Card(
          elevation: 8.0,
          color: widget.color,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                color: Colors.black.withOpacity(0.5),
                margin: const EdgeInsets.all(5.0),
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Icon(
                      CupertinoIcons.checkmark_rectangle,
                      color: Colors.white,
                      size: 25,
                    ),
                    const SizedBox(width: 10),
                    Text(
                      widget.title,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

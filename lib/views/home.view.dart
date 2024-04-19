import 'package:eisenhowermatrix/widgets/quadrant.widget.dart';
import 'package:flutter/material.dart';

import 'abstract/base.view.dart';

class HomeView extends BaseStatefulWidget {
  HomeView({super.key});

  @override
  BaseState<HomeView> createState() => HomeViewState();
}

class HomeViewState extends BaseState<HomeView> {
  HomeViewState() {
    super.viewTitle = 'Home';
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }


  @override
  Widget buildWidget(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;

    return Container(
      margin: const EdgeInsets.all(5),
      padding: const EdgeInsets.all(8),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              children: [
                QuadrantWidget(color: Colors.red, title: 'Importante & Urgente'),
                QuadrantWidget(color: Colors.green, title: 'Importante & Não Urgente'),
              ],
            ),
            Row(
              children: [
                QuadrantWidget(color: Colors.blue, title: 'Não Importante & Urgente'),
                QuadrantWidget(color: Colors.grey, title: 'Não Importante & Não Urgente'),
              ],
            )
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

import '../consts/consts.dart';

class AppBarWidget extends StatefulWidget implements PreferredSizeWidget {
  @override
  _AppBarWidgetState createState() => _AppBarWidgetState();

  String? title;
  List<Widget>? actions;
  Widget? leading;
  double fontSize;
  bool useCustomFont;
  bool titleWithLogo;

  AppBarWidget({
    this.title,
    this.actions,
    this.leading,
    this.fontSize = 19,
    this.useCustomFont = true,
    this.titleWithLogo = false,
    super.key,
  });

  @override
  Size get preferredSize => const Size(double.infinity, (kToolbarHeight));
}

class _AppBarWidgetState extends State<AppBarWidget> {
  Widget _makeTitle() {
    if (widget.title != null) {
      if (!widget.titleWithLogo) {
        return Text(
          widget.title!,
          style: TextStyle(
            fontSize: widget.fontSize,
            fontFamily: widget.useCustomFont ? 'Stereofunk' : '',
          ),
        );
      }

      return Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Image.asset(
            'assets/img/logo_curia_vertical.png',
            height: 40,
            width: 40,
            fit: BoxFit.cover,
            color: Colors.white,
          ),
          Text(
            widget.title!,
            style: TextStyle(
              fontSize: widget.fontSize,
              fontFamily: widget.useCustomFont ? 'Stereofunk' : '',
            ),
          )
        ],
      );
    } else {
      return Image.asset(
        '',
        height: 55,
        fit: BoxFit.cover,
        color: Colors.white,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      leading: widget.leading,
      actions: widget.actions,
      title: Container(
        margin: const EdgeInsets.only(top: 5.0),
        child: _makeTitle(),
      ),
      flexibleSpace: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: <Color>[
                Consts.primaryColor,
                Consts.secondaryColor,
              ]),
        ),
      ),
    );
  }
}

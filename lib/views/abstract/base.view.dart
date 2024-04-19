import 'package:flutter/material.dart';
import 'package:loading_overlay/loading_overlay.dart';
import 'package:omegainc_lib/omegainc_lib.dart';

import '../../consts/consts.dart';
import '../../widgets/appbar.widget.dart';

abstract class BaseState<T extends StatefulWidget> extends State<T> {
  CommonUtil commonUtil = CommonUtil();
  String loadingLabel = 'Carregando...';
  bool isBusy = false;
  String viewTitle = 'Window';
  List<Widget>? actions;
  bool withoutAppBar = false;

  void showLoading({String? message}) {
    setState(() {
      isBusy = true;
      loadingLabel = message ?? 'Carregando...';
    });
  }

  void hideLoading() {
    setState(() {
      isBusy = false;
    });
  }

  void dialogSuccess(dynamic message) {
    this.commonUtil.success(context, message);
  }

  void dialogError(Object error) {
    this.commonUtil.errorException(context, error);
  }

  @override
  Widget build(BuildContext context) {
    return LoadingOverlay(
      color: Colors.grey,
      isLoading: isBusy,
      progressIndicator: OmegaLoadingWidget(
        textColor: Colors.black,
        message: loadingLabel,
      ),
      child: Scaffold(
        backgroundColor: Consts.defaultBackground,
        appBar: withoutAppBar ? null : AppBarWidget(
          title: viewTitle,
          actions: actions,
          useCustomFont: false,
        ),
        body: buildWidget(context),
      ),
    );
  }

  Widget buildWidget(BuildContext context);
}

abstract class BaseStatefulWidget extends StatefulWidget {
  BaseStatefulWidget({Key? key}) : super(key: key);

  @override
  BaseState createState();
}

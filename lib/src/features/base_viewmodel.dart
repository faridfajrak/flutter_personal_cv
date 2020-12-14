import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BaseViewModel extends ChangeNotifier{

  final BuildContext context;

  BaseViewModel({@required this.context});


  void handleRestErrors(int httpResCode, String message,BuildContext context) async {
    switch (httpResCode) {
      case 401:

        break;
      case 200:
        break;
      default:
        Scaffold.of(context).showSnackBar(SnackBar(content: Text(message)));
        break;
    }
  }

}
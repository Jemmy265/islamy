import 'package:flutter/material.dart';

class dialogs {
  static void showloadingdialog(BuildContext context, String message) {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (buildContext) {
          return AlertDialog(
            content: Row(
              children: [
                CircularProgressIndicator(),
                SizedBox(
                  width: 12,
                ),
                Text(message)
              ],
            ),
          );
        });
  }

  static void hidedialog(BuildContext context) {
    Navigator.pop(context);
  }

  static void showMessage(
    BuildContext context,
    String message, {
    String? PosActionName,
    VoidCallback? PosAction,
    VoidCallback? NegAction,
    String? NegActionName,
    bool dismissable = true,
  }) {
    List<Widget> actions = [];
    if (PosActionName != null) {
      actions.add(TextButton(
          onPressed: () {
            Navigator.pop(context);
            PosAction?.call();
          },
          child: Text(PosActionName)));
    }
    if (NegActionName != null) {
      actions.add(TextButton(
          onPressed: () {
            Navigator.pop(context);
            NegAction?.call();
          },
          child: Text(NegActionName)));
    }
    showDialog(
        context: context,
        barrierDismissible: dismissable,
        builder: (buildContext) {
          return AlertDialog(
            content: Text(message),
            actions: actions,
          );
        });
  }
}

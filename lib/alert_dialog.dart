import 'package:flutter/material.dart';

Future<void> showAlertDialog(
    {required BuildContext context,
    required String title,
    required String content,
    required String defaultActionText,
    final VoidCallback? onOkPressed}) async {
  await showDialog(
    context: context,
    builder: (context) => AlertDialog(
      title: Text(title),
      content: Text(content),
      actions: <Widget>[
        TextButton(
          onPressed: () => onOkPressed!(),
          child: Text(defaultActionText),
        ),
      ],
    ),
  );
}

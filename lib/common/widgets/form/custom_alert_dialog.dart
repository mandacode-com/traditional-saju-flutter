import 'package:flutter/material.dart';

class CustomAlertDialog extends StatelessWidget {
  const CustomAlertDialog({
    required this.title,
    required this.content,
    required this.confirmText,
    required this.cancelText,
    required this.onConfirm,
    required this.onCancel,
    super.key,
  });

  final String title;
  final String content;
  final String confirmText;
  final String cancelText;
  final VoidCallback onConfirm;
  final VoidCallback onCancel;

  @override
  Widget build(BuildContext context) {
    final buttonStyle = ElevatedButton.styleFrom(
      textStyle: const TextStyle(
        fontFamily: 'NanumSquareNeo',
        fontSize: 12,
        fontWeight: FontWeight.w700,
        color: Color(0xFF333333),
      ),
      backgroundColor: Colors.black,
      padding: EdgeInsets.zero,
    );
    return AlertDialog(
      titleTextStyle: const TextStyle(
        fontFamily: 'NanumSquareNeo',
        fontSize: 16,
        fontWeight: FontWeight.w700,
        color: Color(0xFF333333),
      ),
      contentTextStyle: const TextStyle(
        fontFamily: 'NanumSquareNeo',
        fontSize: 12,
        fontWeight: FontWeight.w400,
        color: Color(0xFF333333),
      ),
      buttonPadding: const EdgeInsets.symmetric(horizontal: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      contentPadding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
      actionsPadding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      actionsAlignment: MainAxisAlignment.end,
      title: Text(title),
      content: Text(content),
      actions: [
        ElevatedButton(
          onPressed: onCancel,
          style: buttonStyle,
          child: Text(cancelText),
        ),
        ElevatedButton(
          onPressed: onConfirm,
          style: buttonStyle,
          child: Text(confirmText),
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';

class BasicBtn extends StatelessWidget {
  const BasicBtn({super.key, this.btnClick, this.btnText});
  final VoidCallback? btnClick;
  final String? btnText;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      width: 200,
      child: ElevatedButton(
        style: const ButtonStyle(
            elevation: WidgetStatePropertyAll(0),
            backgroundColor: WidgetStatePropertyAll(Colors.black)),
        onPressed: btnClick,
        child: Text(
          btnText!,
          style: const TextStyle(
              color: Colors.white, fontSize: 17, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}

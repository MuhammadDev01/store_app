import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    this.textbutton,
    this.ontap,
    required this.child,
  });

  final String? textbutton;
  final VoidCallback? ontap;
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(
        8.0,
      ),
      child: GestureDetector(
        onTap: ontap,
        child: Container(
          width: double.infinity,
          height: 45,
          decoration: BoxDecoration(
            color: Colors.blueAccent,
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: Center(
            child: child,
          ),
        ),
      ),
    );
  }
}

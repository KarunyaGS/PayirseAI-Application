import 'package:Payirseai/data/core/configs/theme/app_colors.dart';
import 'package:flutter/material.dart';

class BasicAppButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String title;
  final double ? height;
  const BasicAppButton({
    required this.onPressed,
    required this.title,
    
    this.height,
    super.key
  });

  @override
  Widget build(BuildContext context) {
   // double butttonFontSize = _currentLanguage
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        minimumSize: Size.fromHeight(height ?? 70),
        backgroundColor: AppColors.primary
      ),
      child: Text(
        title,
        style: const TextStyle(
          color: AppColors.lightBackground,
          letterSpacing: 2.0 ,
          fontSize: 15,
          fontFamily: 'Satoshi',
          fontWeight: FontWeight.bold
        ),
      )
      );
  }
}
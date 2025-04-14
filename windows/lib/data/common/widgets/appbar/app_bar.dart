import 'package:Payirseai/data/core/configs/theme/app_colors.dart';
import 'package:flutter/material.dart';


class BasicAppBar extends StatelessWidget implements PreferredSizeWidget{
  final Widget ? title;
  final bool hideBack;
  const BasicAppBar({
    this.title,
    this.hideBack = false,
    super.key,});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      
      elevation: 0,
      centerTitle: true,
      title: title ?? const Text('') ,
      leading: hideBack ? null : IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: Container(
          height: 60,
          width: 60,
          decoration: BoxDecoration(
            color: Colors.grey.withOpacity(0.3),
            shape: BoxShape.circle
          ),
          child: const Icon(
            Icons.arrow_back_rounded,
            size: 20,
            color:  AppColors.primary ,
            
          ),
        ) ,
      ),
      
    );

  }
  
  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
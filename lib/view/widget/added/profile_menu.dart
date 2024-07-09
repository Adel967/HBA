

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfileMenuWidget extends StatelessWidget {
  final String title;
  final IconData icon;
  final VoidCallback onPress;
  final bool endIcon;
  final Color? textColor;

  const ProfileMenuWidget({
    Key? key,
    required this.title,
    required this.icon,
    required this.onPress,
    this.endIcon = true,
    this.textColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onPress,
      leading: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
        ),
        child: Icon(icon ,size: 33,color:const Color(0xFF003580),),
      ),
      title: Text(title,
          style:
              GoogleFonts.sourceCodePro(fontSize: 18).apply(color: textColor)),
      trailing: endIcon
          ? Container(
              width: 30,
              height: 30,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
              ),
              child: const Icon(
                Icons.arrow_forward_ios,
              ),
            )
          : null,
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hba/core/constant/color.dart';

class BottomBarItem extends StatelessWidget {
  const BottomBarItem(
    this.icon, {super.key, 
    this.onTap,
    this.color = Colors.grey,
    this.activeColor = AppColor.general,
    this.isActive = false,
  });

  final String icon;
  final Color color;
  final Color activeColor;
  final bool isActive;
  final GestureTapCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeIn,
        padding: EdgeInsets.all(7),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          color: AppColor.bottomBarColor,
          boxShadow: [
            if (isActive)
              BoxShadow(
                color: AppColor.general.withOpacity(0.7),
                spreadRadius: 2,
                blurRadius: 2,
                offset: Offset(0, 0), // changes position of shadow
              ),
          ],
        ),
        child: SvgPicture.asset(
          icon,
          color: isActive ? AppColor.general : color,
          width: 20,
          height: 25,
          
        ),
      ),
    );
  }
}

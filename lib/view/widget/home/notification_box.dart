import 'package:badges/badges.dart' as badges;
import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hba/core/constant/color.dart';

class NotificationBox extends StatelessWidget {
  const NotificationBox({
    Key? key,
    this.onTap,
    this.size = 5,
    this.notifiedNumber = 0,
  }) : super(key: key);



  final GestureTapCallback? onTap;
  final int notifiedNumber;
  final double size;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(size),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: AppColor.appBarColor,
          border: Border.all(color: Colors.grey.withOpacity(.3)),
        ),
        child: notifiedNumber > 0 ? _buildIconNotified() : _buildIcon(),
      ),
    );
  }

  Widget _buildIconNotified() {
    return badges.Badge(
      badgeStyle: const badges.BadgeStyle(badgeColor: AppColor.actionColor),
      position: BadgePosition.topEnd(top: -7, end: 0),
      badgeContent: Text(
        '',
        style: TextStyle(color: Colors.white),
      ),
      child: _buildIcon(),
    );
  }

  Widget _buildIcon() {
    return SvgPicture.asset(
      "assets/icons/bell.svg",
      width: 20,
      height: 20,
    );
  }
}

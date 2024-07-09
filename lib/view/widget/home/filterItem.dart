import 'package:flutter/material.dart';
import 'package:hba/core/constant/color.dart';
import 'package:hba/data/model/room_model.dart';

class FilterItem extends StatelessWidget {
  const FilterItem({
    Key? key,
    this.isSelected = false,
    this.onTap, required this.roomsModel, 
  }) : super(key: key);

  final RoomsModel roomsModel;
  final bool isSelected;
  final GestureTapCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 500),
        curve: Curves.fastOutSlowIn,
        padding: EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: isSelected ? AppColor.general : AppColor.cardColor,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: AppColor.shadowColor.withOpacity(0.05),
              spreadRadius: .5,
              blurRadius: .5,
              offset: Offset(1, 1), // changes position of shadow
            ),
          ],
        ),
        child: Text(
          "${roomsModel.type}",
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            fontSize: 13,
            color: isSelected ? Colors.white : AppColor.darker,
          ),
        ),
      ),
    );
  }
}

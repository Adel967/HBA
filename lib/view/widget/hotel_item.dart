import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:hba/core/ui/responsive_text.dart';

import '../../core/constant/color.dart';
import '../../data/model/hotel_model.dart';
import 'home/custom_image.dart';

class HotelItem extends StatelessWidget {
  final HotelModel hotelModel;
  final double width;
  final double height;
  final GestureTapCallback? onTapFavorite;
  final GestureTapCallback? onTap;

  const HotelItem({
    Key? key,
    this.width = 280,
    this.height = 325, //300
    this.onTap,
    this.onTapFavorite,
    required this.hotelModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width,
        height: height,
        padding: EdgeInsets.all(10),
        margin: EdgeInsets.symmetric(vertical: 5),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: AppColor.shadowColor.withOpacity(0.1),
              spreadRadius: 1,
              blurRadius: 1,
              offset: Offset(1, 1), // changes position of shadow
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Hero(
              tag: hotelModel.hotelsImage!,
              child: CustomImage(
                hotelModel.hotelsImage!,
                width: double.infinity,
                isNetwork: true,
                height: 190,
                radius: 15,
              ),
            ),
            Container(
              width: width - 20,
              padding: EdgeInsets.fromLTRB(5, 10, 5, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildName(),
                  SizedBox(
                    height: 2,
                  ),
                  _buildInfo(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildName() {
    return Text(
      "${hotelModel.hotelsName}",
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(
        fontSize: 18,
        color: AppColor.textColor,
        fontWeight: FontWeight.w600,
      ),
    );
  }

  Widget _buildInfo() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RatingBar.builder(
              initialRating: hotelModel.rating! / 2,
              minRating: 1,
              direction: Axis.horizontal,
              allowHalfRating: true,
              itemCount: 5,
              itemBuilder: (context, _) => const Icon(
                Icons.star,
                color: AppColor.yellow,
              ),
              ignoreGestures: true,
              itemSize: 13,
              onRatingUpdate: (rating) {},
            ),
            const SizedBox(
              height: 3,
            ),
            ResponsiveText(
              textWidget: Text(
                "${hotelModel.address}",
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  color: AppColor.general,
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
        // FavoriteBox(
        //   size: 16,
        //   onTap: onTapFavorite,
        //   isFavorited: data["is_favorited"],
        // )
      ],
    );
  }
}

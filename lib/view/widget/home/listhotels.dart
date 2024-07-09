import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:hba/controller/home/home_controller.dart';
import 'package:hba/core/constant/color.dart';
import 'package:hba/data/model/hotel_model.dart';
import 'package:hba/linkapi.dart';
import 'package:hba/view/screen/added/detail_page.dart';
import 'package:hba/view/screen/hotel_detail/hotel_detail_screen.dart';
import 'package:hba/view/widget/home/custom_image.dart';

import '../hotel_item.dart';

class ListHotelsHome extends GetView<HomeControllerImp> {
  const ListHotelsHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        height: 335, //300
        enlargeCenterPage: true,
        disableCenter: true,
        viewportFraction: .75,
      ),
      items: List.generate(
        controller.hotels.length,
        (index) => HotelItem(
          onTapFavorite: () {
            // setState(() {
            //   features[index]["is_favorited"] =
            //       !features[index]["is_favorited"];
            // });
          },
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (BuildContext context) =>
                    HotelDetailScreen(hotelModel: controller.hotels[index]),
              ),
            );
          },
          hotelModel: controller.hotels[index],
        ),
      ),
    );
  }
}

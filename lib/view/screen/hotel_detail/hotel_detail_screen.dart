import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:hba/controller/hotel_detail_controller.dart';
import 'package:hba/core/constant/color.dart';
import 'package:hba/data/model/hotel_model.dart';
import 'package:hba/view/screen/hotel_detail/widgets/carousel_slider.dart';

import '../../../core/class/handlingdataview.dart';
import '../../widget/home/recommend_item.dart';
import '../added/detail_page.dart';

class HotelDetailScreen extends StatefulWidget {
  const HotelDetailScreen({super.key, required this.hotelModel});
  final HotelModel hotelModel;

  @override
  State<HotelDetailScreen> createState() => _HotelDetailScreenState();
}

class _HotelDetailScreenState extends State<HotelDetailScreen> {
  @override
  void dispose() {
    // TODO: implement dispose
    Get.delete<HotelDetailControllerImp>();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Get.put(HotelDetailControllerImp(widget.hotelModel.hotelsId!));
    return Scaffold(
      appBar: AppBar(
        title: Text("hotelDetail".tr),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            CarouselSlider(
                imagesUrl: widget.hotelModel.imagesUrl!, isNetWork: true),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.grey.shade300,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    padding:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text((widget.hotelModel.rating! / 2).toString()),
                        const SizedBox(width: 8),
                        RatingBar.builder(
                          initialRating: widget.hotelModel.rating! / 2,
                          minRating: 1,
                          direction: Axis.horizontal,
                          allowHalfRating: true,
                          itemCount: 5,
                          itemBuilder: (context, _) => const Icon(
                            Icons.star,
                            color: AppColor.general,
                          ),
                          ignoreGestures: true,
                          itemSize: 15,
                          onRatingUpdate: (rating) {},
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.hotelModel.hotelsName!,
                              style: const TextStyle(
                                  fontSize: 30,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  height: 1),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              widget.hotelModel.address!,
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.grey[600],
                              ),
                            ),
                          ],
                        ),
                      ),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.network(
                          widget.hotelModel.hotelsImage!,
                          width: 50,
                          height: 50,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Text(
                    "overView".tr,
                    style: const TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    widget.hotelModel.description!,
                    textAlign: TextAlign.justify,
                    style: const TextStyle(fontSize: 16, color: Colors.black54),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "rooms".tr,
                    style: const TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        height: 1),
                  ),
                ],
              ),
            ),
            GetBuilder<HotelDetailControllerImp>(
              builder: (controller) {
                return HandlingDataView(
                  statusRequest: controller.statusRequest,
                  widget: controller.rooms.isNotEmpty
                      ? SingleChildScrollView(
                          padding: const EdgeInsets.fromLTRB(15, 5, 0, 5),
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: List.generate(
                              controller.rooms.length,
                              (index) => Padding(
                                padding: const EdgeInsets.only(right: 10),
                                child: RecommendItem(
                                  onTap: () => Get.to(() => DetailPage(
                                      room: controller.rooms[index])),
                                  room: controller.rooms[index],
                                ),
                              ),
                            ),
                          ),
                        )
                      : Center(
                          child: Text("noRoomsToRent".tr),
                        ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}

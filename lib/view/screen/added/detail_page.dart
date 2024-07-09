import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:hba/controller/room_detail_controller.dart';
import 'package:hba/core/constant/color.dart';
import 'package:hba/data/model/room_model.dart';
import 'package:hba/view/widget/bookRoom.dart';
import 'package:hba/view/widget/bookbutton.dart';

import '../../../core/class/handlingdataview.dart';
import '../../widget/paypal_checkout.dart';

class DetailPage extends StatefulWidget {
  final RoomsModel room;

  const DetailPage({
    Key? key,
    required this.room,
  }) : super(key: key);

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  void initState() {
    super.initState();
    Get.put(RoomDetailControllerImp(widget.room.hotelId!));
  }

  @override
  void dispose() {
    super.dispose();
    Get.delete<RoomDetailControllerImp>();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.background,
      extendBodyBehindAppBar: true,
      extendBody: true,
      appBar: AppBar(
        backgroundColor: Colors.black.withOpacity(0),
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          color: AppColor.general,
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: GetBuilder<RoomDetailControllerImp>(
        builder: (controller) {
          return controller.hotelModel != null
              ? HandlingDataView(
                  statusRequest: controller.statusRequest,
                  widget: Stack(
                    children: [
                      SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Stack(
                              children: [
                                CachedNetworkImage(
                                  imageUrl: widget.room.imageUrl!,
                                  fit: BoxFit.cover,
                                  height: 400,
                                  width: double.maxFinite,
                                ),
                                Positioned(
                                  bottom: 10,
                                  right: 10,
                                  child: Column(
                                    children: [
                                      Text(
                                        "roomNumber".tr,
                                        style:
                                            TextStyle(color: AppColor.general),
                                      ),
                                      Text(
                                        widget.room.roomNumber!,
                                        style: TextStyle(color: Colors.white),
                                      )
                                    ],
                                  ),
                                ),
                                Positioned(
                                  bottom: 0,
                                  left: 0,
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: AppColor.general,
                                      borderRadius: const BorderRadius.only(
                                        topRight: Radius.circular(16),
                                      ),
                                    ),
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 10, horizontal: 20),
                                    child: widget.room.withOffer!
                                        ? Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Text(
                                                widget.room.offer!.toString() +
                                                    "% OFF",
                                                style: const TextStyle(
                                                    fontSize: 20,
                                                    fontWeight: FontWeight.w600,
                                                    color: Colors.white,
                                                    height: 1),
                                              ),
                                              SizedBox(
                                                height: 10,
                                              ),
                                              Text(
                                                "${widget.room.price! - (widget.room.price! * widget.room.offer! / 100)}" +
                                                    "/" +
                                                    'night'.tr,
                                                style: TextStyle(
                                                    fontSize: 22,
                                                    fontWeight: FontWeight.w600,
                                                    color: Colors.white,
                                                    height: 1),
                                              ),
                                              SizedBox(
                                                height: 7,
                                              ),
                                              Text(
                                                widget.room.price.toString() +
                                                    "/" +
                                                    'night'.tr,
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    fontWeight: FontWeight.w600,
                                                    color: Colors.grey.shade300,
                                                    height: 1,
                                                    decoration: TextDecoration
                                                        .lineThrough),
                                                textAlign: TextAlign.center,
                                              ),
                                            ],
                                          )
                                        : Row(
                                            children: [
                                              Text(
                                                widget.room.price.toString(),
                                                style: const TextStyle(
                                                  fontSize: 20,
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              const Text(
                                                ' / ',
                                                style: TextStyle(
                                                  fontSize: 20,
                                                  color: Colors.white,
                                                ),
                                              ),
                                              Text(
                                                'night'.tr,
                                                style: TextStyle(
                                                  fontSize: 16,
                                                  color: Colors.white,
                                                ),
                                              ),
                                            ],
                                          ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 16),
                            Padding(
                              padding: const EdgeInsets.all(16),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 16, vertical: 8),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        // Text(apartment.rating!.toString()),
                                        const SizedBox(width: 8),
                                        RatingBar.builder(
                                          initialRating:
                                              widget.room.rating! / 2,
                                          minRating: 1,
                                          direction: Axis.horizontal,
                                          allowHalfRating: true,
                                          itemCount: 5,
                                          itemBuilder: (context, _) =>
                                              const Icon(
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
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              controller
                                                  .hotelModel!.hotelsName!,
                                              style: const TextStyle(
                                                  fontSize: 30,
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.bold,
                                                  height: 1),
                                            ),
                                            const SizedBox(height: 8),
                                            Text(
                                              controller.hotelModel!.address!,
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
                                        child: CachedNetworkImage(
                                          imageUrl: controller
                                              .hotelModel!.hotelsImage!,
                                          width: 50,
                                          height: 50,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 30),
                                  Text(
                                    controller.hotelModel!.description!,
                                    textAlign: TextAlign.justify,
                                    style: const TextStyle(
                                        fontSize: 16, color: Colors.black54),
                                  ),
                                  const SizedBox(height: 90),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Positioned(
                        left: 0,
                        right: 0,
                        bottom: 0,
                        child: BookButton(
                          onTap: () async {
                            //final res = await Get.to(() => PaypalPaymentDemo());
                            BookRoomDialog(room: widget.room)
                                .showDialog(context);
                          },
                        ),
                      )
                    ],
                  ),
                )
              : SizedBox();
        },
      ),
    );
  }
}

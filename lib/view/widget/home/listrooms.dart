import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:hba/controller/home/home_controller.dart';
import 'package:hba/core/constant/color.dart';
import 'package:hba/data/model/room_model.dart';
import 'package:hba/linkapi.dart';
import 'package:hba/view/widget/home/custom_image.dart';

class ListRoomsHome extends GetView<HomeControllerImp> {
  const ListRoomsHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 1050,
      child: ListView.builder(
        itemCount: controller.rooms.length,
        itemBuilder: (context, index) {
          return RoomItem(
            width: 1000,
            height: 325,
            //  onTap: (() {
            //             Navigator.push(
            //               context,
            //               MaterialPageRoute(
            //                 builder: (BuildContext context) =>
            //                     DetailPage(data: features[index]),
            //               ),
            //             );
            //           }),
            //            onTapFavorite: () {
            //             features[index]["is_favorited"] =
            //                 !features[index]["is_favorited"];
            //           },
            roomsModel: controller.rooms[index],
          );
        },
      ),
    );
  }
}

class RoomItem extends StatelessWidget {
  final RoomsModel roomsModel;
  final double width;
  final double height;
  final GestureTapCallback? onTapFavorite;
  final GestureTapCallback? onTap;

  const RoomItem({
    Key? key,
    this.width = 280,
    this.height = 325, //300
    this.onTap,
    this.onTapFavorite,
    required this.roomsModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width,
        height: height,
        padding: const EdgeInsets.all(10),
        margin: const EdgeInsets.symmetric(vertical: 5),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: AppColor.shadowColor.withOpacity(0.1),
              spreadRadius: 1,
              blurRadius: 1,
              offset: const Offset(1, 1), // changes position of shadow
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomImage(
              roomsModel.imageUrl!,
              width: double.infinity,
              height: 190,
              radius: 15,
            ),
            Container(
              width: width - 20,
              padding: const EdgeInsets.fromLTRB(5, 10, 5, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildName(),
                  const SizedBox(
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
      "${roomsModel.type}",
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      style: const TextStyle(
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
            Text(
              "${roomsModel.type}",
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                color: AppColor.labelColor,
                fontSize: 13,
              ),
            ),
            const SizedBox(
              height: 3,
            ),
            Text(
              "\$ ${roomsModel.price}",
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                color: AppColor.general,
                fontSize: 15,
                fontWeight: FontWeight.w600,
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

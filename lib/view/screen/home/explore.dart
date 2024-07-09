import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hba/controller/home/home_controller.dart';
import 'package:hba/data/model/room_model.dart';
import 'package:hba/view/screen/added/detail_page.dart';
import 'package:hba/view/widget/home/listhotels.dart';
import 'package:hba/core/class/handlingdataview.dart';
import 'package:hba/core/constant/color.dart';
import 'package:hba/view/widget/home/appbar.dart';
import 'package:hba/view/widget/home/recommend_item.dart';

class ExplorePage extends StatelessWidget {
  const ExplorePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(HomeControllerImp());
    return Scaffold(
      backgroundColor: AppColor.background,
      body: GetBuilder<HomeControllerImp>(
          builder: (controller) => HandlingDataView(
                statusRequest: controller.statusRequest,
                widget: CustomScrollView(
                  slivers: [
                    SliverAppBar(
                      backgroundColor: AppColor.appBarColor,
                      pinned: true,
                      snap: true,
                      floating: true,
                      title: Homebar(
                        icon: Icons.person_outline,
                        text: FirebaseAuth.instance.currentUser!.displayName ??
                            "", //display username
                      ),
                    ),
                    SliverToBoxAdapter(
                      child: _buildBody(controller.rooms),
                    ),
                  ],
                ),
              )),
    );
  }
}

_buildBody(List<RoomsModel> rooms) {
  return SingleChildScrollView(
    padding: const EdgeInsets.only(top: 5, bottom: 10),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(15, 0, 15, 5),
          child: Text(
            "findAndBook".tr,
            style: TextStyle(
              color: AppColor.labelColor,
              fontSize: 14,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(15, 0, 15, 10),
          child: Text(
            "theBestHotel".tr,
            style: TextStyle(
              color: AppColor.textColor,
              fontWeight: FontWeight.w600,
              fontSize: 22,
            ),
          ),
        ),
        const ListHotelsHome(),
        const SizedBox(
          height: 15,
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(15, 0, 15, 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "theBestRooms".tr,
                style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w500,
                    color: AppColor.textColor),
              ),
              SizedBox()
            ],
          ),
        ),
        //const ListRoomsHome()
        _getRecommend(rooms),
      ],
    ),
  );
}

_getRecommend(List<RoomsModel> rooms) {
  return SingleChildScrollView(
    padding: const EdgeInsets.fromLTRB(15, 5, 0, 5),
    scrollDirection: Axis.horizontal,
    child: Row(
      children: List.generate(
        rooms.length,
        (index) => Padding(
          padding: const EdgeInsets.only(right: 10),
          child: RecommendItem(
            onTap: () => Get.to(() => DetailPage(room: rooms[index])),
            room: rooms[index],
          ),
        ),
      ),
    ),
  );
}

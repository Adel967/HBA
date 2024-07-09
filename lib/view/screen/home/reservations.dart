import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
import 'package:hba/bloc/reservations/reservation_cubit.dart';
import 'package:hba/data/model/bookedRoom.dart';
import 'package:hba/view/widget/reservation_item.dart';

import '../../../core/constant/imageasset.dart';
import '../../../injection_container.dart';
import '../../widget/added/dataviewstatue.dart';
import '../../widget/home/appbar.dart';

class ReservationsScreen extends StatefulWidget {
  ReservationsScreen({super.key});

  @override
  State<ReservationsScreen> createState() => _ReservationsScreenState();
}

class _ReservationsScreenState extends State<ReservationsScreen> {
  final _reservationCubit = sl<ReservationCubit>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (!(_reservationCubit.state is ReservationLoaded)) {
      _reservationCubit.getReservations();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: Homebar(
              icon: Icons.newspaper,
              text: "reservations".tr, //display username
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Expanded(
            child: BlocBuilder<ReservationCubit, ReservationState>(
              bloc: _reservationCubit,
              builder: (context, state) {
                if (state is ReservationLoading) {
                  return DataViewStatue(
                    assetLottie: AppImageAsset.loading,
                    text: 'Loading...',
                  );
                } else if (state is ReservationError) {
                  return Center(child: Text(state.error));
                } else if (state is ReservationLoaded) {
                  return state.reservations.isNotEmpty
                      ? AnimationLimiter(
                          child: GridView.builder(
                              key: PageStorageKey("hotels"),
                              physics: const ScrollPhysics(),
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 2,
                                      crossAxisSpacing: 0,
                                      mainAxisSpacing: 0,
                                      mainAxisExtent: 300.0),
                              itemCount: state.reservations.length,
                              itemBuilder: (context, index) {
                                BookedRoom bookedRoom =
                                    state.reservations[index];
                                return AnimationConfiguration.staggeredGrid(
                                  position: index,
                                  columnCount: 2,
                                  duration: Duration(milliseconds: 500),
                                  child: SlideAnimation(
                                      delay: Duration(milliseconds: 275),
                                      child: ReservationItem(
                                        bookedRoom: bookedRoom,
                                      )),
                                );
                              }),
                        )
                      : Center(
                          child: Text("noReservations".tr),
                        );
                }
                return SizedBox();
              },
            ),
          ),
        ],
      )),
    );
  }
}

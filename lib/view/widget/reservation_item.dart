import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:hba/data/model/bookedRoom.dart';

import '../../bloc/reservations/reservation_cubit.dart';
import '../../injection_container.dart';
import 'custom_alert_dialog.dart';

class ReservationItem extends StatelessWidget {
  ReservationItem({super.key, required this.bookedRoom});
  final BookedRoom bookedRoom;
  final _reservationCubit = sl<ReservationCubit>();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 210,
      height: 200,
      child: Stack(
        alignment: Alignment.topCenter,
        children: <Widget>[
          Positioned(
            bottom: 0.0,
            child: IntrinsicWidth(
              child: Container(
                height: 170.0,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Padding(
                  padding: EdgeInsets.fromLTRB(10.0, 10, 10, 0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        bookedRoom.hotel!.hotelsName!,
                        style: TextStyle(
                          fontSize: 22.0,
                          fontWeight: FontWeight.w600,
                          letterSpacing: 1.2,
                        ),
                      ),
                      Text(
                        bookedRoom.room!.type!,
                        style: TextStyle(
                          color: Colors.grey,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '${bookedRoom.totalPrice} \$',
                            style: TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Text(
                            '${bookedRoom.nightsCount} ' + "nights".tr,
                            style: TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(),
                          Text(
                            '${bookedRoom.startDate.toString().substring(0, 10)}',
                            style: TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          SizedBox(),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    offset: Offset(0.0, 2.0),
                    blurRadius: 6.0,
                  ),
                ],
              ),
              child: Stack(
                children: [
                  ClipRRect(
                      borderRadius: BorderRadius.circular(20.0),
                      child: CachedNetworkImage(
                        imageUrl: bookedRoom.room!.imageUrl!,
                        height: 160.0,
                        width: 220.0,
                        fit: BoxFit.cover,
                      )),
                  Positioned(
                    top: 5,
                    right: 5,
                    child: Visibility(
                      visible:
                          bookedRoom.startDate!.compareTo(DateTime.now()) > 0,
                      child: IconButton(
                        icon: Icon(
                          Icons.close,
                          color: Colors.white,
                          size: 25,
                        ),
                        style:
                            IconButton.styleFrom(backgroundColor: Colors.red),
                        onPressed: () {
                          showDialog(
                              context: context,
                              builder: (context) {
                                return CustomAlertDialog(
                                    icon: Icon(
                                      Icons.warning,
                                      color: Colors.red,
                                      size: 50,
                                    ),
                                    function: () => _reservationCubit
                                        .cancelReservation(bookedRoom.id!),
                                    title:
                                        "Are you sure that you want to cancel the reservation!",
                                    content:
                                        "20% of the reservation price will be deducted!",
                                    buttonTitle: "ok".tr);
                              });
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

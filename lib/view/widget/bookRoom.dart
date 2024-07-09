import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:hba/bloc/book_room/book_room_cubit.dart';
import 'package:hba/core/enum.dart';
import 'package:hba/data/model/bookedRoom.dart';
import 'package:hba/data/model/room_model.dart';
import 'package:hba/view/widget/custom_alert_dialog.dart';
import 'package:hba/view/widget/paypal_checkout.dart';

import '../../bloc/reservations/reservation_cubit.dart';
import '../../core/constant/color.dart';
import '../../core/loaders/loading_overlay.dart';
import '../../core/utils.dart';
import '../../injection_container.dart';
import 'auth/customtextenteringauth.dart';

class BookRoomDialog {
  final RoomsModel room;

  BookRoomDialog({required this.room});

  void showDialog(BuildContext context) {
    showGeneralDialog(
      barrierLabel: "showGeneralDialog",
      barrierDismissible: true,
      barrierColor: Colors.black.withOpacity(0.6),
      transitionDuration: const Duration(milliseconds: 400),
      context: context,
      pageBuilder: (context, _, __) {
        return Align(
          alignment: Alignment.bottomCenter,
          child: DialogContent(
            room: room,
          ),
        );
      },
      transitionBuilder: (_, animation1, __, child) {
        return SlideTransition(
          position: Tween(
            begin: const Offset(0, 1),
            end: const Offset(0, 0),
          ).animate(animation1),
          child: child,
        );
      },
    );
  }
}

class DialogContent extends StatefulWidget {
  const DialogContent({super.key, required this.room});
  final RoomsModel room;

  @override
  State<DialogContent> createState() => _DialogContentState();
}

class _DialogContentState extends State<DialogContent> {
  int nightsCount = 1;
  TextEditingController _startDate = TextEditingController();
  late DateTime _startDateTime;
  GlobalKey<FormState> formKey = GlobalKey();

  final _bookRoomCubit = sl<BookRoomCubit>();
  final _reservationCubit = sl<ReservationCubit>();

  book() async {
    if (formKey.currentState != null && formKey.currentState!.validate()) {
      BookedRoom bookedRoom = BookedRoom(
          hotelId: widget.room.hotelId,
          roomId: widget.room.id,
          nightsCount: nightsCount,
          totalPrice: nightsCount * widget.room.price!,
          startDate: _startDateTime,
          bookedDate: DateTime.now());
      if (await _bookRoomCubit.checkIfRoomAvailable(bookedRoom)) {
        await Future.delayed(Duration(milliseconds: 200));
        final res = await Get.to<PaymentStatus>(() => PaypalPaymentDemo(
              item: {
                "name": widget.room.type.toString(),
                "quantity": nightsCount,
                "price": widget.room.withOffer != null && widget.room.withOffer!
                    ? (widget.room.price! -
                            (widget.room.price! * widget.room.offer! / 100))
                        .floor()
                    : widget.room.price.toString(),
                "currency": "USD"
              },
              total: widget.room.withOffer != null && widget.room.withOffer!
                  ? (nightsCount *
                      (widget.room.price! -
                              (widget.room.price! * widget.room.offer! / 100))
                          .floor())
                  : (nightsCount * widget.room.price!),
            ));
        if (res != null) {
          if (res == PaymentStatus.SUCCESS) {
            _bookRoomCubit.bookRoom(bookedRoom);
          } else if (res == PaymentStatus.ERROR) {
            showDialog(
                context: context,
                builder: (context) {
                  return CustomAlertDialog(
                      icon: Icon(
                        Icons.error,
                        color: Colors.red,
                        size: 50,
                      ),
                      title: "error".tr,
                      content: "errorInPaymentProcess".tr,
                      buttonTitle: "ok".tr);
                });
          } else {
            print("canceled");
          }
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<BookRoomCubit, BookRoomState>(
      bloc: _bookRoomCubit,
      listener: (context, state) {
        print(state);
        if (state is BookRoomLoading) {
          LoadingOverlay.of(context).show();
        } else if (state is BookRoomChecked) {
          LoadingOverlay.of(context).hide();
        } else if (state is BookRoomLoaded) {
          LoadingOverlay.of(context).hide();
          if ((_reservationCubit.state is ReservationLoaded)) {
            _reservationCubit.getReservations();
          }
          LoadingOverlay.of(context).hide();

          showDialog(
              context: context,
              builder: (context) {
                return CustomAlertDialog(
                    icon: Icon(
                      Icons.check_circle,
                      color: Colors.green,
                      size: 50,
                    ),
                    title: "success".tr,
                    content: "bookingRoomSuccess".tr,
                    buttonTitle: "ok".tr);
              });
        } else if (state is BookRoomError) {
          LoadingOverlay.of(context).hide();
          Navigator.of(context).pop();

          showDialog(
              context: context,
              builder: (context) {
                return CustomAlertDialog(
                    icon: Icon(
                      Icons.error,
                      color: Colors.red,
                      size: 50,
                    ),
                    title: "error".tr,
                    content: state.error,
                    buttonTitle: "ok".tr);
              });
        }
      },
      child: Container(
        margin: MediaQuery.of(context).viewInsets,
        width: double.maxFinite,
        clipBehavior: Clip.antiAlias,
        padding: const EdgeInsets.fromLTRB(16, 10, 16, 0),
        decoration: BoxDecoration(
          color: Colors.grey.shade300,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(14),
            topRight: Radius.circular(14),
          ),
        ),
        child: Material(
          color: Colors.grey.shade300,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "bookThisRoom".tr,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                ),
                const SizedBox(height: 20),
                Form(
                  key: formKey,
                  child: CustomEnteringTextAuth(
                    isNumber: true,
                    valid: (val) {
                      if (val!.isEmpty) {
                        return "51".tr;
                      }
                    },
                    labeltext: "reservationDate".tr,
                    hinttext: "50".tr,
                    readOnly: true,
                    onTapTextField: () => selectDate(),
                    icon: Icons.date_range,
                    mycontroller: _startDate,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      onPressed: () {
                        if (nightsCount > 1) {
                          nightsCount--;
                          setState(() {});
                        }
                      },
                      icon: Icon(
                        Icons.remove,
                        color: Colors.white,
                      ),
                      style: IconButton.styleFrom(
                          backgroundColor: AppColor.general),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      "${nightsCount} " + "nights".tr,
                      style: TextStyle(fontSize: 18),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    IconButton(
                      onPressed: () {
                        if (nightsCount < 10) {
                          nightsCount++;
                          setState(() {});
                        }
                      },
                      icon: Icon(
                        Icons.add,
                        color: Colors.white,
                      ),
                      style: IconButton.styleFrom(
                        backgroundColor: AppColor.general,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Row(
                  children: [
                    Expanded(
                      child: SizedBox(),
                    ),
                    Text(
                      "totalPrice".tr +
                          ":" +
                          "${widget.room.withOffer != null && widget.room.withOffer! ? (nightsCount * (widget.room.price! - (widget.room.price! * widget.room.offer! / 100)).floor()) : (nightsCount * widget.room.price!)}\$",
                      style: TextStyle(fontSize: 18),
                    ),
                    Expanded(
                      child: GestureDetector(
                        onTap: () => book(),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              "payNow".tr,
                              style: TextStyle(
                                  color: AppColor.general, fontSize: 16),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Icon(
                              Icons.arrow_forward,
                              color: AppColor.general,
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 5),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> selectDate() async {
    final now = DateTime.now();

    DateTime? picked = await showDatePicker(
        context: context,
        firstDate: DateTime.now(),
        lastDate: DateTime(DateTime.now().year + 1),
        initialDate: DateTime(now.year, now.month, now.day + 1));

    if (picked != null) {
      _startDateTime = picked;
      _startDate.text = picked.toString().split(" ")[0];
    }
  }
}

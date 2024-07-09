import 'package:flutter/material.dart';
import 'package:hba/core/class/statusrequest.dart';
import 'package:hba/core/constant/imageasset.dart';
import 'package:hba/view/widget/added/dataviewstatue.dart';
import 'package:lottie/lottie.dart';

class HandlingDataView extends StatelessWidget {
  final StatusRequest statusRequest;
  final Widget widget;
  const HandlingDataView(
      {super.key, required this.statusRequest, required this.widget});

  @override
  Widget build(BuildContext context) {
    return statusRequest == StatusRequest.loading
        ? const Center(
            child: DataViewStatue(assetLottie: AppImageAsset.loading, text: 'Loading...',),
          )
        : statusRequest == StatusRequest.offlinefailure
            ? const DataViewStatue(
                assetLottie: AppImageAsset.offline,
                text: "You're Offline Please Check \n Wifi Network",
              )
            : statusRequest == StatusRequest.serverfailure
                ? Center(
                    child: Lottie.asset(AppImageAsset.serverfail,
                        width: 350, height: 350))
                : statusRequest == StatusRequest.failure
                    ? const Center(
                        child:
                            DataViewStatue(assetLottie: AppImageAsset.nodata, text: '',),
                      )
                    : widget;
  }
}

class HandlingDataViewRequest extends StatelessWidget {
  final StatusRequest statusRequest;
  final Widget widget;
  const HandlingDataViewRequest(
      {super.key, required this.statusRequest, required this.widget});

  @override
  Widget build(BuildContext context) {
    return statusRequest == StatusRequest.loading
        ? const Center(
            child: DataViewStatue(assetLottie: AppImageAsset.loading, text: 'Loading...',),
          )
        : statusRequest == StatusRequest.offlinefailure
            ? const DataViewStatue(
                assetLottie: AppImageAsset.offline,
                text: "You're Offline Please Check \n Wifi Network",
              )
            : statusRequest == StatusRequest.serverfailure
                ? Center(
                    child: Lottie.asset(AppImageAsset.serverfail,
                        width: 350, height: 350))
                    : widget;
  }
}

import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:hba/core/constant/color.dart';
import 'package:hba/core/constants.dart';
import 'package:hba/core/enum.dart';
import 'package:hba/data/datasource/static/data.dart';
import 'package:hba/view/screen/home/filters/search_filter_cubit.dart';
import 'package:hba/view/screen/home/filters/search_filter_state.dart';
import '../../../../data/params/search_params.dart';
import '../../../../injection_container.dart';
import '../../../widget/custom_dropdown.dart';
import '../../../widget/heading_widget.dart';

class FilterSearchScreen extends StatefulWidget {
  const FilterSearchScreen({super.key});

  @override
  State<FilterSearchScreen> createState() => _FilterSearchScreenState();
}

class _FilterSearchScreenState extends State<FilterSearchScreen> {
  final _showFilterCubit = sl<SearchFilterCubit>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print(_showFilterCubit.state.filterType);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("filters".tr),
      ),
      body: BlocBuilder<SearchFilterCubit, SearchFilterState>(
        bloc: _showFilterCubit,
        builder: (context, state) {
          print(state.filterType);
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          _showFilterCubit
                              .onChangeFilterType(FilterType.HOTELS);
                        },
                        child: Text("hotels".tr,
                            style: TextStyle(
                                color: state.filterType == FilterType.HOTELS
                                    ? Colors.white
                                    : Colors.black)),
                        style: ElevatedButton.styleFrom(
                            backgroundColor:
                                state.filterType == FilterType.HOTELS
                                    ? AppColor.general
                                    : Colors.white70),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: ElevatedButton(
                          onPressed: () {
                            _showFilterCubit
                                .onChangeFilterType(FilterType.ROOMS);
                          },
                          child: Text(
                            "rooms".tr,
                            style: TextStyle(
                                color: state.filterType == FilterType.ROOMS
                                    ? Colors.white
                                    : Colors.black),
                          ),
                          style: ElevatedButton.styleFrom(
                              backgroundColor:
                                  state.filterType == FilterType.ROOMS
                                      ? AppColor.general
                                      : Colors.white70)),
                    )
                  ],
                ),
                HeadingWidget(
                  title: "city".tr,
                  padding: 20,
                  textStyle:
                      TextStyle(fontWeight: FontWeight.w500, fontSize: 21),
                  child: CustomDropDown<String>(
                    hintText: "chooseCity".tr,
                    verticalDropdownPadding: 15,
                    dropDownItems: Constants.cities.map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(
                          value,
                        ),
                      );
                    }).toList(),
                    selectedValue: state.city,
                    onChanged: (value) {
                      _showFilterCubit.onChangeFilterData(city: value);
                    },
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Visibility(
                    visible: state.filterType == FilterType.ROOMS,
                    child: Column(
                      children: [
                        HeadingWidget(
                          title: "roomType".tr,
                          padding: 20,
                          textStyle: TextStyle(
                              fontWeight: FontWeight.w500, fontSize: 21),
                          child: CustomDropDown<String>(
                            hintText: "chooseType".tr,
                            verticalDropdownPadding: 15,
                            dropDownItems:
                                Constants.categories.map((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(
                                  value.toString(),
                                ),
                              );
                            }).toList(),
                            selectedValue: state.roomType,
                            onChanged: (value) {
                              _showFilterCubit.onChangeFilterData(
                                  roomType: value);
                            },
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        HeadingWidget(
                            title: "price".tr,
                            padding: 20,
                            textStyle: TextStyle(
                                fontWeight: FontWeight.w500, fontSize: 21),
                            child: Center(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    "${(state.startPrice).floor()}\$ - ${(state.endPrice).floor()}\$",
                                    style: TextStyle(fontSize: 16),
                                  ),
                                  SliderTheme(
                                    data: SliderThemeData(
                                        inactiveTickMarkColor:
                                            Colors.transparent,
                                        activeTickMarkColor: Colors.transparent,
                                        showValueIndicator:
                                            ShowValueIndicator.always),
                                    child: RangeSlider(
                                      min: 0,
                                      max: 1000,
                                      values: RangeValues(
                                          state.startPrice.toDouble(),
                                          state.endPrice.toDouble()),
                                      labels: RangeLabels(
                                          "${(state.startPrice).floor()} \$",
                                          "${(state.endPrice).floor()} \$"),
                                      divisions: 50,
                                      onChanged: (RangeValues value) {
                                        if (value.start == value.end) {
                                          return;
                                        }
                                        _showFilterCubit.onChangeFilterData(
                                            startPrice: value.start.floor(),
                                            endPrice: value.end.floor());
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            )),
                      ],
                    )),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Expanded(
                        child: ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pop(SearchParams(
                            filterType: state.filterType,
                            city: state.city,
                            roomType: state.roomType,
                            startPrice: isPriceRequired(
                                    state.startPrice, state.endPrice)
                                ? state.startPrice
                                : null,
                            endPrice: isPriceRequired(
                                    state.startPrice, state.endPrice)
                                ? state.endPrice
                                : null));
                      },
                      child: Text(
                        "save".tr,
                        style: TextStyle(color: Colors.white),
                      ),
                      style: ElevatedButton.styleFrom(
                          backgroundColor: AppColor.green),
                    )),
                    SizedBox(
                      width: 20,
                    ),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          _showFilterCubit.resetFilterData();
                        },
                        child: Text(
                          "reset".tr,
                          style: TextStyle(color: Colors.white),
                        ),
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.red),
                      ),
                    )
                  ],
                )
              ],
            ),
          );
        },
      ),
    );
  }

  bool isPriceRequired(int start, end) {
    if (start == 0 && end == 1000) {
      return false;
    }
    return true;
  }
}

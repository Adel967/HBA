// ignore_for_file: prefer_const_constructors
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:hba/bloc/search/search_cubit.dart';
import 'package:hba/core/constant/color.dart';
import 'package:hba/core/localization/changelocal.dart';
import 'package:hba/data/model/hotel_model.dart';
import 'package:hba/data/model/room_model.dart';
import 'package:hba/view/screen/added/detail_page.dart';
import 'package:hba/view/screen/home/filters/filter_screen.dart';
import 'package:hba/view/widget/room_item.dart';
import '../../../core/constant/imageasset.dart';
import '../../../core/utils/debouncer.dart';
import '../../../data/params/search_params.dart';
import '../../../injection_container.dart';
import '../../widget/added/dataviewstatue.dart';
import '../../widget/hotel_item.dart';
import '../hotel_detail/hotel_detail_screen.dart';

class SearchPage extends StatefulWidget {
  SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  TextEditingController _titleController = TextEditingController();
  final _searchCubit = sl<SearchCubit>();
  String lastSearch = '';

  final _searchDelayer = Debouncer();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print(_searchCubit.state);
    if (!(_searchCubit.state is HotelsLoaded) &&
        !(_searchCubit.state is RoomsLoaded)) {
      print("Load");
      _searchCubit.search();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.background,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: <Widget>[
              // SearchBar(),
              //CustomSearchBar(),
              Container(
                height: 50,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Expanded(
                      child: TextField(
                        controller: _titleController,
                        maxLines: 1,
                        textDirection: sl<LocaleController>().language != null
                            ? sl<LocaleController>().language!.languageCode !=
                                    'ar'
                                ? TextDirection.ltr
                                : TextDirection.rtl
                            : TextDirection.ltr,
                        textAlign: sl<LocaleController>().language != null
                            ? sl<LocaleController>().language!.languageCode !=
                                    'ar'
                                ? TextAlign.left
                                : TextAlign.right
                            : TextAlign.left,
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 0, horizontal: 30),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          suffixIcon: InkWell(
                            onTap: () {},
                            child: const Icon(
                              Icons.search,
                              color: AppColor.general,
                            ),
                          ),
                          hintText: "search".tr,
                          hintStyle:
                              TextStyle(fontSize: 14, color: AppColor.general),
                        ),
                        onChanged: (value) {
                          if (value != lastSearch) {
                            lastSearch = value;
                            _searchDelayer.run(() {
                              _searchCubit.searchParams.title = value.trim();
                              _searchCubit.search();
                            });
                          }
                        },
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    GestureDetector(
                      onTap: () async {
                        final res = await Navigator.of(context).push(
                            MaterialPageRoute(
                                builder: (_) => FilterSearchScreen()));
                        if (res != null && res is SearchParams) {
                          res.title = _titleController.text;
                          _searchCubit.searchParams = res;
                          _searchCubit.search();
                        }
                      },
                      child: Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(color: Colors.black87)),
                        child: Center(
                          child: SvgPicture.asset(
                            AppImageAsset.filter,
                            width: 25,
                            height: 25,
                            colorFilter: ColorFilter.mode(
                                AppColor.general, BlendMode.srcIn),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Expanded(
                child: BlocBuilder<SearchCubit, SearchState>(
                  bloc: _searchCubit,
                  builder: (context, state) {
                    if (state is SearchLoading) {
                      return DataViewStatue(
                        assetLottie: AppImageAsset.loading,
                        text: 'Loading...',
                      );
                    } else if (state is SearchError) {
                      return Center(child: Text(state.error));
                    }
                    if (state is RoomsLoaded) {
                      return state.rooms.isNotEmpty
                          ? AnimationLimiter(
                              child: GridView.builder(
                                  key: PageStorageKey("rooms"),
                                  physics: const ScrollPhysics(),
                                  gridDelegate:
                                      SliverGridDelegateWithFixedCrossAxisCount(
                                          crossAxisCount: 2,
                                          crossAxisSpacing: 7,
                                          mainAxisSpacing: 7,
                                          mainAxisExtent: 320.0),
                                  itemCount: state.rooms.length,
                                  itemBuilder: (context, index) {
                                    RoomsModel room = state.rooms[index];
                                    return AnimationConfiguration.staggeredGrid(
                                      position: index,
                                      columnCount: 2,
                                      duration: Duration(milliseconds: 500),
                                      child: SlideAnimation(
                                          delay: Duration(milliseconds: 275),
                                          child: RoomItem(
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
                                                  builder: (BuildContext
                                                          context) =>
                                                      DetailPage(room: room),
                                                ),
                                              );
                                            },
                                            room: room,
                                          )),
                                    );
                                  }),
                            )
                          : Center(
                              child: Text("noRoomsWithThisFilter".tr),
                            );
                    }
                    if (state is HotelsLoaded) {
                      return state.hotels.isNotEmpty
                          ? AnimationLimiter(
                              child: GridView.builder(
                                  key: PageStorageKey("hotels"),
                                  physics: const ScrollPhysics(),
                                  gridDelegate:
                                      SliverGridDelegateWithFixedCrossAxisCount(
                                          crossAxisCount: 2,
                                          crossAxisSpacing: 7,
                                          mainAxisSpacing: 7,
                                          mainAxisExtent: 320.0),
                                  itemCount: state.hotels.length,
                                  itemBuilder: (context, index) {
                                    HotelModel hotel = state.hotels[index];
                                    return AnimationConfiguration.staggeredGrid(
                                      position: index,
                                      columnCount: 2,
                                      duration: Duration(milliseconds: 500),
                                      child: SlideAnimation(
                                          delay: Duration(milliseconds: 275),
                                          child: HotelItem(
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
                                                  builder: (BuildContext
                                                          context) =>
                                                      HotelDetailScreen(
                                                          hotelModel: state
                                                              .hotels[index]),
                                                ),
                                              );
                                            },
                                            hotelModel: state.hotels[index],
                                          )),
                                    );
                                  }),
                            )
                          : Center(child: Text("noHotelsWithThisFilter".tr));
                    }
                    return SizedBox();
                  },
                ),
              ),
              //ListRoomsHome(),
            ],
          ),
        ),
      ),
    );
  }
}

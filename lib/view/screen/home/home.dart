import 'package:flutter/material.dart';
import 'package:hba/view/screen/home/reservations.dart';
import 'package:hba/view/screen/home/searchpage.dart';
import 'package:hba/view/screen/home/explore.dart';
import 'package:hba/view/widget/home/bottombar_item.dart';
import 'package:hba/core/constant/color.dart';
import 'package:hba/view/screen/home/settingpage.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  int _activeTabIndex = 0;
  final List _barItems = [
    {
      "icon": "assets/icons/home.svg",
      "page": const ExplorePage(),
    },
    {
      "icon": "assets/icons/search.svg",
      "page": SearchPage(),
    },
    {
      "icon": "assets/icons/orders.svg",
      "page": ReservationsScreen(),
    },
    {
      "icon": "assets/icons/setting.svg",
      "page": const SettingPage(),
    },
  ];

//====== set animation=====
  late final AnimationController _controller = AnimationController(
    duration: const Duration(milliseconds: 500),
    vsync: this,
  );
  late final Animation<double> _animation = CurvedAnimation(
    parent: _controller,
    curve: Curves.fastOutSlowIn,
  );

  @override
  void initState() {
    super.initState();
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.stop();
    _controller.dispose();
    super.dispose();
  }

  _buildAnimatedPage(page) {
    return FadeTransition(child: page, opacity: _animation);
  }

  void onPageChanged(int index) {
    if (index == _activeTabIndex) return;
    _controller.reset();
    setState(() {
      _activeTabIndex = index;
    });
    _controller.forward();
  }

//====== end set animation=====

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.background,
      bottomNavigationBar: _buildBottomBar(),
      body: _buildAnimatedPage(_barItems[_activeTabIndex]["page"]),
    );
  }

  // Widget _buildPage() {
  //   return IndexedStack(
  //     index: _activeTabIndex,
  //     children: List.generate(
  //       _barItems.length,
  //       (index) => ,
  //     ),
  //   );
  // }

  Widget _buildBottomBar() {
    return Container(
      height: 75,
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColor.bottomBarColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(25),
          topRight: Radius.circular(25),
        ),
        boxShadow: [
          BoxShadow(
            color: AppColor.shadowColor.withOpacity(0.1),
            blurRadius: 1,
            spreadRadius: 1,
            offset: Offset(0, 1),
          )
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.only(
          left: 25,
          right: 25,
          bottom: 15,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(
            _barItems.length,
            (index) => BottomBarItem(
              _barItems[index]["icon"],
              isActive: _activeTabIndex == index,
              activeColor: AppColor.general,
              onTap: () => onPageChanged(index),
            ),
          ),
        ),
      ),
    );
  }
}

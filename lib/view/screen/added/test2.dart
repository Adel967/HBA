// import 'package:carousel_slider/carousel_slider.dart';
// import 'package:flutter/material.dart';
// import 'package:hba/data/datasource/static/data.dart';
// import 'package:hba/view/screen/added/detail_page.dart';
// import 'package:hba/view/widget/home/appbar.dart';
// import 'package:hba/view/widget/home/city_item.dart';
// import 'package:hba/view/widget/home/feature_item.dart';
// import 'package:hba/view/widget/home/recommend_item.dart';
// import 'package:hba/core/constant/color.dart';

// class test_page extends StatefulWidget {
//   const test_page({Key? key}) : super(key: key);

//   @override
//   State<test_page> createState() => _ExplorePageState();
// }

// class _ExplorePageState extends State<test_page> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
      
//       body: CustomScrollView(
//         slivers: [
//           const SliverAppBar(
//             backgroundColor: AppColor.appBarColor,
//             pinned: true,
//             snap: true,
//             floating: true,
//             title: Homebar(
//               icon: Icons.person_outline,
//               text: "Ibrahim",
//             ),
//           ),
//           SliverToBoxAdapter(
//             child: _buildBody(),
//           ),
//         ],
//       ),
//     );
//   }

//   _buildBody() {
//     return SingleChildScrollView(
//       padding: const EdgeInsets.only(top: 5, bottom: 10),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Padding(
//             padding: const EdgeInsets.fromLTRB(15, 0, 15, 5),
//             child: Text(
//               "Find and Book",
//               style: TextStyle(
//                 color: AppColor.labelColor,
//                 fontSize: 14,
//               ),
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.fromLTRB(15, 0, 15, 10),
//             child: Text(
//               "The Best Hotel Rooms",
//               style: TextStyle(
//                 color: AppColor.textColor,
//                 fontWeight: FontWeight.w600,
//                 fontSize: 22,
//               ),
//             ),
//           ),
//           _buildCities(),
//           const SizedBox(
//             height: 10,
//           ),
//           Padding(
//             padding: const EdgeInsets.fromLTRB(15, 0, 15, 10),
//             child: Text(
//               "Featured",
//               style: TextStyle(
//                 color: AppColor.textColor,
//                 fontWeight: FontWeight.w500,
//                 fontSize: 22,
//               ),
//             ),
//           ),
//           _buildFeatured(),
//           const SizedBox(
//             height: 15,
//           ),
//           Padding(
//             padding: EdgeInsets.fromLTRB(15, 0, 15, 10),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Text(
//                   "Recommended",
//                   style: TextStyle(
//                       fontSize: 22,
//                       fontWeight: FontWeight.w500,
//                       color: AppColor.textColor),
//                 ),
//                 Text(
//                   "See all",
//                   style: TextStyle(fontSize: 14, color: AppColor.darker),
//                 ),
//               ],
//             ),
//           ),
//           _getRecommend(),
//         ],
//       ),
//     );
//   }

//   _buildFeatured() {
//     return CarouselSlider(
//       options: CarouselOptions(
//         height: 335, //300
//         enlargeCenterPage: true,
//         disableCenter: true,
//         viewportFraction: .75,
//       ),
//       items: List.generate(
//         features.length,
//         (index) => HamdiItem(
//           data: features[index],
//           onTapFavorite: () {
//             setState(() {
//               features[index]["is_favorited"] =
//                   !features[index]["is_favorited"];
//             });
//           },
//           onTap: () {
//             Navigator.push(
//               context,
//               MaterialPageRoute(
//                 builder: (BuildContext context) =>
//                     DetailPage(data: features[index]),
//               ),
//             );
//           },
//         ),
//       ),
//     );
//   }

//   _getRecommend() {
//     return SingleChildScrollView(
//       padding: EdgeInsets.fromLTRB(15, 5, 0, 5),
//       scrollDirection: Axis.horizontal,
//       child: Row(
//         children: List.generate(
//           recommends.length,
//           (index) => Padding(
//             padding: const EdgeInsets.only(right: 10),
//             child: RecommendItem(
//               data: recommends[index],
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   _buildCities() {
//     return SingleChildScrollView(
//       padding: EdgeInsets.fromLTRB(15, 5, 0, 10),
//       scrollDirection: Axis.horizontal,
//       child: Row(
//         children: List.generate(
//           cities.length,
//           (index) => Padding(
//             padding: const EdgeInsets.only(right: 8),
//             child: CityItem(
//               data: cities[index],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

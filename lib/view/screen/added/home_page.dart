import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:hba/data/model/apartment.dart';
import 'package:hba/data/model/user.dart';
import 'package:hba/view/screen/added/detail_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.fromLTRB(16, 30, 16, 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Explore',
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Icon(Icons.search, size: 30),
                  ],
                ),
              ),

              const SizedBox(height: 10),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  'Top Hotels',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black54,
                  ),
                ),
              ),
              const SizedBox(height: 16),
              users(),
              const SizedBox(height: 30),

              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  'Recommended ',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black54,
                  ),
                ),
              ),
              const SizedBox(height: 12),
              apartmentTop(),
              //apartmentNear(),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }

  Widget apartmentTop() {
    return SizedBox(
      height: 220,
      child: ListView.builder(
        itemCount: listApartmentTop.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          Apartment apartment = listApartmentTop[index];
          return GestureDetector(
            onTap: () {
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(
              //     builder: (BuildContext context) =>
              //         DetailPage(room: apartment,),
              //   ),
              // );
            },
            child: Container(
              width: 300,
              margin: EdgeInsets.fromLTRB(
                index == 0 ? 16 : 8,
                0,
                index == listApartmentTop.length - 1 ? 16 : 8,
                0,
              ),
              child: Column(
                children: [
                  Expanded(
                    child: Stack(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(16),
                          child: Image.asset(
                            apartment.image!,
                            fit: BoxFit.cover,
                            width: double.maxFinite,
                          ),
                        ),
                        Positioned(
                          top: 16,
                          left: 16,
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.grey.withOpacity(0.8),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 16, vertical: 4),
                            child: Text(
                              apartment.type!,
                              style: const TextStyle(
                                  fontSize: 16, color: Colors.white),
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: 0,
                          right: 0,
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.blue[900],
                              borderRadius: const BorderRadius.only(
                                bottomRight: Radius.circular(16),
                                topLeft: Radius.circular(16),
                              ),
                            ),
                            padding: const EdgeInsets.symmetric(
                                vertical: 10, horizontal: 20),
                            child: Text(
                              '\$ ${apartment.price!}',
                              style: const TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        apartment.title!,
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Spacer(),
                      Text(
                        apartment.users!.toString(),
                        style: TextStyle(fontSize: 16, color: Colors.grey[700]),
                      ),
                      Icon(Icons.favorite, size: 18, color: Colors.grey[700]),
                      // RatingBar.builder(
                      //   initialRating: apartment.rating!,
                      //   minRating: 1,
                      //   direction: Axis.horizontal,
                      //   allowHalfRating: true,
                      //   itemCount: 5,
                      //   itemBuilder: (context, _) => const Icon(
                      //     Icons.star,
                      //     color: Colors.blue,
                      //   ),
                      //   ignoreGestures: true,
                      //   itemSize: 15,
                      //   onRatingUpdate: (rating) {},
                      // ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        apartment.location!.split(', ').first,
                        style: TextStyle(fontSize: 18, color: Colors.grey[700]),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget users() {
    return SizedBox(
      height: 150,
      child: ListView.builder(
        itemCount: listUser.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          User user = listUser[index];
          return Container(
            width: 150,
            margin: EdgeInsets.fromLTRB(
              index == 0 ? 16 : 8,
              0,
              index == listUser.length - 1 ? 16 : 8,
              0,
            ),
            decoration: BoxDecoration(
              color: Colors.blue[900],
              borderRadius: BorderRadius.circular(16),
            ),
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset(
                      user.image!,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                RatingBar.builder(
                  initialRating: user.rating!.toDouble(),
                  minRating: 1,
                  direction: Axis.horizontal,
                  allowHalfRating: true,
                  itemCount: 5,
                  itemBuilder: (context, _) => const Icon(
                    Icons.star,
                    color: Colors.blue,
                  ),
                  ignoreGestures: true,
                  itemSize: 13,
                  onRatingUpdate: (rating) {},
                ),
                const SizedBox(height: 8),
                Text(
                  user.name!,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '${user.offer!} reviews',
                      style: const TextStyle(
                        fontWeight: FontWeight.w300,
                        color: Colors.white60,
                      ),
                    ),
                    const Icon(
                      Icons.arrow_forward_rounded,
                      color: Colors.blue,
                      size: 20,
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget apartmentNear() {
    return SizedBox(
      height: 180,
      child: ListView.builder(
        itemCount: listApartmentNear.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          Apartment apartment = listApartmentNear[index];
          return GestureDetector(
            onTap: () {
              // Get.to(() => DetailPage(room: apartment,));
            },
            child: Container(
              width: 300,
              margin: EdgeInsets.fromLTRB(
                index == 0 ? 16 : 8,
                0,
                index == listApartmentNear.length - 1 ? 16 : 8,
                0,
              ),
              child: Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: Image.asset(
                      apartment.image!,
                      fit: BoxFit.cover,
                      width: double.maxFinite,
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Container(
                      decoration: const BoxDecoration(
                        color: Color(0xFF003580),
                        borderRadius: BorderRadius.only(
                          bottomRight: Radius.circular(16),
                          topLeft: Radius.circular(16),
                        ),
                      ),
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 20),
                      child: Text(
                        '\$ ${apartment.price!}',
                        style: const TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

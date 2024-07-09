import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AboutUsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            expandedHeight: 250.0,
            floating: false,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              title: Text("About Us"),
              background: Image.network(
                'https://cdn.britannica.com/96/115096-050-5AFDAF5D/Bellagio-Hotel-Casino-Las-Vegas.jpg', // Replace with a relevant image URL
                fit: BoxFit.cover,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "Welcome to Our Hotel Booking App",
                    style:
                        TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 16.0),
                  Text(
                    "Our hotel booking app offers you the best deals and a seamless booking experience. We provide a wide range of options to cater to your needs and preferences, ensuring a comfortable and memorable stay.",
                    style: TextStyle(fontSize: 16.0),
                  ),
                  SizedBox(height: 16.0),
                  Divider(),
                  SizedBox(height: 16.0),
                  Text(
                    "Our Features",
                    style:
                        TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8.0),
                  FeatureTile(
                    icon: Icons.hotel,
                    title: "Wide Range of Hotels",
                    description: "Choose from a variety of hotels worldwide.",
                  ),
                  FeatureTile(
                    icon: Icons.price_check,
                    title: "Best Price Guarantee",
                    description: "We offer the best prices for your stay.",
                  ),
                  FeatureTile(
                    icon: Icons.support,
                    title: "24/7 Customer Support",
                    description:
                        "Our support team is available round the clock.",
                  ),
                  FeatureTile(
                    icon: Icons.security,
                    title: "Secure Payments",
                    description: "Your transactions are safe with us.",
                  ),
                  SizedBox(height: 16.0),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class FeatureTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final String description;

  FeatureTile({
    required this.icon,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: Icon(icon, size: 40.0, color: Colors.blue),
      title: Text(title,
          style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold)),
      subtitle: Text(description, style: TextStyle(fontSize: 16.0)),
    );
  }
}

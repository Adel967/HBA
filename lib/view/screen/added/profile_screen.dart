import 'package:get/get.dart';
import 'package:hba/controller/settings_controller.dart';
import 'package:hba/view/widget/added/profile_menu.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SettingsController controller = Get.put(SettingsController());
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 30,
                ),
                Stack(
                  children: [
                    SizedBox(
                      width: 120,
                      height: 120,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child: const Image(
                          image: AssetImage('assets/images/user1.png'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: Container(
                        width: 35,
                        height: 35,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          color: const Color(0xFF003580),
                        ),
                        child: const Icon(
                          Icons.edit,
                          color: Colors.white,
                          size: 20,
                        ),
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text('USER'),
                const Text('someone@example.com'),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  width: 200,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF003580)),
                    child: const Text('Edit Profile'),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                const Divider(),
                const SizedBox(
                  height: 10,
                ),
                ProfileMenuWidget(
                  title: "Settings",
                  icon: Icons.settings_applications,
                  onPress: () {},
                ),
                ProfileMenuWidget(
                  title: "Credit",
                  icon: Icons.person_pin,
                  onPress: () {},
                ),
                ProfileMenuWidget(
                  title: "Booked",
                  icon: Icons.info_outline_rounded,
                  onPress: () {},
                ),
                const Divider(),
                const SizedBox(
                  height: 10,
                ),
                ProfileMenuWidget(
                  title: "Logout",
                  icon: Icons.logout_outlined,
                  textColor: Colors.red,
                  endIcon: false,
                  onPress: () {
                    controller.logout();
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

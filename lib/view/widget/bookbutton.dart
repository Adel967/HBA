import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:hba/core/constant/color.dart';
import 'package:hba/view/widget/paypal_checkout.dart';

class BookButton extends StatelessWidget {
  const BookButton({super.key, required this.onTap});
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      child: Material(
        color: AppColor.general,
        borderRadius: BorderRadius.circular(40),
        child: InkWell(
          onTap: () => onTap(),
          borderRadius: BorderRadius.circular(16),
          child: const Padding(
            padding: EdgeInsets.symmetric(horizontal: 12, vertical: 14),
            child: Text(
              'Book Now',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

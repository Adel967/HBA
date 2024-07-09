import 'package:hba/core/constant/color.dart';
import 'package:flutter/material.dart';

class CustomEnteringTextAuth extends StatelessWidget {
  final String labeltext;
  final String hinttext;
  final IconData icon;
  final TextEditingController? mycontroller;
  final String? Function(String?)? valid;
  final bool isNumber;
  final bool obscuretext;
  final bool readOnly;
  final VoidCallback? onTapTextField;
  final void Function()? onTapIcon;

  const CustomEnteringTextAuth({
    super.key,
    required this.labeltext,
    required this.hinttext,
    required this.icon,
    this.mycontroller,
    required this.valid,
    this.isNumber = false,
    this.obscuretext = false,
    this.readOnly = false,
    this.onTapTextField,
    this.onTapIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 25),
      child: TextFormField(
        obscureText: obscuretext,
        keyboardType: isNumber
            ? const TextInputType.numberWithOptions(decimal: true)
            : TextInputType.text,
        validator: valid,
        controller: mycontroller,
        readOnly: readOnly,
        onTap: () {
          if (onTapTextField != null) {
            onTapTextField!();
          }
        },
        decoration: InputDecoration(
          floatingLabelBehavior: FloatingLabelBehavior.always,
          label: Container(
              margin: const EdgeInsets.symmetric(horizontal: 7),
              child: Text(labeltext)),
          contentPadding:
              const EdgeInsets.symmetric(vertical: 10, horizontal: 30),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
          suffixIcon: InkWell(
            onTap: onTapIcon,
            child: Icon(icon),
          ),
          hintText: hinttext,
          hintStyle: TextStyle(fontSize: 12, color: AppColor.grey),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:hba/core/constant/color.dart';

class CustomSearchBar extends StatelessWidget {
  final TextEditingController? mycontroller;
    final void Function()? onTapIcon;

  final String? Function(String?)? valid;

  const CustomSearchBar({super.key, this.valid, this.mycontroller, this.onTapIcon});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 25),
      child: TextFormField(
        
        cursorColor:  AppColor.general,
        validator: valid,
        controller: mycontroller,
        decoration: InputDecoration(
          contentPadding:
              const EdgeInsets.symmetric(vertical: 10, horizontal: 30),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(30),),
          
          suffixIcon: InkWell(
            onTap: onTapIcon,
            child: const Icon(Icons.search ,color:  AppColor.general,),
          ),
          hintText: "Search For Hotels And Rooms",
          hintStyle: TextStyle(fontSize: 14, color: AppColor.general),
        ),
      ),
    );
  }
}

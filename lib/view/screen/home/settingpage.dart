import 'package:flutter/material.dart';
import 'package:hba/core/constant/color.dart';
import 'package:hba/view/widget/settings/appbar.dart';
import 'package:hba/view/widget/settings/settings_list.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.background,
      body: CustomScrollView(
        slivers: [
          const SliverAppBar(
            backgroundColor: AppColor.appBarColor,
            pinned: true,
            snap: true,
            floating: true,
            title: SettingsAppBar(),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) => const SettingsList(),
              childCount: 1,
            ),
          )
        ],
      ),
    );
  }
}
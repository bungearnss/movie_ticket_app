import 'dart:ui' as ui;
import 'package:flutter/material.dart';

import '../../utility/data/mockdata.dart';
import '../../utility/constant/constants.dart';

import './widgets/homepage.dart';

import '../../utility/constant/constants.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late final TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: TabBar(
          indicatorPadding: const EdgeInsets.symmetric(horizontal: 5),
          controller: _tabController,
          unselectedLabelStyle: TextStyles.unselectedLabelStyle,
          labelStyle: TextStyles.labelStyle,
          isScrollable: true,
          indicator: const BoxDecoration(
            border: Border(
              bottom: BorderSide(width: 2, color: AppColors.primaryColor),
            ),
          ),
          tabs: const [
            Tab(text: 'Movie'),
            Tab(text: 'Series'),
            Tab(text: 'TV Show'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        physics: const NeverScrollableScrollPhysics(),
        children: const [
          HomePage(),
          SizedBox.expand(),
          SizedBox.expand(),
        ],
      ),
    );
  }
}

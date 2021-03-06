import 'package:flutter/material.dart';
import 'package:responsive_grid/responsive_grid.dart';
import 'package:searchlog/views/tab_bar/content_view.dart';
import 'package:searchlog/views/tab_bar/custom_tab.dart';
import 'package:searchlog/views/tab_bar/custom_tab_bar.dart';

import 'home_view.dart';

class NavigationTabBarView extends StatefulWidget {
  const NavigationTabBarView({Key? key}) : super(key: key);

  @override
  _NavigationTabBarState createState() => _NavigationTabBarState();
}

class _NavigationTabBarState extends State<NavigationTabBarView>
with SingleTickerProviderStateMixin{

  List<ContentView> contentViews = [
    ContentView(
      tab: CustomTab(title: 'Hot'),
      content: HomeView(),
    ),
    ContentView(
      tab: CustomTab(title: 'Trending'),
      content: HomeView(),
    ),
    ContentView(
      tab: CustomTab(title: 'New'),
      content: HomeView(),
    )
  ];
  late TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: contentViews.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    bool isScreenWide = MediaQuery.of(context).size.width >= 800;
    double  screenHeight = MediaQuery.of(context).size.height;
    return Flex(
      direction: isScreenWide ? Axis.horizontal : Axis.vertical,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(children: [
          Text(
            "For those too lazy to type",
            overflow: TextOverflow.visible,
            style: const TextStyle(
                fontSize: 25, color: Colors.white
            ),
          ),
          Text(
            "Quick Find",
            overflow: TextOverflow.visible,
            style: const TextStyle(
                fontFamily: "Satisfy",
                color: Colors.white,
                fontSize: 25
            ),
          )
        ],),
        SizedBox(height: 50,),
        Container(
          height: screenHeight * 0.05,
          child: CustomTabBar(
              controller: tabController,
              tabs: contentViews.map((e) => e.tab).toList()),
        ),
      ],
    );
  }
}

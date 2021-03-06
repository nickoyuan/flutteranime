import 'package:flutter/material.dart';
import 'package:searchlog/views/centered_view.dart';
import 'footer_view.dart';
import 'list_view/list_view_images.dart';
import 'navigation_tab_bar.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 39, 39, 37),
        body: SingleChildScrollView(
            child: Column(
          children: [
            CenteredView(child: NavigationTabBarView()),
            ListViewImages(),
            SizedBox(height: 100,),
            FooterView()
          ],
        )));
  }
}
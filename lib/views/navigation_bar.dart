import 'package:flutter/material.dart';

class NavigationBar extends StatelessWidget {
  const NavigationBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color.fromARGB(255, 28, 40, 52),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          SizedBox(
            height: 50,
            width: 50,
            child: Image.asset("assets/baido.png", width: 200, height: 200),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 50.0, vertical: 0),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                NavBarItem("Location"),
                SizedBox(
                  width: 60,
                ),
                NavBarItem("Language"),
                SizedBox(width: 60),
                NavBarItem("About")
              ],
            ),
          )
        ],
      ),
    );
  }
}

class NavBarItem extends StatelessWidget {
  final String title;

  const NavBarItem(this.title);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {

      },
      child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 50.0),
          child: Text(
            title,
            style: TextStyle(color: Colors.white, fontSize: 18),
          )),
    );
  }
}

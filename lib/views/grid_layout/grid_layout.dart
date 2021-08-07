import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:responsive_grid/responsive_grid.dart';
import 'package:url_launcher/url_launcher.dart';
import 'grid_list.dart';
import '../open_container_wrapper.dart';

class GridLayout extends StatelessWidget {
  UrlHandler urlHandler = UrlHandler();

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      scrollDirection: Axis.vertical,
      physics: ScrollPhysics(),
      gridDelegate:
          SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
      itemBuilder: (_, index) => buildResponsiveCardHyperlink(
          choices[index].title,
          "www.google.com.au",
          choices[index].img,
          BoxFit.contain),
      itemCount: choices.length,
    );
  }

  Column buildResponsiveCardHyperlink(
      String title, String link, String img, BoxFit boxfit) {
    return Column(children: [
      ResponsiveGridCol(
        xs: 4,
        md: 1,
        child: Card(
          elevation: 5,
          clipBehavior: Clip.antiAlias,
          child: InkWell(
            onTap: () {
              FirebaseAnalytics().logEvent(name: title,parameters:null);
              urlHandler.launchURL(link);
            },
            child: Column(
              children: [
                Flexible(
                  flex: 1,
                  child: Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Container(
                      color: Color.fromARGB(255,249,249,247),
                      alignment: Alignment.centerLeft,
                      child: FittedBox(
                          fit: BoxFit.contain,
                          child: Text(
                            title,
                            maxLines: 2,
                            overflow: TextOverflow.visible,
                            style: TextStyle(
                              fontFamily: "Merriweather-Regular",
                              fontWeight: FontWeight.w600,
                              color: Colors.grey[850],
                              fontSize: 18
                            ),
                          ),
                        ),
                    ),
                  ),
                ),
                Flexible(
                  flex: 4,
                  child: OpenContainerWrapper(
                    closedBuilder: (BuildContext context, void Function() action) {
                      return Container(
                          decoration: new BoxDecoration(
                            image: new DecorationImage(
                              image: new AssetImage(img),
                              fit: BoxFit.cover,
                            ),
                          ));
                    }, title: title,
                  )
                ),
              ],
            ),
          ),
        ),
      ),
    ],
    );
  }
}

class UrlHandler {
  launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}

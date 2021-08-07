import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:responsive_grid/responsive_grid.dart';
import 'package:url_launcher/url_launcher.dart';

class SharedAccommodation extends StatelessWidget {
  UrlHandler urlHandler = UrlHandler();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(mainAxisSize: MainAxisSize.max, children: [
        Row(
          children: [
            Text(
              "Shared Rent and Homestay Accommodation",
              overflow: TextOverflow.visible,
              style: const TextStyle(
                  fontSize: 30, color: Color.fromARGB(255, 37, 74, 118)),
            ),
            Padding(
              padding: EdgeInsets.only(left: 20, right: 10),
              child: Icon(
                Icons.house,
                color: Color.fromARGB(255, 37, 74, 118),
              ), // icon is 48px widget.
            )
          ],
        ),
        Row(
          children: [
            Expanded(
              child: Padding(
                padding: EdgeInsets.only(top: 10, bottom: 10),
                child: Text(
                  "Favourite websites for finding Shared rent and Homestay in Australia",
                  overflow: TextOverflow.visible,
                  style: const TextStyle(
                      fontSize: 18, color: Color.fromARGB(255, 37, 74, 118)),
                ),
              ),
            ),
          ],
        ),
        ResponsiveGridRow(
          children: [
            buildResponsiveCardHyperlink(
                "Flatmates.com.au",
                "Australia's biggest share accommodation site",
                "https://flatmates.com.au/",
                "assets/flatmates.png",
                BoxFit.fitWidth
            ),
            buildResponsiveCardHyperlink(
                "Homestay Rentals",
                "By staying with an Australian host family, those looking for short and long term accommodation",
                "https://www.homestay.com/australia",
                "assets/homestay.jpg",
                BoxFit.fitHeight
            ),
            buildResponsiveCardHyperlink(
                "Homestay network Australia",
                "You will receive help and protection with the host family, you will learn about Australian Culture and Custom",
                "https://www.homestaynetwork.com.au/",
                "assets/homestaynetwork.png",
                BoxFit.fitHeight
            ),
            buildResponsiveCardHyperlink(
                "Global Experience Homestay",
                "We have a large pool of homestay families across Australia",
                "https://www.globalexperience.com.au/",
                "assets/globalexperience.png",
                BoxFit.fitWidth
            ),
          ],
        ),
      ]),
    );
  }

  ResponsiveGridCol buildResponsiveCardHyperlink(String title, String body, String link, String img, BoxFit boxfit) {
    return ResponsiveGridCol(
      xs: 20,
      md: 3,
      child: Container(
        height: 200,
        child: Card(
          elevation: 5,
          clipBehavior: Clip.antiAlias,
          child: InkWell(
            onTap: () {
              FirebaseAnalytics().logEvent(name: title,parameters:null);
              urlHandler.launchURL(link);
            },
            child: ListTile(
              contentPadding: EdgeInsets.only(left: 20, right: 10, top: 20),
              title: Text(title),
              subtitle: Text(body),
              trailing: Image.asset(
                img, fit: boxfit,
                width: 100, height: 100,
              ),
            ),
          ),
        ),
      ),
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

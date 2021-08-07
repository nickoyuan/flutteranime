import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:responsive_grid/responsive_grid.dart';
import 'package:url_launcher/url_launcher.dart';

class Hotel extends StatelessWidget {
  UrlHandler urlHandler = UrlHandler();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(mainAxisSize: MainAxisSize.max, children: [
        Row(
          children: [
            Text(
              "Hotels Favourites",
              overflow: TextOverflow.visible,
              style: const TextStyle(
                  fontSize: 30, color: Color.fromARGB(255, 37, 74, 118)),
            ),
            Padding(
              padding: EdgeInsets.only(left: 20, right: 10),
              child: Icon(
                Icons.hotel,
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
                  "Top favourite hotels websites that are cheap and Perfect for you",
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
                "Booking.com",
                "Booking.com is a Dutch online travel agency for lodging hotel reservations",
                "https://www.booking.com/",
                "assets/booking.png",
                BoxFit.fitWidth
            ),
            buildResponsiveCardHyperlink(
                "Expedia",
                "Expedia Group, Inc. is an American online travel company.",
                "https://www.expedia.com.au/",
                "assets/expedia.png",
                BoxFit.fitWidth
            ),
            buildResponsiveCardHyperlink(
                "Trivago",
                "Trivago is a Dutch company specializing in internet-related services and products in the hotel.",
                "https://www.trivago.com.au/",
                "assets/trivago.jpg",
                BoxFit.fitHeight
            ),
            buildResponsiveCardHyperlink(
                "Airbnb",
                "Airbnb, Inc. is an American company primarily homestays for vacation rentals",
                "https://www.airbnb.com.au/",
                "assets/airbnb.png",
                BoxFit.fitHeight
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

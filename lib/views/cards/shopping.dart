import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:responsive_grid/responsive_grid.dart';
import 'package:url_launcher/url_launcher.dart';

class Shopping extends StatelessWidget {
  UrlHandler urlHandler = UrlHandler();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(mainAxisSize: MainAxisSize.max, children: [
        Row(
          children: [
            Text(
              "Online Shopping Sales",
              overflow: TextOverflow.visible,
              style: const TextStyle(
                  fontSize: 30, color: Color.fromARGB(255, 37, 74, 118)),
            ),
            Padding(
              padding: EdgeInsets.only(left: 20, right: 10),
              child: Icon(
                Icons.shopping_bag ,
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
                  "Websites for online shopping sales",
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
                "Amazon",
                "Shop online for Electronics, Computers, Clothing, Shoes, Toys, Books, DVDs, Sporting Goods, Beauty",
                "https://www.amazon.com.au/",
                "assets/amazon.jpeg",
                BoxFit.fitHeight
            ),
            buildResponsiveCardHyperlink(
                "Ebay",
                "Buy & sell electronics, cars, clothes, collectibles & more ",
                "https://www.ebay.com.au/",
                "assets/ebay.png",
                BoxFit.fitHeight
            ),
            buildResponsiveCardHyperlink(
                "Gumtree",
                "Australia's FREE Marketplace to buy in your local area!",
                "https://www.epicgames.com",
                "assets/gumtree.png",
                BoxFit.fitHeight
            ),
            buildResponsiveCardHyperlink(
                "Catch of the day",
                "Low prices on the biggest brands in fashion, tech, beauty, grocery, sports, and more",
                "https://www.catch.com.au/",
                "assets/catch.png",
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

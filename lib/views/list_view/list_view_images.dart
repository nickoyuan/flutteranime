import 'package:flutter/material.dart';

class ListViewImages extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MyListViewImages();
}

class _MyListViewImages extends State<ListViewImages> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 500,
      child: ListView.builder(
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: 5,
          itemBuilder: (context, index) {
            return buildListItems("hi", "assets/front_page/covid.jpg", 10);
          }),
    );
  }
}

Column buildListItems(
  String title,
  String img,
  var likes,
) {
  return Column(
    children: [
      SizedBox(
        height: 20,
      ),
      Text(
        "For those too lazy to type",
        overflow: TextOverflow.visible,
        style: const TextStyle(
            fontSize: 25, color: Colors.white
        ),
      ),
      SizedBox(
        height: 20,
      ),
      Container(
          height: 500,
          width: 500,
          decoration: new BoxDecoration(
            image: new DecorationImage(
              image: new AssetImage(img),
              fit: BoxFit.cover,
            ),
          )),
      SizedBox(
        height: 20,
      ),
      Row(
        children: [
          IconButton(
            icon: const Icon(Icons.favorite),
            color: Colors.white,
            onPressed: () {},
          ),
          Text(
            "1234",
            overflow: TextOverflow.visible,
            style: const TextStyle(
                fontSize: 15, color: Colors.white
            ),
          ),
          SizedBox(width: 20,),
          IconButton(
            icon: const Icon(Icons.comment),
            tooltip: 'Increase volume by 10',
            color: Colors.white,
            onPressed: () {},
          ),
          Text(
            "1234",
            overflow: TextOverflow.visible,
            style: const TextStyle(
                fontSize: 15, color: Colors.white
            ),
          ),
        ],
      ),
      Divider(
        thickness: 1,
          color: Colors.grey
      )
    ],
  );
}


import 'package:flutter/material.dart';
import 'package:searchlog/views/centered_view.dart';

class FooterView extends StatefulWidget {
  const FooterView({Key? key}) : super(key: key);

  @override
  _FooterViewState createState() => _FooterViewState();
}

class _FooterViewState extends State<FooterView> {
  @override
  Widget build(BuildContext context) {
    return Container(
        color: Color.fromARGB(255, 54, 54, 54),
        child: CenteredView(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Support Us",
                    overflow: TextOverflow.visible,
                    style: const TextStyle(
                        fontSize: 30, color: Colors.white
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 20, right: 10),
                    child: Icon(
                      Icons.people,
                      color: Colors.white,
                    ), // icon is 48px widget.
                  )
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "Share to those poor souls without a keyboard",
                textAlign: TextAlign.center,
                overflow: TextOverflow.visible,
                style: const TextStyle(
                    fontSize: 20, color: Colors.white),
              ),
            ],
          ),
        ),
    );
  }
}
import 'package:flutter/material.dart';

import 'call_to_action_btn.dart';

class CourseDetails extends StatelessWidget {
  const CourseDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 600,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            'QUICK SEARCH.\nFIND ANYTHING',
            style: TextStyle(
                fontWeight: FontWeight.w800, fontSize: 50, height: 0.9),
          ),
          SizedBox(
            height: 30,
          ),
          Text(
            'In this course we will go over the basics of using Flutter Web for website development. Topics will include Responsive Layout, Deploying, Font Changes, Hover Functionality, Modals and more.',
            style: TextStyle(fontSize: 21, height: 1.7),
          ),
          SizedBox(
            height: 30,
          ),
          CallToAction('Join Course'),
        ],
      ),
    );
  }
}

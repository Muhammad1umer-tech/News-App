import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class App_bar_Widget extends StatelessWidget {
  const App_bar_Widget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Flutter",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        Text(
          "News",
          style: TextStyle(color: Colors.blue),
        ),
      ],
    );
  }
}

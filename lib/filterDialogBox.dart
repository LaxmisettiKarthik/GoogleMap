import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

class FilterBox extends StatefulWidget {
  const FilterBox({super.key});

  @override
  State<FilterBox> createState() => _FilterBoxState();
}

class _FilterBoxState extends State<FilterBox> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          //Padding(padding: EdgeInsets.only(top: 30, left: 150)),
          Row(
            children: [
              SizedBox(
                width: 10,
              ),
              Text(
                "Your Filters",
                style: TextStyle(
                  color: Colors.blueAccent,
                  fontSize: 25,
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Icon(
                Icons.favorite,
                color: Colors.red,
              )
            ],
          ),
          SizedBox(
            height: 30,
          ),
          Text(
            "Distance",
            style: TextStyle(color: Colors.green, fontSize: 20),
            textAlign: TextAlign.left,
          ),
          Slider(value: 0, onChanged: (Value){},)
        ],
      ),
    ));
  }
}

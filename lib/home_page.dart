import 'package:flutter/material.dart';
import 'package:todo_app/models/tasks.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController colorController = TextEditingController();

  Color? _chooseColor;
  List<Tasks> _tasksList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar(),
      body: getBody(),
    );
  }

  AppBar getAppBar() {
    return AppBar(
      backgroundColor: Colors.yellow[600],
      elevation: 0,
      title: Text(
        "Qaydnoma",
        style: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }

  Widget getBody() {
    return SafeArea(child: getBodyColumn());
  }

  Widget getBodyColumn() {
    return Container(

      child: Column(children: [
        SizedBox(height: 630,),
        _colors(),
       const SizedBox(
          height: 10.0,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: TextField(
            keyboardType: TextInputType.text,
            textInputAction: TextInputAction.unspecified,
            controller: colorController,
            decoration: const InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(12.0),
                ),
              ),
            ),
          ),
        ),
      ]),
    );
  }

  Widget _colors() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: List.generate(
        _colorList.length,
        (index) => InkWell(
          splashColor: Colors.grey,
          child: CircleAvatar(
            radius: 25,
            backgroundColor: _colorList[index],
          ),
          onTap: () {
            _chooseColor = _colorList[index];
          },
        ),
      ),
    );
  }

  final List<Color> _colorList = [
    Colors.green.shade800,
    Colors.red,
    Colors.yellow.shade700,
    Colors.blue.shade900,
    Colors.orange.shade900,
  ];
}

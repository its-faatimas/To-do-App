import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController colorController = TextEditingController();

  Color? _chooseColor;

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

  Container getBody() {
    return Container(child: Column(children: [
      ListView()
    ]),);
  }

  Widget _colors() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: List.generate(
        _colorList.length,
        (index) => InkWell(
          splashColor: Colors.grey,
          child: CircleAvatar(
            backgroundColor: _colorList[index],
          ),
          onTap: () {
            _chooseColor = _colorList[index];
          },
        ),
      ),
    );
  }

  Widget getBodyColumn() {
    return Column(children: [
      Expanded(
        child: _colors(),
        flex: 1,
      ),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: TextField(
          keyboardType: TextInputType.text,
          textInputAction: TextInputAction.done,
          controller: colorController,
          decoration: const InputDecoration(),
        ),
      ),
    ]);
  }

  final List<Color> _colorList = [
    Colors.green.shade800,
    Colors.red,
    Colors.yellow.shade700,
    Colors.blue.shade900,
    Colors.orange.shade900,
  ];
}

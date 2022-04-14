import 'package:flutter/cupertino.dart';
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
  final List<Tasks> _tasksList = [];

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
      title: const Text(
        "Qaydnoma",
        style: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }

  Widget getBody() {
    return Column(
      children: [
        Expanded(
            child: ListView.builder(
                itemCount: _tasksList.length,
                itemBuilder: (ctx, i) {
                  Tasks task = _tasksList[i];
                  return Card(
                    elevation: 0,
                    color: Colors.grey.shade200,
                    margin: const EdgeInsets.symmetric(
                        horizontal: 16.0, vertical: 6.0),
                    shape: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(14)),
                    child: ListTile(
                      contentPadding: EdgeInsets.zero,
                      leading: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: CircleAvatar(
                          backgroundColor: task.color,
                          radius: 15,
                        ),
                      ),
                      title: Text(task.title.toString()),
                      trailing: Container(
                        decoration: BoxDecoration(
                            color: Colors.green[400],
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(12),
                                bottomRight: Radius.circular(12))),
                        height: 56.0,
                        width: 56.0,
                        child: const Icon(
                          CupertinoIcons.checkmark,
                          color: Colors.white,
                          size: 30,
                        ),
                      ),
                    ),
                  );
                })),
        SafeArea(
          child: getBodyColumn(),
        ),
      ],
    );
  }

  Widget getBodyColumn() {
    return Column(children: [
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
          decoration: InputDecoration(
            suffixIcon: IconButton(
                onPressed: () {
                  if (_chooseColor == null) {
                    final snackBar = SnackBar(
                      elevation: 0,
                      shape: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      margin: const EdgeInsets.symmetric(
                        vertical: 6,
                        horizontal: 125,
                      ),
                      // padding: EdgeInsets.all(10),
                      behavior: SnackBarBehavior.floating,
                      backgroundColor: Colors.red,
                      content: const Text(
                        "Rangni tanlang!",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    );
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    return;
                  }

                  if (colorController.text.trim().isEmpty) {
                    final snackBar = SnackBar(
                      elevation: 0,
                      shape: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(12.0)),
                      margin: const EdgeInsets.symmetric(
                          vertical: 6, horizontal: 125),
                      // padding: EdgeInsets.all(10),
                      behavior: SnackBarBehavior.floating,
                      backgroundColor: Colors.red,
                      content: const Text(
                        "Matnni kiriting",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    );
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    return;
                  }

                  Tasks task = Tasks(_chooseColor, colorController.text.trim());
                  setState(() {
                    _tasksList.add(task);
                    _chooseColor = null;
                    colorController.clear();
                  });
                },
                icon: Container(
                  decoration: const BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(6.0),
                          bottomRight: Radius.circular(6.0))),
                  height: 90.0,
                  width: 70.0,
                  child: const Icon(
                    Icons.add,
                    color: Colors.white,
                  ),
                )),
            border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(12.0),
              ),
            ),
          ),
        ),
      ),
    ]);
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

import 'package:flutter/material.dart';

class dropdown extends StatefulWidget {
  const dropdown({Key? key}) : super(key: key);

  @override
  State<dropdown> createState() => _dropdownState();
}

class _dropdownState extends State<dropdown> {
  var countrys = ["selected", "telugu", "english", "Hindi", "tamil", "UK"];
  var _dropdown = "selected";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Dropdown'),
        ),
        body: Container(
          padding: EdgeInsets.all(40),
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Row(
              children: [
                Text(
                  "Translate ::",
                  style: TextStyle(fontSize: 25),
                ),
                Expanded(
                    child: Center(
                  child: DropdownButton(
                      value: _dropdown,
                      items: countrys.map((item) {
                        return DropdownMenuItem(
                          child: Text(
                            item,
                            style: TextStyle(fontSize: 30),
                          ),
                          value: item,
                        );
                      }).toList(),
                      onChanged: (item) {
                        setState(() {
                          _dropdown = item as String;
                          print(
                            "selected country $item",
                          );
                        });
                      }),
                )),
              ],
            ),
            SizedBox(
              height: 20,
            ),
          ]),
        ));
  }
}

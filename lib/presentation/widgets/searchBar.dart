import 'package:flutter/material.dart';

class SearchBar extends StatefulWidget {
  String? newQuery;
  void Function(String value)? onChange;

  SearchBar({Key? key, this.newQuery, this.onChange}) : super(key: key);

  @override
  _SearchBarState createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 40,
      right: 15,
      left: 15,
      child: Container(
          color: Colors.white,
          child: Row(
            children: <Widget>[
              IconButton(
                splashColor: Colors.grey,
                icon: Icon(Icons.search),
                onPressed: () {},
              ),
              Expanded(
                child: TextField(
                  onChanged: widget.onChange,
                  cursorColor: Colors.black,
                  keyboardType: TextInputType.text,
                  textInputAction: TextInputAction.go,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.symmetric(horizontal: 15),
                      hintText: "Pesquisar parada"),
                ),
              ),
            ],
          )),
    );
  }
}
import 'package:flutter/material.dart';

class SearchBox extends StatefulWidget {
  SearchBox(
      {required this.text, required this.onChanged, required this.hintText});

  final String text;
  final ValueChanged<String> onChanged;
  final String hintText;

  @override
  _SearchBoxState createState() => _SearchBoxState();
}

class _SearchBoxState extends State<SearchBox> {
  final controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 42,
        margin: const EdgeInsets.fromLTRB(0, 0, 0, 5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(0),
          color: Colors.white,
          //border: Border.symmetric(color: Colors.black26, b: border),
        ),
        padding: const EdgeInsets.fromLTRB(8, 2, 0, 0),
        child: Center(
          child: TextField(
            controller: controller,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.fromLTRB(10, 5, 10, 10),
              icon: Icon(Icons.search, color: Colors.black),
              suffixIcon: widget.text
                      .isNotEmpty // if there is no text in the box then show the "x" to clear search
                  ? GestureDetector(
                      child: Icon(Icons.close, color: Colors.black),
                      onTap: () {
                        controller.clear();
                        widget.onChanged('');
                        FocusScope.of(context).requestFocus(FocusNode());
                      },
                    )
                  : null,
              hintText: widget.hintText,
              hintStyle: TextStyle(
                fontSize: 19.0,
                color: Colors.grey,
              ),
              border: InputBorder.none,
            ),
            style: TextStyle(
              fontSize: 20.0,
              color: Colors.black,
            ),
            onChanged: widget.onChanged,
          ),
        ));
  }
}

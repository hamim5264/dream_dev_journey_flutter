import 'package:flutter/material.dart';

void main() {
  runApp(const SizeSelectorApp());
}

class SizeSelectorApp extends StatelessWidget {
  const SizeSelectorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SizeSelectorHomeScreen(),
      title: "Size Selector",
      debugShowCheckedModeBanner: true,
    );
  }
}

class SizeSelectorHomeScreen extends StatefulWidget {
  const SizeSelectorHomeScreen({super.key});

  @override
  _SizeSelectorHomeScreenState createState() => _SizeSelectorHomeScreenState();
}

class _SizeSelectorHomeScreenState extends State<SizeSelectorHomeScreen> {
  String selectedSize = "";
  Color selectedButtonColor = Colors.white60;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  mySnackBar(msg, context) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(msg)));
  }

  void _onButtonTap(String size) {
    setState(() {
      selectedSize = size;
    });
    mySnackBar("Size: $size", context);
  }

  ElevatedButton _buildSizeButton(String size, Color buttonColor) {
    return ElevatedButton(
      onPressed: () => _onButtonTap(size),
      style: ElevatedButton.styleFrom(
        backgroundColor: buttonColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      child: Text(size),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: const Text(
          "Size Selector",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            _buildSizeButton(
                "S", selectedSize == "S" ? Colors.yellow : selectedButtonColor),
            const SizedBox(
              height: 10,
              width: 5,
            ),
            _buildSizeButton(
                "M", selectedSize == "M" ? Colors.yellow : selectedButtonColor),
            const SizedBox(
              height: 10,
              width: 5,
            ),
            _buildSizeButton(
                "L", selectedSize == "L" ? Colors.yellow : selectedButtonColor),
            const SizedBox(
              height: 10,
              width: 5,
            ),
            _buildSizeButton("XL",
                selectedSize == "XL" ? Colors.yellow : selectedButtonColor),
            const SizedBox(
              height: 10,
              width: 5,
            ),
            _buildSizeButton("XXL",
                selectedSize == "XXL" ? Colors.yellow : selectedButtonColor),
            const SizedBox(
              height: 10,
              width: 5,
            ),
            _buildSizeButton("XXXL",
                selectedSize == "XXXL" ? Colors.yellow : selectedButtonColor),
          ],
        ),
      ),
    );
  }
}

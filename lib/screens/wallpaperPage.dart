import 'package:flutter/material.dart';
import 'package:vibgyor/utils/utilities.dart';

class WallpaperPage extends StatefulWidget {
  const WallpaperPage({ Key? key }) : super(key: key);

  @override
  _WallpaperPageState createState() => _WallpaperPageState();
}

class _WallpaperPageState extends State<WallpaperPage> {
  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Wallpapers"),),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:movies_app_route/presentation/search/view/SearchWidget.dart';
import 'package:movies_app_route/theme/appTheme.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Text(''),
        backgroundColor: Color(0x3329292c),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(100),
                bottomRight: Radius.circular(100))),
        toolbarHeight: 150,
        title: Container(
            margin: EdgeInsets.all(20),
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(35),
                border: Border.all(color: MyTheme.yellowColor, width: 3)),
            child: IconButton(
                onPressed: () {
                  showSearch(context: context, delegate: SearchWidget());
                },
                icon: Icon(
                  Icons.search,
                  size: 30,
                ))),
      ),
      body: Center(
        child: Image.asset('assets/images/Group 25.png'),
      ),
    );
  }
}

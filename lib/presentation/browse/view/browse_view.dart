import 'package:flutter/material.dart';
import 'package:movies_app_route/presentation/browse/view/browesItem.dart';
import 'package:movies_app_route/theme/appTheme.dart';

class BrowseView extends StatelessWidget {
  const BrowseView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Text(
              'Watch List',
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
          Divider(
            color: MyTheme.yellowColor,
            thickness: 1,
            indent: 15,
            endIndent: 15,
          ),
          Expanded(
            child: ListView.builder(
              itemBuilder: (context, index) {
                return BrowesItem();
              },
              itemCount: 5,
            ),
          ),
        ],
      ),
    );
  }
}

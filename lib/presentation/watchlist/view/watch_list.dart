import 'package:flutter/material.dart';
import 'package:movies_app_route/presentation/watchlist/view/WatchListItem.dart';

import '../../../theme/appTheme.dart';

class WatchListView extends StatelessWidget {
  const WatchListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Watch List',
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ),
            Divider(
              color: MyTheme.yellowColor,
              thickness: 1,
            ),
            Expanded(
              child: ListView.separated(
                itemBuilder: (context, index) {
                  return WatchListItem();
                },
                separatorBuilder: (context, index) {
                  return Divider(
                    color: MyTheme.yellowColor,
                    thickness: 1,
                    indent: 20,
                    endIndent: 20,
                  );
                },
                itemCount: 8,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

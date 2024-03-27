import 'package:flutter/material.dart';
import 'package:movies_app_route/theme/appTheme.dart';

class WatchListItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListTile(
        leading: Image.asset(
          'assets/images/poster.jpg',
          fit: BoxFit.cover,
          width: 100,
        ),
        title: Text('Movie Name',
            style:
                Theme.of(context).textTheme.titleLarge!.copyWith(fontSize: 18)),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text('2020',
                style: Theme.of(context)
                    .textTheme
                    .titleLarge!
                    .copyWith(fontSize: 14, color: Colors.grey)),
            Text('Movie description And Details',
                style: Theme.of(context)
                    .textTheme
                    .titleLarge!
                    .copyWith(fontSize: 14, color: Colors.grey)),
            Row(
              children: [
                Icon(
                  Icons.star,
                  color: MyTheme.yellowColor,
                ),
                Text('8.0',
                    style: Theme.of(context)
                        .textTheme
                        .titleLarge!
                        .copyWith(fontSize: 16))
              ],
            )
          ],
        ),
      ),
    );
  }
}

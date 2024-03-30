import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app_route/presentation/search/view/SearchWidget.dart';
import 'package:movies_app_route/presentation/search/viewModel/searchCubit/searchStates.dart';
import 'package:movies_app_route/presentation/search/viewModel/searchCubit/searchViewModel.dart';
import 'package:movies_app_route/theme/appTheme.dart';

class SearchView extends StatefulWidget {
  SearchView({super.key});

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  SearchViewModel searchViewModel = SearchViewModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: Icon(
            Icons.arrow_back,
            color: MyTheme.whiteColor,
            size: 35,
          ),
          // backgroundColor: MyTheme.blackColor,
          // shape: const RoundedRectangleBorder(
          //     borderRadius: BorderRadius.only(
          //         bottomLeft: Radius.circular(100),
          //         bottomRight: Radius.circular(100))),
          toolbarHeight: 150,
          title: Container(
              width: double.infinity,
              margin: const EdgeInsets.all(5),
              padding: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(35),
                  border: Border.all(color: MyTheme.whiteColor, width: 3)),
              child: IconButton(
                  onPressed: () {
                    showSearch(context: context, delegate: SearchWidget());
                  },
                  icon: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const SizedBox(width: 10),
                      Icon(
                        Icons.search,
                        color: MyTheme.whiteColor,
                        size: 30,
                      ),
                    ],
                  ))),
        ),
        body: BlocBuilder<SearchViewModel, SearchStates>(
          bloc: searchViewModel,
          builder: (context, state) {
            if (state is SearchLoading) {
              return Center(
                child: Image.asset('assets/images/Group 25.png'),
              );
            } else if (state is SearchSuccess) {
              return Center(
                child: Image.asset('assets/images/Group 25.png'),
              );
            } else {
              return Center(
                child: Image.asset('assets/images/Group 25.png'),
              );
            }
          },
        ));
  }
}
//appBar: AppBar(
//         leading: Icon(Icons.arrow_back,color: MyTheme.yellowColor,size: 35,),
//         backgroundColor:MyTheme.blackColor,
//         toolbarHeight: 150,
//         title: Container(
//
//           width: double.infinity,
//             // margin: EdgeInsets.all(20),
//             // padding: EdgeInsets.all(10),
//             decoration: BoxDecoration(
//                 color: MyTheme.greyColor,
//                 borderRadius: BorderRadius.circular(35),
//                 border: Border.all(color: MyTheme.yellowColor, width: 3)),
//             child: IconButton(
//                 onPressed: () {
//                   showSearch(context: context,
//                       delegate: SearchWidget());
//                 },
//                 icon: Row(
//                   mainAxisAlignment: MainAxisAlignment.start,
//                   children: [
//                     const SizedBox(width: 10),
//                     Icon(
//                       Icons.search,color: MyTheme.yellowColor,
//                       size:30,
//                     ),
//                   ],
//                 ))),
//       ),
//       body: Container(
//         decoration: BoxDecoration(
//           color: MyTheme.blackColor
//         ),
//         child: Center(
//           child: Image.asset('assets/images/Group 25.png'),
//         ),
//       ),
//     );
//   }
// }
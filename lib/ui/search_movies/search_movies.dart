import 'package:flutter/material.dart';
import 'package:movie_rest_bloc/ui/search_movies/search_new_tab.dart';

class SearchMoviesLay extends StatelessWidget {
  final ScrollController _scrollController;

  SearchMoviesLay(this._scrollController);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.black12
      ),
      padding: const EdgeInsets.all(20),
      margin: const EdgeInsets.all(10),
      child: InkWell(
        onTap: () {
          _scrollController.animateTo(
              _scrollController.position.maxScrollExtent,
              duration: Duration(milliseconds: 500),
              curve: Curves.fastOutSlowIn);
          Navigator.push(context, MaterialPageRoute(builder: (context) => SearchNewTab()));
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
              child: Text("Search Movies...",

              ),
            ),
            Icon(
              Icons.search,color: Colors.white,
            )
          ],
        ),
      ),
    );
  }
}

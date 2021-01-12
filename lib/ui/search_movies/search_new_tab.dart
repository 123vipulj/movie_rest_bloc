import 'package:flutter/material.dart';
import 'package:movie_rest_bloc/bloc/block_provider.dart';
import 'package:movie_rest_bloc/bloc/search_fetch.dart';
import 'package:movie_rest_bloc/constant.dart';
import 'package:movie_rest_bloc/model/search_movie/searchmovie.dart';

class SearchNewTab extends StatelessWidget {
  final bloc = SearchFetch();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.only(top: 60),
        child: BlocProvider<SearchFetch>(
          bloc: bloc,
          child: Container(
            margin: const EdgeInsets.all(10),
            child: Column(
              children: <Widget>[
                TextField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide.none),
                      hintText: "Search Movies ...",
                      hintStyle:
                          TextStyle(fontWeight: FontWeight.w700, fontSize: 17),
                      prefixIcon: Icon(
                        Icons.search,
                        color: Colors.white,
                      ),
                      fillColor: Colors.black12,
                      filled: true),
                  onChanged: (query) {
                    bloc.submitMoviesQuery(query);
                  },
                ),
                Expanded(
                  child: _buildStramBuilder(bloc),
                )
                //_buildStramBuilder(bloc),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget _buildStramBuilder(SearchFetch searchFetch) {
  return StreamBuilder(
    stream: searchFetch.searchedStream,
    builder: (context, snapshot) {
      final result = snapshot.data;

      if(result == null ){
        return Center(
          child: Text("Search Movies Name"),
        );
      }else {
        return _buildSearchList(result.body);
      }

    },
  );
}

Widget _buildSearchList(SearchMovie searchMovie) {
  return ListView.separated(
    separatorBuilder: (context, index) => Divider(),
    itemCount: searchMovie.results.length,
    itemBuilder: (context, index) {
      String url;
      if(searchMovie.results[index].posterPath != null){
        url = searchMovie.results[index].posterPath;
      }else {
        url = "https://lanecdr.org/wp-content/uploads/2019/08/placeholder.png";
      }

      return Container(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Image.network(IMAGE_URL + url, height: 50, width: 60),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(searchMovie.results[index].movieTitle),
                SizedBox(
                  height: 10,
                ),
                Text(searchMovie.results[index].releaseDate, style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontFamily: 'firasans'
                ),)
              ],
            ),

          ],
        ),
      );
    },
  );
}

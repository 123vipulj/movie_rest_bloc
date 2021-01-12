import 'package:flutter/material.dart';
import 'package:movie_rest_bloc/bloc/actor_fetch.dart';
import 'package:movie_rest_bloc/bloc/block_provider.dart';
import 'package:movie_rest_bloc/model/actor/actors.dart';

import '../../../constant.dart';

class ActorList extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _ActorListState();
  }

}

class _ActorListState extends State<ActorList>{
  final bloc = ActorFetch();
  @override
  Widget build(BuildContext context) {
    bloc.fetchActorList();

    return BlocProvider<ActorFetch>(
      bloc: bloc,
      child: Container(
        height: 280,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: _buildStreamBuilder(bloc),
        ),
      ),
    );
  }

}

Widget _buildStreamBuilder(ActorFetch result) {
  return StreamBuilder(
    stream: result.actorStream,
    builder: (context, snapshot){
      final result = snapshot.data;

      return _buildActorWidget(result.body);
    },
  );
}

Widget _buildActorWidget(Actor actor) {
  return ListView.separated(
      separatorBuilder: (context, index) => Divider(),
      scrollDirection: Axis.horizontal,
      itemCount: actor.results.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Card(
            borderOnForeground: true,
            elevation: 0.3,
            child: Container(
              width: 150,
              padding: const EdgeInsets.all(5),
              margin: const EdgeInsets.all(8),

              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  CircleAvatar(
                    radius: 60,
                    backgroundImage: NetworkImage(
                      IMAGE_URL + actor.results[index].profilePicUrl,

                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          actor.results[index].actorName,
                          style: TextStyle(
                              fontSize: 13,
                              color: Colors.black,
                              fontWeight: FontWeight.w200, fontFamily: 'firasans'),

                        ),
                        Container(
                          margin: const EdgeInsets.only(top: 2),
                          child: Text(
                            "Poularity : "+actor.results[index].popularity.toString(),
                            style: TextStyle(
                              fontWeight: FontWeight.w800,
                                fontFamily: 'firasans'
                            ),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(top: 15),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Icon(
                                Icons.favorite_border, size: 20, color: Colors.red.withOpacity(0.6),
                              ),
                              Text(
                                "More",
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 14,
                                  color: Colors.blueGrey,
                                  fontFamily: 'firasans'
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      });
}
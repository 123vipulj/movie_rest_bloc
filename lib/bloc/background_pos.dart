import 'dart:async';

import 'package:flutter/material.dart';
import 'package:movie_rest_bloc/bloc/block.dart';

class BackgroundPos extends Bloc{
  final _controller = StreamController<int>();

  Stream<int> get getPos => _controller.stream;

  void setBackPosImage(int pos){
    final result = pos;
    _controller.sink.add(result);
  }

  @override
  void dispose() {
    _controller.close();
  }


}
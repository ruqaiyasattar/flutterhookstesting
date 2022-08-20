/*
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

void main() {
  runApp(
    MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          primarySwatch: Colors.blue
      ),
      home: const HomePage(),
    ),
  );
}

const url = 'https://cdn.pixabay.com/photo/2017/05/09/03/46/alberta-2297204__340.jpg';

enum Action{
  rotateRight,
  rotateLeft,
  moreVisible,
  lessVisible
}

@immutable
class State{
  final double rotationDeg;
  final double alpha;

  const State({required this.rotationDeg, required this.alpha});

  //inital state
  const State.zero()
      : rotationDeg = 0.0,
        alpha = 1.0;

  State rotateRight() => State(rotationDeg: rotationDeg + 10.0, alpha: alpha);
  State rotateLeft() => State(rotationDeg: rotationDeg - 10.0, alpha: alpha);
  State increaseAlpha() => State(rotationDeg: rotationDeg, alpha: min(alpha + 0.1 ,1.0));
  State decreaseAlpha() => State(rotationDeg: rotationDeg, alpha: max(alpha - 0.1 ,0.0));
}

//reducer function
State reducer(State oldState, Action? action){
  switch(action){

    case Action.rotateRight:
      return oldState.rotateLeft();
    case Action.rotateLeft:
      return oldState.rotateRight();
    case Action.moreVisible:
      return oldState.increaseAlpha();
    case Action.lessVisible:
      return oldState.decreaseAlpha();
    case null:
      return oldState;
  }
}

class HomePage extends HookWidget {
  const HomePage({Key? key}) : super(key: key);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    final store = useReducer<State, Action?>(
      reducer,
      initialState: const State.zero(),
      initialAction: null,
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text("Flutter Hooks => reducer and redux"),
      ),
      body: Column(
        children: [
          Row(
            children: [
              rotateLeftButton(store),
              rotateRightButton(store),
              decreaseAlphaButton(store),
              increaseAlphaButton(store),
            ],
          ),
          const SizedBox(height: 100,),
          Opacity(
            opacity: store.state.alpha,
            child: RotationTransition(
              turns: AlwaysStoppedAnimation(store.state.rotationDeg / 360.0),
              child: Image.network(url),
            ),
          ),
        ],
      ),

    );
  }

  TextButton increaseAlphaButton(Store<State, Action?> store) => TextButton(onPressed: (){store.dispatch(Action.moreVisible);}, child: const Text('Increase Alpha'),);

  TextButton decreaseAlphaButton(Store<State, Action?> store) => TextButton(onPressed: (){store.dispatch(Action.lessVisible);}, child: const Text('Decrease Alpha'),);

  TextButton rotateRightButton(Store<State, Action?> store) => TextButton(onPressed: (){store.dispatch(Action.rotateRight);}, child: const Text('Turn Right'),);

  TextButton rotateLeftButton(Store<State, Action?> store) => TextButton(onPressed: (){store.dispatch(Action.rotateLeft);}, child: const Text('Turn Left'),);
}*/

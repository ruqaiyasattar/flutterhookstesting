/*
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

*/
/*
extension CompactMap<T> on Iterable<T?> {
  Iterable<T> compactMap<E>([
    E? Function(T?)? transform
  ]) => map(
    transform ?? (e) => e,
  ).where((e) => e != null).cast();
}  //ex 3
*//*


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

*/
/*
Stream<String> getTime() => Stream.periodic(
    const Duration(seconds: 1),
    //after every tick...it shows time
    (_) => DateTime.now().toIso8601String(),
);//eg 1
*//*

*/
/*

class CountDown extends ValueNotifier<int>{
  late StreamSubscription sub;
  CountDown({required int from}) :super(from){
    sub = Stream.periodic(
        const Duration(seconds: 1),
        (v) => from - v
    ).takeWhile((value) => value >= 0)
        .listen((value) {
          this.value = value;
    });
  }  //eg 4
@override
  void dispose() {
    sub.cancel(); //eg 4
    super.dispose();
  }
}
*//*


const url = 'https://cdn.pixabay.com/photo/2017/05/09/03/46/alberta-2297204__340.jpg';
//const imageHeight = 300.0;

*/
/*
extension Normalize on num{
  num normalize(
      num selfRangeMin,
      num selfRangeMax, [
        num normalizedRangeMin = 0.1,
        num normalizedRangeMax = 1.0,
  ]
      ) => (normalizedRangeMax - normalizedRangeMin) *
      ((this - selfRangeMin) / (selfRangeMax - selfRangeMin)) +
  normalizedRangeMin;
}
*//*
//eg 5

class HomePage extends HookWidget {
  const HomePage({Key? key}) : super(key: key);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    //final dataTime = useStream(getTime()); //eg 1
    //final controller = useTextEditingController(); //eg 2
    //final text =  useState(''); //eg 2
    */
/*useEffect((){
      controller.addListener(() {
        text.value = controller.text;
      });
      return null;
    },
     [controller],
    );*//*
 //eg 2
    */
/*
    //get image form network (online) and hold that in memory to use later but it flickes
   final image =  useFuture(
       NetworkAssetBundle(Uri.parse(url))
           .load(url)
           .then((data) => data.buffer.asUint8List())
           .then((data) => Image.memory(data))
   );*//*


    */
/*final future = useMemoized(() =>
          NetworkAssetBundle(Uri.parse(url))
              .load(url)
              .then((data) => data.buffer.asUint8List())
              .then((data) => Image.memory(data)));

    final snapshop = useFuture(future); //ex 3*//*


    //final countDown = useMemoized(() => CountDown(from: 20)); //eg 4
    //final notifier = useListenable(countDown);//ex 4

    */
/*  final opacity = useAnimationController(
      duration: const Duration(seconds: 1),
      initialValue: 1.0,
      lowerBound: 0.0,
      upperBound: 1.0,
    );

    final size = useAnimationController(
      duration: const Duration(seconds: 1),
      initialValue: 1.0,
      lowerBound: 0.0,
      upperBound: 1.0,
    );

    final controller = useScrollController();
    useEffect(() {
      controller.addListener(() {
        final newOpacity = max(imageHeight - controller.offset,0.0);
        final normalized =  newOpacity.normalize(0.0, imageHeight).toDouble();
        opacity.value = normalized.toDouble();
        size.value = normalized;
      });
      return null;
    },[controller]);*//*
 //ex 5


    late final StreamController<double> controller;
    controller = useStreamController<double>(
      onListen: (){
        controller.sink.add(0.0);
      },
    );


    return Scaffold(
      appBar: AppBar(
        title: const Text("Flutter Hooks => useStreamController"),
      ),
      body: StreamBuilder<double>(
        stream: controller.stream,
        builder: (context, snapshot){
          if (!snapshot.hasData) {
            return const CircularProgressIndicator();
          }  else {
            final rotation = snapshot.data ?? 0.0;
            return GestureDetector(
              onTap: (){
                controller.sink.add(rotation + 10.0);
              },
              child: RotationTransition(
                turns: AlwaysStoppedAnimation(rotation / 360.0),
                child: Center(
                  child: Image.network(url),
                ),
              ),
            );
          }
        },
      ),
      */
/*children: [
          SizeTransition(
            sizeFactor: size,
            axis: Axis.vertical,
            axisAlignment: -1.0,
            child: FadeTransition(
              opacity: opacity,
              child: Image.network(
                url,
                height: imageHeight,
                fit: BoxFit.cover,
              ),
            ),
          ), //eg 5
          Expanded(
            child: ListView.builder(
              controller: controller,
                itemCount: 100,
                itemBuilder: (context, index){
                  return ListTile(
                    title: Text('Person ${index + 1}'),
                  );
                }),
          ) //eg 5
        ],*//*

      //ex 4
      //children: [snapshop.data].compactMap().toList(), //ex 3 in col
    );
  }
}*/

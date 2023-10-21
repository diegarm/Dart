import 'dart:async';

void main() async{
  Stream myStream(int interval,[int? maxCount]) async*{
    int i = 1;
    while(i != maxCount){
      print("Couting $i");
      await Future.delayed(Duration(seconds: interval));
      yield i++;
    }

    print('The Stream is Finished');
  }

  var diegoStream = myStream(1).asBroadcastStream();

  StreamSubscription mySubscriber = diegoStream.listen((event) {
    if(event.isEven){
      print('This number is even');
    }
  },
      onError: (e)
        {
          print('An error');
        },
      onDone: (){
        print('Is done');
      });

  diegoStream.map((event) => 'Subscriber 2 watching: $event').listen(print);

  await Future.delayed(Duration(seconds: 3));
  mySubscriber.pause();
  print('Pause');

  await Future.delayed(Duration(seconds: 3));
  mySubscriber.resume();
  print('Resume');

  await Future.delayed(Duration(seconds: 3));
  mySubscriber.cancel();
  print('Cancel');



  print('The main is finished');
}
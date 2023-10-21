void main(){
  Future<int> myFutureFunc()async{
    print('I have a function in the future');
    await Future.delayed(Duration(seconds: 5));
    //throw Exception();
    return 12;
  }

  myFutureFunc()
      .then((value) => print('My function value is $value'))
      .onError((error, stackTrace) => print('An error occurred'))
      .whenComplete(() => print('Complete...'));

  Future<int> myFutureErrorFunc(int a, int b) async{
      try{
        if(a>b){
          throw Exception();
        }
        print('I have a functional Function');
        await Future.delayed(Duration(seconds: 5));
        return 1;
      }catch(e){
        print('An error occurred: $e');
        return 0;
      }finally{
        print('Finally');
      }
  }

  myFutureErrorFunc(1, 1).then((value) => print('$value'));
  print('Done with main');
}
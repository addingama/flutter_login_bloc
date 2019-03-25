import 'dart:async';

class Bloc {
  final emailController = StreamController<String>();
  final passwordController = StreamController<String>();


  // Getter on dart using keyword `get`

  // Add data to stream
  Function(String) get changeEmail => emailController.sink.add;
  Function(String) get changePassword => passwordController.sink.add;

  // Regrieve data from stream
  Stream<String> get email => emailController.stream;
  Stream<String> get password => passwordController.stream;
}

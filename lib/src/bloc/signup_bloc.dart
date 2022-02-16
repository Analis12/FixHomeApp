import 'package:rxdart/rxdart.dart';
import 'package:fixhome/src/bloc/validators.dart';

class SignUpBloc with Validator {
  SignUpBloc();
  //Controllers
  final _emailController = BehaviorSubject<String>();
  final _passwordController = BehaviorSubject<String>();
  final _usernameController = BehaviorSubject<String>();
  final _identificationController = BehaviorSubject<String>();
  //final _dateController = BehaviorSubject<String>();
  //Streams, vinculados con la validación
  Stream<String> get emailStream =>
      _emailController.stream.transform(emailValidator);
  Stream<String> get passwordStream =>
      _passwordController.stream.transform(passwordValidator);
  Stream<String> get usernameStream =>
      _usernameController.stream.transform(usernameValidator);
  Stream<String> get identificationStream =>
      _identificationController.stream.transform(identificationValidator);
  //Stream<String> get dateStream =>
  //_dateController.stream.transform(dateValidator);
  Stream<bool> get formSignUpStream => Rx.combineLatest3(
      usernameStream, emailStream, passwordStream, (a, b, c) => true);
  //Funciones para el onChange cada control
  Function(String) get changeEmail => _emailController.sink.add;
  Function(String) get changePassword => _passwordController.sink.add;
  Function(String) get changeUsername => _usernameController.sink.add;
  Function(String) get changeidentification =>
      _identificationController.sink.add;
  //Function(String) get changedate => _dateController.sink.add;
  //Propiedades con el valor del texto ingreso
  String get email => _emailController.value;
  String get password => _passwordController.value;
  String get username => _usernameController.value;
  String get identification => _identificationController.value;
  // String get date => _dateController.value;
}

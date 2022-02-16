import 'dart:async';

class Validator {
  final emailValidator = StreamTransformer<String, String>.fromHandlers(
    handleData: (data, sink) {
      String pattern =
          r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
      RegExp regExp = RegExp(pattern);
      if (regExp.hasMatch(data)) {
        sink.add(data); //La validación se cumplió
      } else {
        sink.addError('Correo no válido');
      }
    },
  );

  final passwordValidator = StreamTransformer<String, String>.fromHandlers(
    handleData: (data, sink) {
      if (data.length >= 5) {
        sink.add(data); //La validación se cumplió
      } else {
        sink.addError('Contraseña al menos 5 caracteres');
      }
    },
  );

  final usernameValidator = StreamTransformer<String, String>.fromHandlers(
    handleData: (data, sink) {
      if (data.length >= 8) {
        sink.add(data); //La validación se cumplió
      } else {
        sink.addError('Usuario al menos 8 caracteres');
      }
    },
  );

  final identificationValidator =
      StreamTransformer<String, String>.fromHandlers(
    handleData: (data, sink) {
      int cont = 1, contador = 0, aux, porcentaje, verificador;
      if (data.length == 10) {
        for (final rune in data.runes) {
          int valDInt = int.parse(String.fromCharCode(rune));
          if (cont % 2 == 1) {
            int mul = valDInt * 2;
            if (mul >= 10) {
              aux = mul - 9;
              contador = contador + aux;
            } else {
              contador = contador + mul;
            }
          } else {
            if (cont != 10) {
              contador = contador + valDInt;
            }
          }
          porcentaje = contador % 10;
          if (porcentaje == 0) {
            verificador = 0;
          } else {
            verificador = 10 - porcentaje;
          }
          if (cont == 10) {
            if (verificador == valDInt) {
              // ignore: avoid_print
              print("Cedula Correcta");
              sink.add(data);
            } else {
              sink.addError('Cédula Incorrecta');
            }
          }
          cont++;
        }
      } else {
        sink.addError('Cédula contiene 10 digitos');
      }
    },
  );
}

final dateValidator = StreamTransformer<String, String>.fromHandlers(
  handleData: (data, sink) {
    // ignore: avoid_print
    print(data);
  },
);

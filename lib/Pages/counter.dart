import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Counter Watch',
      theme: ThemeData(
        primaryColor: Colors.blue, // Color primario
      ),
      home: CounterWatch(),
    );
  }
}

class CounterWatch extends StatefulWidget {
  @override
  _SmartWatchCounterState createState() => _SmartWatchCounterState();
}

class _SmartWatchCounterState extends State<CounterWatch> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      if (_counter < 13) {
        _counter++;
      } else {
        _showMaxLimitSnackBar();
      }
    });
  }

  void _decrementCounter() {
    setState(() {
      if (_counter > -13) {
        _counter--;
      } else {
        _showMinLimitSnackBar();
      }
    });
  }

  void _showMaxLimitSnackBar() {
    _showMessage('El máximo posible es 13');
  }

  void _showMinLimitSnackBar() {
    _showMessage('El mínimo posible es -13');
  }

  void _showMessage(String message) {
    showDialog(
      context: context,
      barrierDismissible:
          false, // Evitar que el usuario cierre el diálogo al tocar fuera de él
      builder: (BuildContext context) {
        return Scaffold(
          backgroundColor: Color.fromARGB(255, 19, 19, 19),
          body: Center(
            child: AlertDialog(
              backgroundColor: Color.fromARGB(255, 19, 19, 19),
              content: Text(
                message,
                style: TextStyle(color: Colors.white),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        );
      },
    );
    // Desvanecimiento del mensaje después de 2 segundos
    Future.delayed(Duration(seconds: 2), () {
      Navigator.of(context).pop();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 19, 19, 19), // Fondo negro
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              // Botón de incremento arriba del contador
              onPressed: _incrementCounter,
              child: Icon(Icons.arrow_upward, size: 16),
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.all(8),
              ),
            ),
            SizedBox(
                height:
                    25), // Espaciado entre el botón de incremento y el contador
            Text(
              '$_counter',
              style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
            SizedBox(
                height:
                    25), // Espaciado entre el contador y el botón de decremento
            ElevatedButton(
              onPressed: _decrementCounter,
              child: Icon(Icons.arrow_downward, size: 16),
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.all(8),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

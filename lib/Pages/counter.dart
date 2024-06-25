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
      home: Scaffold(
        body: CounterWatch(),
        backgroundColor: const Color.fromARGB(255, 19, 19, 19), // Fondo negro
      ),
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
      if (_counter < 10) {
        _counter++;
      } else {
        _showMaxLimitSnackBar();
      }
    });
  }

  void _decrementCounter() {
    setState(() {
      if (_counter > -10) {
        _counter--;
      } else {
        _showMinLimitSnackBar();
      }
    });
  }

  void _resetCounter() {
    setState(() {
      _counter = 0;
    });
  }

  void _showMaxLimitSnackBar() {
    _showMessage('El máximo posible es 10');
  }

  void _showMinLimitSnackBar() {
    _showMessage('El mínimo posible es -10');
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
    return GestureDetector(
      // Detector de gestos para deslizar hacia arriba o hacia abajo
      onVerticalDragUpdate: (details) {
        if (details.primaryDelta! < 0) {
          _incrementCounter();
        } else if (details.primaryDelta! > 0) {
          _decrementCounter();
        }
      },
      child: Stack(
        children: [
          Center(
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
                  height: 19,
                ), // Espaciado entre el botón de incremento y el contador
                GestureDetector(
                  onTap: _resetCounter,
                  child: Text(
                    '$_counter',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
                SizedBox(
                  height: 19,
                ), // Espaciado entre el contador y el botón de decremento
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
          Positioned(
            top: 4,
            left: 0,
            right: 0,
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 8, horizontal: 1),
              child: Text(
                'Counter Watch',
                style: TextStyle(color: Colors.white, fontSize: 10),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

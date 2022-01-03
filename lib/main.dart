import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => TextProvider(),
      child: MaterialApp(
        home: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.blue,
            title: const MyAppBarText(),
          ),
          backgroundColor: Colors.lightBlueAccent,
          body: const ContainerHoster(),
        ),
      ),
    );
  }
}

class ContainerHoster extends StatelessWidget {
  const ContainerHoster({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          child: Container(
            color: Colors.lightBlueAccent,
          ),
        ),
        Expanded(
          child: Container(
            color: Colors.amberAccent,
          ),
        ),
        Expanded(
          child: Container(
            color: Colors.redAccent,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                MyTextDisplay(),
                MyTextInput(),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class MyAppBarText extends StatelessWidget {
  const MyAppBarText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(Provider.of<TextProvider>(context, listen: false).getString());
  }
}

class MyTextDisplay extends StatelessWidget {
  const MyTextDisplay({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      Provider.of<TextProvider>(context).getString(),
      style: TextStyle(
        color: Colors.white,
      ),
      textAlign: TextAlign.center,
    );
  }
}

class MyTextInput extends StatelessWidget {
  const MyTextInput({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(onChanged: (String newText) {
      Provider.of<TextProvider>(context, listen: false).setString(newText);
    });
  }
}

class TextProvider extends ChangeNotifier {
  String _string = 'Awesome Text';

  void setString(String newString) {
    _string = newString;
    notifyListeners();
  }

  String getString() => _string;
}

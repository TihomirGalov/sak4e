import 'package:flutter/material.dart';
import 'package:fluuter_demo/styles/styles.dart';
import 'package:fluuter_demo/screens/home/home-screen.dart';


class OrderAnything extends StatefulWidget {
  const OrderAnything({Key? key}) : super(key: key);

  @override
  _OrderAnythingState createState() => _OrderAnythingState();
}

class _OrderAnythingState extends State<OrderAnything> {
  final orderText = TextEditingController();
  final submitButtonStyle = ButtonStyle(
      backgroundColor: MaterialStateProperty.resolveWith<Color>(
        (Set<MaterialState> states) {
          return Colors.lightGreen; // Use the component's default.
        },
      ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavDrawer(),
      appBar: AppBar(
        title: Text('Sak4e'),
        centerTitle: true,
      ),
      body: _textForm(context),
    );
  }

  Widget _textForm (BuildContext context) {
    return Center(
      child: ListView(
        shrinkWrap: true,
        padding: const EdgeInsets.all(20.0),
        children: <Widget>[
          TextField(
            controller: orderText,
            keyboardType:  TextInputType.multiline,
            maxLines: null,
            minLines: 20,
            decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Enter what you want to be delivered to you...'
            ),
          ),
          Center(
            child: TextButton(
              onPressed: () {
                showDialog(context: context, builder: (context) {
                  return AlertDialog(content: Text(orderText.text));
                  }
                );
              },
              child: Text('Submit', style: TextStyle(color: Colors.white70)),
              style: submitButtonStyle,
            ),
          )
        ]
      ),
    );
  }
}


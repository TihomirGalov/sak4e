import 'package:flutter/material.dart';
import 'package:fluuter_demo/screens/order-anything.dart';
import 'package:fluuter_demo/styles/styles.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: NavDrawer(),
        appBar: AppBar(
          title: Text('Sak4e'),
          centerTitle: true,
          actions: [
            _showProfile(context),
          ],
        ),
        body: _home(context));
  }

  Widget _showProfile(BuildContext context) {
    return IconButton(
        onPressed: () {}, icon: Icon(Icons.account_circle_outlined));
  }

  Widget _home(BuildContext context) {
    final customButtonStyle = ButtonStyle(backgroundColor:
        MaterialStateProperty.resolveWith<Color>(
      (Set<MaterialState> states) {
        if (states.contains(MaterialState.pressed))
          return Theme.of(context).colorScheme.primary.withOpacity(0.5);
        return Colors.black12; // Use the component's default.
      },
    ), minimumSize:
        MaterialStateProperty.resolveWith<Size>((Set<MaterialState> states) {
      return Size.square(250);
    }));
    return Center(
        child: ListTile(
          title: Row(
          children: <Widget>[
            Expanded(
                child: TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => OrderAnything()),
                      );
                    },
                    child: Text("Order Anything", style: customTextStyle),
                    style: customButtonStyle)),
            Expanded(
                child: TextButton(
              onPressed: () {},
              child: Text("Choose from our products", style: customTextStyle),
              style: customButtonStyle,
            )),
          ],
        ),
      )
    );
  }
}

class NavDrawer extends StatelessWidget {
  const NavDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: ListView(children: <Widget>[
      DrawerHeader(
        child: Text('Actions', style: customTextStyle),
      ),
      ListTile(
        leading: Icon(Icons.home),
        title: Text('Home', style: customTextStyle),
        onTap: () => {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => HomeScreen()))
        },
      ),
      ListTile(
        leading: Icon(Icons.shopping_bag),
        title: Text('My Orders', style: customTextStyle),
        onTap: () => {Navigator.of(context).pop()},
      ),
      ListTile(
        leading: Icon(Icons.settings),
        title: Text('Settings', style: customTextStyle),
        onTap: () => {Navigator.of(context).pop()},
      ),
    ]));
  }
}

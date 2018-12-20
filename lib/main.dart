import 'package:flutter/material.dart';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'home-bloc.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<HomeBloc>(
      child: MaterialApp(
        title: 'Bloc',
        home: HomeWidget(),
      ),
      bloc: HomeBloc(),
    );
  }
}

class HomeWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    HomeBloc bloc = BlocProvider.of<HomeBloc>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Bloc"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              bloc.Increment();
              bloc.Increment2();
            },
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            StreamBuilder(
              stream: bloc.outCount,
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                return Text('Contagem em ${snapshot.data}');
              },
            ),
            SizedBox(
              height: 20.0,
            ),
            StreamBuilder(
              stream: bloc.outCount2,
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                return Text('Contagem em ${snapshot.data}');
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          bloc.inCount2.add(100000);
        },
      ),
    );
  }
}

import 'package:counter_cubit/logic/cubit/counter_cubit.dart';
import 'package:counter_cubit/presentation/router/routing_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  GlobalKey<ScaffoldState> homeScreenKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      key: homeScreenKey,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            BlocConsumer<CounterCubit, CounterState>(
              listener: (context, state) {
                if (state.counterValue == 0) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text("Counter value is now 0!"),
                      duration: Duration(milliseconds: 1000),
                    ),
                  );
                } else if (state.counterValue < 0) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text("Counter value has now negative value!"),
                      duration: Duration(milliseconds: 1000),
                    ),
                  );
                }
              },
              builder: (context, state) {
                return Text(
                  '${state.counterValue}',
                  style: Theme.of(context).textTheme.headline4,
                );
              },
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 60, vertical: 10),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  new FloatingActionButton(
                    onPressed: () {
                      BlocProvider.of<CounterCubit>(context).decrement();
                    },
                    tooltip: 'decrement',
                    child: Icon(Icons.remove),
                    heroTag: null,
                  ),
                  new FloatingActionButton(
                    onPressed: () {
                      BlocProvider.of<CounterCubit>(context).increment();
                    },
                    tooltip: 'Increment',
                    child: Icon(Icons.add),
                    heroTag: null,
                  ),
                ],
              ),
            ), //
            SizedBox(
              height: 30,
            ),
            MaterialButton(
              onPressed: () {
                Navigator.of(context).pushNamed(SecondScreenRoute, arguments: homeScreenKey);
              },
              child: Text(
                "Goto Second Page",
                style: TextStyle(color: Colors.white),
              ),
              color: Colors.blueGrey,
            )
          ],
        ),
      ),
    );
  }
}

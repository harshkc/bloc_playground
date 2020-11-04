import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learn_bloc/cubit/counter_cubit.dart';

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    CounterCubit blocProvider = BlocProvider.of<CounterCubit>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Bloc Counter App"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            SizedBox(height: 10.0),
            BlocConsumer<CounterCubit, CounterState>(
              listener: (context, state) {
                Scaffold.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      "${state.wasIncremented ? "Yay Incremented by 1" : "Ah decremented by 1"}",
                    ),
                    duration: Duration(milliseconds: 300),
                  ),
                );
              },
              builder: (context, state) {
                return Text(
                  state.counterValue.toString(),
                  style: Theme.of(context).textTheme.headline4,
                );
              },
            ),
            SizedBox(height: 10.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FlatButton(
                  onPressed: () => blocProvider.incrementValue(),
                  child: Icon(Icons.add),
                ),
                FlatButton(
                  onPressed: () => blocProvider.decrementValue(),
                  child: Icon(Icons.remove),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

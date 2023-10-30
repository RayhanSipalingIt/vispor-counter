import 'package:flutter/material.dart';
import 'package:global_state_manager/global_state.dart';
import 'package:global_state_manager/main.dart';

class CounterWidget extends StatefulWidget {
  final GlobalState globalState;

  CounterWidget(this.globalState);

  @override
  _CounterWidgetState createState() => _CounterWidgetState();
}

class _CounterWidgetState extends State<CounterWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Counter List'),
      ),
      body: ListView.builder(
        itemCount: widget.globalState.counters.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text('Counter Value: ${widget.globalState.counters[index]}'),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: Icon(Icons.add),
                  onPressed: () {
                    setState(() {
                      widget.globalState.counters[index]++;
                    });
                  },
                ),
                IconButton(
                  icon: Icon(Icons.remove),
                  onPressed: () {
                    setState(() {
                      if (widget.globalState.counters[index] > 0) {
                        widget.globalState.counters[index]--;
                      }
                    });
                  },
                ),
                IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: () {
                    setState(() {
                      widget.globalState.removeCounter(index);
                    });
                  },
                ),
              ],
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          widget.globalState.addNewCounter(); // Menambahkan counter baru
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
import 'package:flutter/material.dart';

/// Constructor
/// CreateSate
/// InitState

/// DidChangeDependencies -> if dependency change
/// Build -> setSate
/// DidUpdateWidget -> if parent configuration change

/// Deactivated
/// Dispose

void main() {
  runApp(
    StateFullLifeCycle(),
  );
}

class StateFullLifeCycle extends StatelessWidget {
  const StateFullLifeCycle({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: StateHomeScreen(),
      title: "Stateful Life Cycle",
      debugShowCheckedModeBanner: true,
    );
  }
}

class StateHomeScreen extends StatefulWidget {
  const StateHomeScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _StateHomeUI();
  }
}

class _StateHomeUI extends State<StateHomeScreen> {
  /// Life cycle 1
  @override
  void initState() {
    print("init state called");
    // init state used when task any task need to start first on the screen.
    super.initState();
  }

  /// Life cycle 2
  @override
  void didChangeDependencies() {
    print("did change dependencies called");
    super.didChangeDependencies();
  }

  /// Life cycle 3
  @override
  void didUpdateWidget(covariant StateHomeScreen oldWidget) {
    print("did update widget called");
    super.didUpdateWidget(oldWidget);
  }

  int counter = 0;

  @override
  Widget build(BuildContext context) {
    /// Life cycle 4
    print("build method called");

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Stateful Lifecycle",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Text(
          "$counter",
          style: Theme.of(context).textTheme.displayLarge,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(100),
        ),
        backgroundColor: Colors.blue,
        elevation: 0,
        onPressed: () {
          counter++;
          setState(() {});
        },
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }

  /// Life cycle 5
  @override
  void deactivate() {
    print("deactivated called");
    super.deactivate();
  }

  /// Life cycle 6
  @override
  void dispose() {
    print("disposed called");
    super.dispose();
  }
}

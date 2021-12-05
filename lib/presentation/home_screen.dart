import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:todo_gorouter/presentation/pending_screen.dart';
import 'package:todo_gorouter/state/auth_state.dart';
import 'package:todo_gorouter/state/todo_state.dart';
import 'package:todo_gorouter/utils/constants.dart';

class HomeScreen extends StatefulWidget {
  final int index;

  HomeScreen({required String tab, Key? key})
      : index = indexFrom(tab),
        super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();

  static int indexFrom(String tab) {
    switch (tab) {
      case 'completed':
        return 1;
      case 'pending':
      default:
        return 0;
    }
  }
}

class _HomeScreenState extends State<HomeScreen> {
  late int _selectedIndex;

  @override
  void initState() {
    super.initState();
    _selectedIndex = widget.index;
  }

  @override
  void didUpdateWidget(covariant HomeScreen oldWidget) {
    _selectedIndex = widget.index;
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'TODO App',
          style: TextStyle(
              fontSize: 20, fontWeight: FontWeight.w500, color: Colors.white),
        ),
        leading: GestureDetector(
          onTap: () {
            Provider.of<TodoState>(context, listen: false).clearAllItems();
            Provider.of<AuthState>(context, listen: false)
                .updateLoginStatus(false);
          },
          child: const Icon(
            Icons.logout, // add custom icons also
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: GestureDetector(
              onTap: () {
                context.goNamed(create);
              },
              child: const Icon(
                Icons.note_add_outlined,
                size: 26.0,
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.pending_actions), label: 'Pending'),
          BottomNavigationBarItem(
              icon: Icon(Icons.done_outline_outlined), label: 'Completed'),
        ],
        backgroundColor: Colors.green,
        unselectedItemColor: Colors.white24,
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.white,
        onTap: (index) {
          switch (index) {
            case 0:
              context.goNamed(pending);
              break;
            case 1:
              context.goNamed(completed);
              break;
          }
        },
      ),
      body: PendingScreen(
        index: _selectedIndex,
      ),
    );
  }
}

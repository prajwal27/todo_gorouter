import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo_gorouter/router.dart';
import 'package:todo_gorouter/state/auth_state.dart';
import 'package:todo_gorouter/state/todo_state.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final SharedPreferences sharedPreferences =
      await SharedPreferences.getInstance();

  runApp(AppWidget(sharedPreferences: sharedPreferences));
}

class AppWidget extends StatelessWidget {
  final SharedPreferences sharedPreferences;

  const AppWidget({Key? key, required this.sharedPreferences})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final AuthState authState = AuthState(sharedPreferences);
    final TodoState todoState = TodoState(sharedPreferences);
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<AuthState>(
          lazy: false,
          create: (BuildContext createContext) => authState,
        ),
        Provider<AppRouter>(
          lazy: false,
          create: (BuildContext createContext) => AppRouter(authState),
        ),
        ChangeNotifierProvider<TodoState>(
          lazy: false,
          create: (BuildContext createContext) => todoState,
        ),
      ],
      child: Builder(
        builder: (BuildContext context) {
          final router = Provider.of<AppRouter>(context, listen: false).router;
          return MaterialApp.router(
            routeInformationParser: router.routeInformationParser,
            routerDelegate: router.routerDelegate,
            debugShowCheckedModeBanner: false,
            title: 'TODOs',
            theme: ThemeData(
              primarySwatch: Colors.green,
            ),
          );
        },
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: const HomePage(),
    );
  }
}

Stream<String> getTime() =>
    Stream.periodic(
      const Duration(seconds: 1),
          (_) => DateTime.now().toIso8601String(),
    );


//Home page extends hook widget
class HomePage extends HookWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = useTextEditingController();
    final text = useState("");
    useEffect(() {
      controller.addListener(() {
        text.value = controller.text;
      });
      return null;
    },[controller]);
    return Scaffold(
      appBar: AppBar(title: const Text("Home page"),),body: Column(
      children: [
        TextFormField(
          controller: controller,
        ),
        Text('you typed ${text.value}')
      ],
    ),
    );
  }
}

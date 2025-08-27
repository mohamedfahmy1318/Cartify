import 'package:flutter/material.dart';

extension SeparatorExtension on List<Widget> {
  List<Widget> joinWith(Widget separator) {
    if (isEmpty) return [];
    if (length == 1) return toList();
    return expand((element) => [element, separator]).toList()..removeLast();
  }
}

//الكود ده بيعمل Extension على List<Widget> علشان يضيف بينهم separator (فاصل) بشكل سهل بدل ما تكتب SizedBox أو Divider كل مرة يدوي.
/*import 'package:flutter/material.dart';

extension SeparatorExtension on List<Widget> {
  List<Widget> joinWith(Widget separator) {
    if (isEmpty) return [];
    if (length == 1) return toList();
    return expand((element) => [element, separator]).toList()..removeLast();
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("JoinWith Example")),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text("Hello"),
            const Text("World"),
            const Text("Flutter"),
          ].joinWith(const SizedBox(height: 20)), // هنا استخدمنا الفاصل
        ),
      ),
    );
  }
}
*/

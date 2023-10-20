import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_name_changer/providers/all_providers.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('Home')),
      ),
      body: Center(
        child: Text(
          context.watch<NameProvider>().textfield,
          style: const TextStyle(fontSize: 30),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: context.watch<IndexProvider>().currentIndex,
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
                backgroundColor: Colors.blue),
            BottomNavigationBarItem(
                icon: Icon(Icons.settings),
                label: 'Settings',
                backgroundColor: Colors.blue)
          ],
          onTap: (int index) {
            context.read<IndexProvider>().indexChanger(newIndex: index);

            if (context.watch<IndexProvider>().currentIndex == 1) {
              Navigator.pushNamedAndRemoveUntil(
                  context, '/home', (route) => false);
            } else if (context.watch<IndexProvider>().currentIndex == 0) {
              Navigator.pushNamedAndRemoveUntil(
                  context, '/settings', (route) => false);
            }
          }),
    );
  }
}

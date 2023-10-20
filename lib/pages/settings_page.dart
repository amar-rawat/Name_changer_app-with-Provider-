import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_name_changer/providers/all_providers.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    TextEditingController newTextfield = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('Settings')),
      ),
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('Username: '),
              Text(
                context.watch<NameProvider>().textfield,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Colors.green[700]),
              )
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: TextFormField(
              controller: newTextfield,
              decoration: const InputDecoration(
                  hintText: 'Type text here', border: OutlineInputBorder()),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          ElevatedButton(
              onPressed: () {
                context
                    .read<NameProvider>()
                    .updateText(newTextfield: newTextfield.text);
              },
              child: const Text('Submit'))
        ]),
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
                backgroundColor: Colors.blue),
          ],
          onTap: (int index) {
            context
                .read<IndexProvider>()
                .indexChanger(context: context, newIndex: index);
          }),
    );
  }
}

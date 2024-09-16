import 'package:flutter/material.dart';
import 'package:freshchat_sdk/freshchat_sdk.dart';
import 'package:freshchat_sdk/freshchat_user.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Freshchat Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Freshchat Integration'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _initFreshchat();
  }

  void _initFreshchat() {
    Freshchat.init(
     "0df008c5-9a76-49ed-8b20-79c3702b73a7",
    "ef3ea199-e2b4-42a1-94a6-0ffea6e97640",
    "msdk.in.freshchat.com",
    );
  }

  
    
   void _setupUser() {
  FreshchatUser freshchatUser = FreshchatUser(
   "user_external_id", "user_restore_id"
  );
  freshchatUser.setFirstName("John");
  freshchatUser.setLastName("Doe");
  freshchatUser.setEmail("johndoe@dead.man");
  freshchatUser.setPhone("+91", "1234234123");

  Freshchat.setUser(freshchatUser);
}


  void _showFreshchat() {
    Freshchat.showConversations();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            TextField(
              controller: _nameController,
              decoration: const InputDecoration(
                labelText: 'Name',
              ),
            ),
            TextField(
              controller: _emailController,
              decoration: const InputDecoration(
                labelText: 'Email',
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _setupUser,
              child: const Text('Setup User'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _showFreshchat,
              child: const Text('Open Freshchat'),
            ),
          ],
        ),
      ),
    );
  }
}


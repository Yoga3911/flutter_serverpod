import 'package:fugi_serverpod_client/fugi_serverpod_client.dart';
import 'package:flutter/material.dart';
import 'package:serverpod_flutter/serverpod_flutter.dart';

var client = Client('http://192.168.56.1:8080/')
  ..connectivityMonitor = FlutterConnectivityMonitor();

var user = client.users;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Serverpod Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  MyHomePageState createState() => MyHomePageState();
}

class MyHomePageState extends State<MyHomePage> {
  List<User>? users;
  bool _isLoading = false;

  @override
  void initState() {
    _getAll();
    super.initState();
  }

  Future<void> _getAll() async {
    _isLoading = true;
    setState(() {});
    users = await user.getAll();
    _isLoading = false;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Serverpod Example'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => const InsertPage(),
          ),
        ),
        child: const Icon(Icons.add),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: _isLoading
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : ListView.builder(
                itemCount: users?.length ?? 0,
                itemBuilder: (_, index) {
                  final u = users?[index] ?? User(username: "");
                  return ListTile(
                    title: Text(u.username),
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => UpdatePage(
                          user: u,
                        ),
                      ),
                    ),
                    trailing: IconButton(
                      onPressed: () {
                        user.delete(u.id!).then((_) {
                          _getAll();
                        });
                      },                      icon: const Icon(
                        Icons.delete,
                        color: Colors.red,
                      ),
                    ),
                  );
                },
              ),
      ),
    );
  }
}

class InsertPage extends StatefulWidget {
  const InsertPage({super.key});

  @override
  State<InsertPage> createState() => _InsertPageState();
}

class _InsertPageState extends State<InsertPage> {
  late final TextEditingController _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Insert Page"),
      ),
      body: Column(
        children: [
          TextField(
            controller: _controller,
          ),
          ElevatedButton(
            onPressed: () {
              user.insert(_controller.text).then(
                    (_) => Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const MyHomePage(),
                      ),
                      (route) => false,
                    ),
                  );
            },
            child: const Text("Add"),
          )
        ],
      ),
    );
  }
}

class UpdatePage extends StatefulWidget {
  const UpdatePage({super.key, required this.user});
  final User user;

  @override
  State<UpdatePage> createState() => _UpdatePageState();
}

class _UpdatePageState extends State<UpdatePage> {
  late final TextEditingController _controller =
      TextEditingController(text: widget.user.username);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Update Page"),
      ),
      body: Column(
        children: [
          TextField(
            controller: _controller,
          ),
          ElevatedButton(
            onPressed: () {
              user
                  .update(
                    User(
                      id: widget.user.id,
                      username: _controller.text,
                    ),
                  )
                  .then(
                    (_) => Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const MyHomePage(),
                      ),
                      (route) => false,
                    ),
                  );
            },
            child: const Text("Update"),
          )
        ],
      ),
    );
  }
}

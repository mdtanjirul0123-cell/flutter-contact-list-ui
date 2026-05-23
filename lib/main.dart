import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Contact List',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true,
      ),
      home: const ContactListScreen(),
    );
  }
}

class Contact {
  final String id;
  final String name;
  final String phone;
  final String email;
  final String avatarLetter;

  Contact({
    required this.id,
    required this.name,
    required this.phone,
    required this.email,
  }) : avatarLetter = name.isNotEmpty ? name[0].toUpperCase() : '?';
}

class ContactListScreen extends StatefulWidget {
  const ContactListScreen({Key? key}) : super(key: key);

  @override
  State<ContactListScreen> createState() => _ContactListScreenState();
}

class _ContactListScreenState extends State<ContactListScreen> {
  final List<Contact> contacts = [
    Contact(
      id: '1',
      name: 'John Doe',
      phone: '+1 234-567-8900',
      email: 'john.doe@example.com',
    ),
    Contact(
      id: '2',
      name: 'Jane Smith',
      phone: '+1 234-567-8901',
      email: 'jane.smith@example.com',
    ),
    Contact(
      id: '3',
      name: 'Michael Johnson',
      phone: '+1 234-567-8902',
      email: 'michael.johnson@example.com',
    ),
    Contact(
      id: '4',
      name: 'Emily Williams',
      phone: '+1 234-567-8903',
      email: 'emily.williams@example.com',
    ),
    Contact(
      id: '5',
      name: 'David Brown',
      phone: '+1 234-567-8904',
      email: 'david.brown@example.com',
    ),
  ];

  void _showAddContactDialog() {
    final nameController = TextEditingController();
    final phoneController = TextEditingController();
    final emailController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Add New Contact'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: nameController,
              decoration: const InputDecoration(labelText: 'Name'),
            ),
            TextField(
              controller: phoneController,
              decoration: const InputDecoration(labelText: 'Phone'),
            ),
            TextField(
              controller: emailController,
              decoration: const InputDecoration(labelText: 'Email'),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              if (nameController.text.isNotEmpty &&
                  phoneController.text.isNotEmpty &&
                  emailController.text.isNotEmpty) {
                setState(() {
                  contacts.add(Contact(
                    id: DateTime.now().toString(),
                    name: nameController.text,
                    phone: phoneController.text,
                    email: emailController.text,
                  ));
                });
                Navigator.pop(context);
              }
            },
            child: const Text('Add'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contacts'),
        elevation: 0,
      ),
      body: ListView.builder(
        itemCount: contacts.length,
        itemBuilder: (context, index) {
          final contact = contacts[index];
          return ContactCard(
            contact: contact,
            onDelete: () {
              setState(() {
                contacts.removeAt(index);
              });
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _showAddContactDialog,
        tooltip: 'Add Contact',
        child: const Icon(Icons.add),
      ),
    );
  }
}

class ContactCard extends StatefulWidget {
  final Contact contact;
  final VoidCallback onDelete;

  const ContactCard({
    Key? key,
    required this.contact,
    required this.onDelete,
  }) : super(key: key);

  @override
  State<ContactCard> createState() => _ContactCardState();
}

class _ContactCardState extends State<ContactCard> {
  bool _showEmail = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: Colors.blue,
          child: Text(
            widget.contact.avatarLetter,
            style: const TextStyle(color: Colors.white, fontSize: 18),
          ),
        ),
        title: Text(widget.contact.name),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 4),
            Text(widget.contact.phone),
            if (_showEmail)
              Padding(
                padding: const EdgeInsets.only(top: 4),
                child: Text(
                  widget.contact.email,
                  style: const TextStyle(color: Colors.blue),
                ),
              ),
          ],
        ),
        trailing: PopupMenuButton(
          itemBuilder: (context) => [
            PopupMenuItem(
              child: const Text('Delete'),
              onTap: widget.onDelete,
            ),
          ],
        ),
        onTap: () {
          setState(() {
            _showEmail = !_showEmail;
          });
        },
      ),
    );
  }
}

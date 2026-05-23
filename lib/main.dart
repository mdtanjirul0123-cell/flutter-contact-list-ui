import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Contact List',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      home: const ContactListScreen(),
    );
  }
}

class ContactListScreen extends StatelessWidget {
  const ContactListScreen({super.key});

  @override
  Widget build(BuildContext context) {

    List<Map<String, String>> contacts = [

      {
        "name": "Tanjirul",
        "phone": "01877-777777",
      },

      {
        "name": "Ferdous",
        "phone": "01673-777777",
      },

      {
        "name": "Hasan",
        "phone": "01745-777777",
      },

      {
        "name": "Hasan",
        "phone": "01745-777777",
      },

      {
        "name": "Hasan",
        "phone": "01745-777777",
      },
    ];

    return Scaffold(

      appBar: AppBar(
        centerTitle: true,

        backgroundColor: Colors.blueGrey,

        title: const Text(
          "Contact List",

          style: TextStyle(
            color: Colors.white,
            fontSize: 28,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),

      body: Padding(

        padding: const EdgeInsets.all(16),

        child: Column(
          children: [

            // Name Field
            TextFormField(

              decoration: InputDecoration(

                hintText: "Hasan",

                border: OutlineInputBorder(
                  borderRadius:
                      BorderRadius.circular(6),
                ),
              ),
            ),

            const SizedBox(height: 16),

            // Phone Field
            TextFormField(

              keyboardType:
                  TextInputType.phone,

              decoration: InputDecoration(

                hintText: "01745-777777",

                border: OutlineInputBorder(
                  borderRadius:
                      BorderRadius.circular(6),
                ),
              ),
            ),

            const SizedBox(height: 16),

            // Add Button
            SizedBox(

              width: double.infinity,
              height: 50,

              child: ElevatedButton(

                style: ElevatedButton.styleFrom(
                  backgroundColor:
                      Colors.blueGrey,
                ),

                onPressed: () {},

                child: const Text(
                  "Add",

                  style: TextStyle(
                    fontSize: 22,
                    color: Colors.white,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 24),

            // Contact List
            Expanded(

              child: ListView.builder(

                itemCount: contacts.length,

                itemBuilder: (context, index) {

                  final contact = contacts[index];

                  return Card(

                    elevation: 2,

                    margin:
                        const EdgeInsets.only(
                      bottom: 12,
                    ),

                    child: ListTile(

                      contentPadding:
                          const EdgeInsets.all(12),

                      leading: const Icon(
                        Icons.person,
                        size: 40,
                        color: Colors.brown,
                      ),

                      title: Text(
                        contact["name"]!,

                        style: const TextStyle(
                          fontSize: 28,
                          color: Colors.red,
                          fontWeight:
                              FontWeight.w500,
                        ),
                      ),

                      subtitle: Text(
                        contact["phone"]!,

                        style: const TextStyle(
                          fontSize: 22,
                        ),
                      ),

                      trailing: const Icon(
                        Icons.phone,
                        color: Colors.blue,
                        size: 36,
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

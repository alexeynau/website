import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CRM App'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Welcome to CRM App',
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16.0),
              const Text(
                'Manage your customers and sales with easy.',
                style: TextStyle(
                  fontSize: 16.0,
                ),
              ),
              const SizedBox(height: 32.0),
              Wrap(
                spacing: 16.0,
                runSpacing: 16.0,
                children: [
                  ElevatedButton.icon(
                    onPressed: () {
                      // Add your logic here
                    },
                    icon: const Icon(Icons.people),
                    label: const Text('Customers'),
                  ),
                  ElevatedButton.icon(
                    onPressed: () {
                      // Add your logic here
                    },
                    icon: const Icon(Icons.shopping_cart),
                    label: const Text('Sales'),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Wrap(
                  spacing: 16.0,
                  runSpacing: 16.0,
                  children: [
                    GridView.count(
                      crossAxisCount: 4,
                      shrinkWrap: true,
                      mainAxisSpacing: 16.0,
                      crossAxisSpacing: 16.0,
                      children: [
                        MockContainerItem(),
                        MockContainerItem(),
                        MockContainerItem(),
                        MockContainerItem(),
                        MockContainerItem(),
                        MockContainerItem(),
                        MockContainerItem(),
                        MockContainerItem(),
                        MockContainerItem(),
                        MockContainerItem(),
                        MockContainerItem(),
                        MockContainerItem(),
                        MockContainerItem(),
                        MockContainerItem(),
                        MockContainerItem(),
                        MockContainerItem(),

                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MockContainerItem extends StatelessWidget {
  const MockContainerItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 195, 164, 230),
        borderRadius: BorderRadius.circular(8.0),
       
        boxShadow: List.generate(
          4,
              (index) => BoxShadow(
            color: const Color.fromARGB(255, 3, 10, 15).withOpacity(0.5),
            blurRadius: 8.0,
            offset: const Offset(0, 4),
          ),
        ),
      ),
      child: const Center(
        child: Text('Item 1'),
      ),
    );
  }
}

import 'package:flutter/material.dart';

void main() => runApp(const MediCarePlusApp());

class MediCarePlusApp extends StatelessWidget {
  const MediCarePlusApp({super.key});
  @override
  Widget build(BuildContext c) => MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      useMaterial3: true,
      colorSchemeSeed: const Color(0xFF3B82F6),
    ),
    home: const CareApp(),
  );
}

class CareApp extends StatefulWidget {
  const CareApp({super.key});
  @override
  State<CareApp> createState() => _CareAppState();
}

class _CareAppState extends State<CareApp> {
  bool started = false;
  int tab = 0;
  final medicines = ['Metformin · 8:00 AM', 'Vitamin D3 · 2:00 PM'];
  @override
  Widget build(BuildContext c) {
    if (!started) {
      return Scaffold(
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(Icons.health_and_safety_rounded, size: 88),
              const SizedBox(height: 16),
              Text(
                'MediCare+',
                style: Theme.of(
                  c,
                ).textTheme.displaySmall?.copyWith(fontWeight: FontWeight.bold),
              ),
              const Text('Your Personal Smart Healthcare Companion'),
              const SizedBox(height: 24),
              FilledButton(
                onPressed: () => setState(() => started = true),
                child: const Text('Get started'),
              ),
            ],
          ),
        ),
      );
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(
          ['Home', 'Medicines', 'Appointments', 'Reports', 'Profile'][tab],
        ),
      ),
      body: _body(),
      bottomNavigationBar: NavigationBar(
        selectedIndex: tab,
        onDestinationSelected: (i) => setState(() => tab = i),
        destinations: const [
          NavigationDestination(icon: Icon(Icons.home), label: 'Home'),
          NavigationDestination(
            icon: Icon(Icons.medication),
            label: 'Medicines',
          ),
          NavigationDestination(icon: Icon(Icons.event), label: 'Appointments'),
          NavigationDestination(
            icon: Icon(Icons.description),
            label: 'Reports',
          ),
          NavigationDestination(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
    );
  }

  Widget _body() {
    switch (tab) {
      case 0:
        return ListView(
          padding: const EdgeInsets.all(20),
          children: [
            Text(
              'Good morning, Alex',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const Card(
              child: ListTile(
                title: Text('Health score · 86%'),
                subtitle: Text('Your care plan is on track today.'),
              ),
            ),
            const Card(
              child: ListTile(
                title: Text('Water intake · 5 / 8'),
                subtitle: Text('Keep hydrated today.'),
              ),
            ),
          ],
        );
      case 1:
        return ListView(
          padding: const EdgeInsets.all(20),
          children: [
            ...medicines.map(
              (m) => Card(
                child: CheckboxListTile(
                  value: false,
                  onChanged: (_) {},
                  title: Text(m),
                  subtitle: const Text('Record dose'),
                ),
              ),
            ),
            FilledButton(
              onPressed: () =>
                  setState(() => medicines.add('New medicine · time not set')),
              child: const Text('Add medicine'),
            ),
          ],
        );
      case 2:
        return ListView(
          padding: const EdgeInsets.all(20),
          children: [
            const Card(
              child: ListTile(
                title: Text('Dr. Sarah Wilson'),
                subtitle: Text('Cardiology · Tomorrow, 10:30 AM'),
              ),
            ),
            FilledButton(
              onPressed: () => _note('Appointment request saved.'),
              child: const Text('Book appointment'),
            ),
          ],
        );
      case 3:
        return ListView(
          padding: const EdgeInsets.all(20),
          children: [
            const Card(
              child: ListTile(
                title: Text('Blood test'),
                subtitle: Text('12 Apr 2026'),
              ),
            ),
            FilledButton(
              onPressed: () => _note('Connect storage before uploading files.'),
              child: const Text('Upload report'),
            ),
          ],
        );
      default:
        return ListView(
          padding: const EdgeInsets.all(20),
          children: [
            const CircleAvatar(radius: 40, child: Icon(Icons.person, size: 40)),
            const SizedBox(height: 12),
            const Text('Alex Morgan'),
            const Card(
              child: ListTile(title: Text('Blood group'), trailing: Text('O+')),
            ),
            FilledButton.tonal(
              onPressed: () => setState(() => started = false),
              child: const Text('Log out'),
            ),
          ],
        );
    }
  }

  void _note(String s) =>
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(s)));
}

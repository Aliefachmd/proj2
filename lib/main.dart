import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Persib Bandung',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SplashScreen(),
      routes: {
        '/main': (context) => MainPage(),
      },
    );
  }
}

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Container untuk gambar latar belakang
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('asset/2.jpg'), // Path gambar latar belakang
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Konten di atas gambar latar belakang
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'asset/1.png',
                  width: 150,
                  height: 150,
                ),
                SizedBox(height: 20),
                Text(
                  'PERSIB BANDUNG',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                Text(
                  'We Are Three Stars',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontFamily: 'QwitcherGrypenBold',
                  ),
                ),
                SizedBox(height: 50),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, '/main');
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.grey[800],
                    padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                    elevation: 5,
                    shadowColor: Colors.black54,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Text(
                    'MASUK',
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  String selectedLeague = 'BRI LIGA 1';

  final List<Map<String, String>> matches = [
    {'homeTeam': 'PERSIB', 'awayTeam': 'PERSIJA', 'league': 'BRI LIGA 1', 'date': 'Nov 25, 2024', 'time': '19:00'},
    {'homeTeam': 'PERSEBAYA', 'awayTeam': 'PERSIB', 'league': 'BRI LIGA 1', 'date': 'Dec 06, 2024', 'time': '19:00'},
    {'homeTeam': 'PERSIB', 'awayTeam': 'BORNEO', 'league': 'BRI LIGA 1', 'date': 'Dec 09, 2024', 'time': '15:00'},
    {'homeTeam': 'PERSIB', 'awayTeam': 'BALI UNITED', 'league': 'BRI LIGA 1', 'date': 'Dec 20, 2024', 'time': '19:30'},
    {'homeTeam': 'PSM', 'awayTeam': 'PERSIB', 'league': 'BRI LIGA 1', 'date': 'Dec 28, 2024', 'time': '20:00'},
    {'homeTeam': 'PERSIB', 'awayTeam': 'PORT FC', 'league': 'ACL2', 'date': 'Jan 10, 2025', 'time': '18:00'},
    {'homeTeam': 'ZHEJIANG', 'awayTeam': 'PERSIB', 'league': 'ACL2', 'date': 'Jan 20, 2025', 'time': '20:00'},
    {'homeTeam': 'PERSIB', 'awayTeam': 'LION CITY SAILORS', 'league': 'ACL2', 'date': 'Jan 20, 2025', 'time': '20:00'},
    {'homeTeam': 'LION CITY SAILORS', 'awayTeam': 'PERSIB', 'league': 'ACL2', 'date': 'Feb 20, 2025', 'time': '20:00'},
    {'homeTeam': 'PERSIB', 'awayTeam': 'ZHEJIANG', 'league': 'ACL2', 'date': 'Mar 20, 2025', 'time': '20:00'},
    {'homeTeam': 'PORT FC', 'awayTeam': 'PERSIB', 'league': 'ACL2', 'date': 'Apr 20, 2025', 'time': '20:00'},
  ];

  List<Map<String, String>> get filteredMatches {
    return matches.where((match) => match['league'] == selectedLeague).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 221, 220, 220),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          color: Colors.black,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Row(
          children: [
            Text(
              'PERSIB APPS',
              style: TextStyle(color: const Color.fromARGB(255, 0, 0, 0)),
            ),
            Spacer(),
            Image.asset(
              'asset/1.png',
              height: 40,
            ),
            SizedBox(width: 10),
          ],
        ),
      ),
      body: Column(
        children: [
          SizedBox(height: 8), //buat jarak 
          Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('SCHEDULE MATCH',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,)
            ),
          ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    selectedLeague = 'BRI LIGA 1';
                  });
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: selectedLeague == 'BRI LIGA 1' ? const Color.fromARGB(255, 3, 73, 131) : const Color.fromARGB(255, 255, 253, 253),
                ),
                child: Text('BRI LIGA 1',
                style: TextStyle(
                  color: selectedLeague == 'BRI LIGA 1' ? Color.fromARGB(255, 255, 255, 255) : const Color.fromARGB(255, 3, 73, 131),
                ),),

              ),
              SizedBox(width: 10),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    selectedLeague = 'ACL2';
                  });
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: selectedLeague == 'ACL2' ? const Color.fromARGB(255, 3, 73, 131) : const Color.fromARGB(255, 255, 255, 255),
                ),
                child: Text('ACL2',
                style: TextStyle(
                  color: selectedLeague == 'ACL2' ? Color.fromARGB(255, 255, 255, 255) : const Color.fromARGB(255, 3, 73, 131),
                ),),
              ),
            ],
          ),
          Expanded(
            child: ListView(
              children: filteredMatches.map((match) {
                return _buildMatchCard(
                  match['homeTeam']!,
                  match['awayTeam']!,
                  match['league']!,
                  match['date']!,
                  match['time']!,
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMatchCard(String homeTeam, String awayTeam, String league,
      String date, String time) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8),
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  children: [
                    Image.asset(
                      'asset/logo_$homeTeam.png',
                      width: 30,
                      height: 30,
                    ),
                    SizedBox(width: 8),
                    Text(
                      homeTeam,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
                Expanded(
                  child: Center(
                    child: Text(
                      'VS',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
                Row(
                  children: [
                    Text(
                      awayTeam,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(width: 8),
                    Image.asset(
                      'asset/logo_$awayTeam.png',
                      width: 30,
                      height: 30,
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(league, style: TextStyle(color: Colors.grey)),
                Text('$date  $time', style: TextStyle(color: Colors.grey)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

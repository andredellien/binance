import 'package:binance/WalletScreen.dart';
import 'package:binance/presentation/pages/TradeScreen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BinanceScreen(),
    );
  }
}

class BinanceScreen extends StatefulWidget {
  @override
  _BinanceScreenState createState() => _BinanceScreenState();
}

class _BinanceScreenState extends State<BinanceScreen> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF181A20), // Fondo oscuro
      appBar: AppBar(
        backgroundColor: Color(0xFF181A20),
        elevation: 0,
        title: Row(
          children: [
            CircleAvatar(
              backgroundColor: Colors.yellow,
              child: Icon(Icons.currency_bitcoin, color: Colors.black),
            ),
            SizedBox(width: 8),
            Expanded(
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'SOL',
                  hintStyle: TextStyle(color: Colors.grey),
                  filled: true,
                  fillColor: Color(0xFF1E1F25),
                  contentPadding: EdgeInsets.symmetric(horizontal: 10),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
            ),
            SizedBox(width: 8),
            Icon(Icons.qr_code_scanner, color: Colors.white),
          ],
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Icon(Icons.notifications, color: Colors.white),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Stack(
              children: [
                Icon(Icons.chat_bubble_outline, color: Colors.white),
                Positioned(
                  right: 0,
                  child: CircleAvatar(
                    radius: 10,
                    backgroundColor: Colors.yellow,
                    child: Text(
                      '99+',
                      style: TextStyle(fontSize: 10, color: Colors.black),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Icon(Icons.link, color: Colors.white),
          ),
        ],
      ),
      body: _selectedIndex == 2
          ? TradeScreen()
          : _selectedIndex == 4
              ? WalletScreen()
              : HomeScreen(), // Muestra TradeScreen al seleccionar Trade
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Color(0xFF181A20), // Fondo oscuro
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        selectedItemColor:
            Colors.white, // Color blanco para el ícono y texto seleccionado
        unselectedItemColor: Color(
            0xFF707070), // Gris claro para íconos y texto no seleccionados
        type: BottomNavigationBarType.fixed, // Mantiene el fondo sin cambios
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Inicio',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.show_chart),
            label: 'Mercados',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.swap_horiz),
            label: 'Trade',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.trending_up),
            label: 'Futuros',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_balance_wallet),
            label: 'Billeteras',
          ),
        ],
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        children: [
          SizedBox(height: 16),
          Row(
            children: [
              Text(
                'Balance total (BTC)',
                style: TextStyle(color: Colors.white),
              ),
              Icon(Icons.arrow_drop_down, color: Colors.white),
            ],
          ),
          Text(
            '0.00002201',
            style: TextStyle(fontSize: 32, color: Colors.white),
          ),
          Text(
            '≈ \$1.62',
            style: TextStyle(color: Colors.grey),
          ),
          SizedBox(height: 16),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              foregroundColor: Colors.black,
              backgroundColor: Colors.yellow,
              padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            onPressed: () {},
            child: Text('Agregar fondos'),
          ),
          SizedBox(height: 16),
          TabBarSection(),
        ],
      ),
    );
  }
}

class TabBarSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: DefaultTabController(
        length: 5,
        child: Column(
          children: [
            TabBar(
              indicatorColor: Colors.yellow,
              labelColor: Colors.white,
              unselectedLabelColor: Colors.grey,
              tabs: [
                Tab(text: 'Favoritos'),
                Tab(text: 'Hot'),
                Tab(text: 'Ganadores'),
                Tab(text: 'Perdedores'),
                Tab(text: 'Nuevos'),
              ],
            ),
            Expanded(
              child: TabBarView(
                children: [
                  Container(), // Placeholder for 'Favoritos'
                  CurrencyListView(),
                  Container(), // Placeholder for 'Ganadores'
                  Container(), // Placeholder for 'Perdedores'
                  Container(), // Placeholder for 'Nuevos'
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CurrencyListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        CurrencyTile('BNB', '582.17', '+4.94%'),
        CurrencyTile('BTC', '73,918.56', '+8.62%'),
        CurrencyTile('ETH', '2,583.98', '+7.08%'),
        CurrencyTile('SOL', '181.23', '+14.20%'),
        CurrencyTile('DOGE', '0.20548', '+26.61%'),
        CurrencyTile('WLD', '1.940', '+14.66%'),
      ],
    );
  }
}

class CurrencyTile extends StatelessWidget {
  final String name;
  final String price;
  final String change;

  CurrencyTile(this.name, this.price, this.change);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.symmetric(vertical: 8.0),
      leading: Icon(Icons.local_fire_department, color: Colors.yellow),
      title: Text(name, style: TextStyle(color: Colors.white)),
      subtitle: Text(
        '\$$price',
        style: TextStyle(color: Colors.grey),
      ),
      trailing: Container(
        padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        decoration: BoxDecoration(
          color: Color(0xFF2A9D8F),
          borderRadius: BorderRadius.circular(4),
        ),
        child: Text(
          change,
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}

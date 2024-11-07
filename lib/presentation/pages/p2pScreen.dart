import 'package:flutter/material.dart';

class P2PScreen extends StatefulWidget {
  @override
  _P2PScreenState createState() => _P2PScreenState();
}

class _P2PScreenState extends State<P2PScreen> {
  int selectedTabIndex = 0; // 0 para P2P, 1 para Rápido

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF181A20),
      appBar: AppBar(
        backgroundColor: Color(0xFF181A20),
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context); // Regresa a la pantalla anterior
          },
        ),
        title: Row(
          children: [
            GestureDetector(
              onTap: () {
                setState(() {
                  selectedTabIndex = 0; // Cambia a la pestaña P2P
                });
              },
              child: Text(
                "P2P",
                style: TextStyle(
                  color: selectedTabIndex == 0 ? Colors.white : Colors.grey,
                  fontSize: 18,
                  fontWeight: selectedTabIndex == 0
                      ? FontWeight.bold
                      : FontWeight.normal,
                ),
              ),
            ),
            SizedBox(width: 8),
            GestureDetector(
              onTap: () {
                setState(() {
                  selectedTabIndex = 1; // Cambia a la pestaña Rápido
                });
              },
              child: Text(
                "Rápido",
                style: TextStyle(
                  color: selectedTabIndex == 1 ? Colors.white : Colors.grey,
                  fontSize: 18,
                  fontWeight: selectedTabIndex == 1
                      ? FontWeight.bold
                      : FontWeight.normal,
                ),
              ),
            ),
          ],
        ),
        actions: [
          DropdownButton<String>(
            dropdownColor: Color(0xFF181A20),
            value: "BOB",
            icon: Icon(Icons.arrow_drop_down, color: Colors.white),
            items: <String>['BOB', 'USD', 'EUR'].map((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value, style: TextStyle(color: Colors.white)),
              );
            }).toList(),
            onChanged: (_) {},
          ),
          Icon(Icons.notifications, color: Colors.white),
          SizedBox(width: 16),
          Icon(Icons.more_vert, color: Colors.white),
          SizedBox(width: 8),
        ],
      ),
      body: selectedTabIndex == 0 ? _buildP2PContent() : _buildRapidoContent(),
    );
  }

  Widget _buildP2PContent() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Tabs for Comprar and Vender
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text('Comprar',
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold)),
              Text('Vender', style: TextStyle(color: Colors.grey)),
            ],
          ),
          SizedBox(height: 16),
          // Filter Row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('USDT', style: TextStyle(color: Colors.white)),
              Text('Cantidad', style: TextStyle(color: Colors.white)),
              Text('Pago', style: TextStyle(color: Colors.white)),
              Text('BOB', style: TextStyle(color: Colors.white)),
            ],
          ),
          SizedBox(height: 16),
          Expanded(
            child: ListView(
              children: [
                _buildP2PItem('Criptokawai_uwu', '87.10%', '98.55%', '10.54',
                    '1,040.00 - 1,051.89 BOB', '99.8 USDT', 'Banco Union'),
                _buildP2PItem(
                    'expertis_crypto',
                    '100.00%',
                    '95.08%',
                    '10.54',
                    '2,052.00 - 2,055.40 BOB',
                    '195.01 USDT',
                    'Banco Mercantil'),
                _buildP2PItem('andre_crypto', '100.00%', '93.08%', '11.54',
                    '2,052.00 - 4,055.40 BOB', '197.01 USDT', 'Banco Bisa'),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRapidoContent() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Tabs for Comprar and Vender
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text('Comprar',
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold)),
              Text('Vender', style: TextStyle(color: Colors.grey)),
            ],
          ),
          SizedBox(height: 16),
          // Selección de moneda
          Row(
            children: [
              Icon(Icons.currency_exchange, color: Colors.tealAccent, size: 18),
              SizedBox(width: 8),
              Text('USDT', style: TextStyle(color: Colors.white)),
            ],
          ),
          SizedBox(height: 16),
          // Quiero comprar sección
          Container(
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Color(0xFF1E1F25),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Quiero comprar', style: TextStyle(color: Colors.white)),
                SizedBox(height: 8),
                TextField(
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    hintText: 'Bs. Por encima de 35',
                    hintStyle: TextStyle(color: Colors.grey),
                    filled: true,
                    fillColor: Color(0xFF2C2F36),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide.none,
                    ),
                  ),
                  keyboardType: TextInputType.number,
                ),
                SizedBox(height: 8),
                Text('1 USDT ≈ BOB 10.54',
                    style: TextStyle(color: Colors.grey, fontSize: 12)),
                SizedBox(height: 16),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    padding: EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  onPressed: () {
                    // Acción de seleccionar forma de pago
                  },
                  child: Center(
                    child: Text('Seleccionar forma de pago',
                        style: TextStyle(color: Colors.white)),
                  ),
                ),
                SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.security, color: Colors.grey, size: 16),
                    SizedBox(width: 4),
                    Text('Pago seguro',
                        style: TextStyle(color: Colors.grey, fontSize: 12)),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildP2PItem(
    String username,
    String rating,
    String feedback,
    String price,
    String limit,
    String available,
    String bankDetails,
  ) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      decoration: BoxDecoration(
        color: Color(0xFF1E1F25),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.grey,
                    child: Text(
                      username[0],
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  SizedBox(width: 8),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(username, style: TextStyle(color: Colors.white)),
                      Text(
                        'Comercio(s) $rating | $feedback',
                        style: TextStyle(color: Colors.grey, fontSize: 10),
                      ),
                    ],
                  ),
                ],
              ),
              Text(bankDetails,
                  style: TextStyle(color: Colors.grey, fontSize: 12)),
            ],
          ),
          SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Bs. $price /USDT',
                  style: TextStyle(color: Colors.white, fontSize: 20)),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  padding: EdgeInsets.symmetric(horizontal: 24, vertical: 8),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                onPressed: () {
                  // Acción de comprar
                },
                child: Text('Comprar', style: TextStyle(color: Colors.white)),
              ),
            ],
          ),
          SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Límite $limit',
                  style: TextStyle(color: Colors.grey, fontSize: 11)),
              Text(available.isNotEmpty ? 'Disponible $available' : '',
                  style: TextStyle(color: Colors.grey, fontSize: 11)),
            ],
          ),
        ],
      ),
    );
  }
}

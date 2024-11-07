import 'package:flutter/material.dart';

class RapidoScreen extends StatelessWidget {
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
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text("P2P", style: TextStyle(color: Colors.grey, fontSize: 18)),
            SizedBox(width: 8),
            Text("Rápido",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold)),
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
          Icon(Icons.history, color: Colors.white),
          SizedBox(width: 16),
          Icon(Icons.more_vert, color: Colors.white),
          SizedBox(width: 8),
        ],
      ),
      body: Padding(
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
                Icon(Icons.currency_exchange,
                    color: Colors.tealAccent, size: 18),
                SizedBox(width: 8),
                DropdownButton<String>(
                  dropdownColor: Color(0xFF181A20),
                  value: "USDT",
                  icon: Icon(Icons.arrow_drop_down, color: Colors.white),
                  items: <String>['USDT', 'BTC', 'ETH'].map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value, style: TextStyle(color: Colors.white)),
                    );
                  }).toList(),
                  onChanged: (_) {},
                ),
              ],
            ),
            SizedBox(height: 16),

            // Cuadro de "Quiero comprar"
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
                  Text(
                    '1 USDT ≈ BOB 10.54',
                    style: TextStyle(color: Colors.grey, fontSize: 12),
                  ),
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
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Acción para ayuda
        },
        backgroundColor: Color(0xFF1E1F25),
        child: Icon(Icons.help_outline, color: Colors.white),
      ),
    );
  }
}

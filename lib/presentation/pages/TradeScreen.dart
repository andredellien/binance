import 'package:flutter/material.dart';

class TradeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text('Convertir',
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold)),
              Text('Spot', style: TextStyle(color: Colors.grey)),
              Text('Margin', style: TextStyle(color: Colors.grey)),
              Text('Comprar/Vender', style: TextStyle(color: Colors.grey)),
              Text('Bots', style: TextStyle(color: Colors.grey)),
            ],
          ),
          SizedBox(height: 16),
          Text('Market', style: TextStyle(color: Colors.white)),
          SizedBox(height: 8),
          Container(
            padding: EdgeInsets.all(16),
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
                        Icon(Icons.currency_bitcoin, color: Colors.white),
                        SizedBox(width: 8),
                        Text("ETHW", style: TextStyle(color: Colors.white)),
                      ],
                    ),
                    Text("Disponible 0.53118267 ETHW",
                        style: TextStyle(color: Colors.grey)),
                  ],
                ),
                SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("4 - 2500",
                        style: TextStyle(color: Colors.grey, fontSize: 24)),
                    Text("Máx.", style: TextStyle(color: Colors.yellow)),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: 16),
          Container(
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Color(0xFF1E1F25),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(Icons.currency_exchange, color: Colors.white),
                    SizedBox(width: 8),
                    Text("USDT", style: TextStyle(color: Colors.white)),
                  ],
                ),
                Text("12 - 10000",
                    style: TextStyle(color: Colors.grey, fontSize: 24)),
              ],
            ),
          ),
          SizedBox(height: 16),
          Container(
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Color(0xFF3A3A3A),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(
              "¡Advertencia! Este token se considera de alto riesgo. Actualmente el token ETHW solo se puede convertir a USDT.",
              style: TextStyle(color: Colors.white),
            ),
          ),
          SizedBox(height: 16),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Color(0xFFB2892D),
              padding: EdgeInsets.symmetric(vertical: 16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            onPressed: () {},
            child: Text('Trade', style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );
  }
}

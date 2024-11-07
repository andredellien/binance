import 'package:binance/presentation/pages/p2pScreen.dart';
import 'package:flutter/material.dart';

class WalletScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Tabs for "Exchange" and "Web3"
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Exchange',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              Text(
                'Web3',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 16,
                ),
              ),
            ],
          ),
          SizedBox(height: 16),

          // Navigation tabs for "Resumen", "Spot", "Fondos", etc.
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text('Resumen', style: TextStyle(color: Colors.grey)),
              Text('Spot', style: TextStyle(color: Colors.grey)),
              Text('Fondos',
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold)),
              Text('Earn', style: TextStyle(color: Colors.grey)),
              Text('Futuros', style: TextStyle(color: Colors.grey)),
              Text('Margin', style: TextStyle(color: Colors.grey)),
            ],
          ),
          SizedBox(height: 16),

          // Balance total section
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Text(
                    'Balance total',
                    style: TextStyle(color: Colors.white),
                  ),
                  SizedBox(width: 4),
                  Icon(Icons.visibility, color: Colors.grey, size: 16),
                ],
              ),
              Icon(Icons.more_vert, color: Colors.grey),
            ],
          ),
          SizedBox(height: 8),
          Text(
            '0.00 BTC',
            style: TextStyle(fontSize: 32, color: Colors.white),
          ),

          // Action buttons for "Depositar", "Retirar", "Transferir"
          SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
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
                child: Text('Depositar'),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Color(0xFF1E1F25),
                  padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                onPressed: () {},
                child: Text('Retirar'),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Color(0xFF1E1F25),
                  padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                onPressed: () {},
                child: Text('Transferir'),
              ),
            ],
          ),

          // Additional options (P2P, Pay, Gift Card, Pool)
          SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildIconOption(
                Icons.people,
                'P2P',
                () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => P2PScreen()),
                  );
                },
              ),
              _buildIconOption(Icons.payment, 'Pay', () {}),
              _buildIconOption(Icons.card_giftcard, 'Gift Card', () {}),
              _buildIconOption(Icons.pool, 'Pool', () {}),
            ],
          ),

          // Balance list
          SizedBox(height: 24),
          Text('Balances', style: TextStyle(color: Colors.white)),
          SizedBox(height: 16),
          _buildBalanceTile('USDT', 'TetherUS', '0.00', '0.00', '0.00'),
          _buildBalanceTile('BTC', 'Bitcoin', '0.00', '0.00', '0.00'),
          _buildBalanceTile('BNB', 'BNB', '0.00', '0.00', '0.00'),
        ],
      ),
    );
  }

  Widget _buildIconOption(
      IconData iconData, String label, VoidCallback onPressed) {
    return Column(
      children: [
        GestureDetector(
          onTap: onPressed,
          child: Container(
            padding: EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Color(0xFF1E1F25),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(iconData, color: Colors.white),
          ),
        ),
        SizedBox(height: 8),
        Text(label, style: TextStyle(color: Colors.white)),
      ],
    );
  }

  Widget _buildBalanceTile(String symbol, String name, String total,
      String available, String frozen) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Icon(Icons.currency_bitcoin, color: Colors.white),
              SizedBox(width: 8),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(symbol, style: TextStyle(color: Colors.white)),
                  Text(name,
                      style: TextStyle(color: Colors.grey, fontSize: 12)),
                  Text('Disponible',
                      style: TextStyle(color: Colors.grey, fontSize: 12)),
                  Text('Congelado',
                      style: TextStyle(color: Colors.grey, fontSize: 12)),
                ],
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(total, style: TextStyle(color: Colors.white)),
              Text(available,
                  style: TextStyle(color: Colors.grey, fontSize: 12)),
              Text(frozen, style: TextStyle(color: Colors.grey, fontSize: 12)),
            ],
          ),
        ],
      ),
    );
  }
}

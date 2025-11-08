import 'package:flutter/material.dart';
import '../widgets/atm_card.dart';
import '../widgets/transaction_item.dart';
import '../models/transaction.dart';
import '../widgets/grid_menu_item.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final transactions = [
      TransactionModel('Coffee Shop', '-Rp35.000', 'Food'),
      TransactionModel('Grab Ride', '-Rp25.000', 'Travel'),
      TransactionModel('Gym Membership', '-Rp150.000', 'Health'),
      TransactionModel('Movie Ticket', '-Rp60.000', 'Event'),
      TransactionModel('Salary', '+Rp5.000.000', 'Income'),
    ];

    return Scaffold(
      backgroundColor: const Color(0xfff4f7ff),

      appBar: AppBar(
        title: const Text(
          'Finance Mate',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: const Color(0xff0a3a8d),
        foregroundColor: Colors.white,
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            const Text(
              'My Cards',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: Color(0xff0a3a8d),
              ),
            ),
            const SizedBox(height: 14),

            SizedBox(
              height: 210,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: const [
                  AtmCard(
                    bankName: 'Bank A',
                    cardNumber: '**** 2345',
                    balance: 'Rp12.500.000',
                    color1: Color(0xff0a3a8d),
                    color2: Color(0xff4f9dfd),
                  ),
                  AtmCard(
                    bankName: 'Bank B',
                    cardNumber: '**** 8765',
                    balance: 'Rp5.350.000',
                    color1: Color(0xff4f9dfd),
                    color2: Color(0xff0a3a8d),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 28),

            const Text(
              'Categories',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: Color(0xff0a3a8d),
              ),
            ),
            const SizedBox(height: 14),

            GridView.count(
              crossAxisCount: 2,
              shrinkWrap: true,
              crossAxisSpacing: 18,
              mainAxisSpacing: 18,
              physics: const NeverScrollableScrollPhysics(),
              children: const [
                GridMenuItem(
                  icon: Icons.health_and_safety,
                  label: 'Health',
                  color: Color(0xff0a3a8d),
                ),
                GridMenuItem(
                  icon: Icons.travel_explore,
                  label: 'Travel',
                  color: Color(0xff0a3a8d),
                ),
                GridMenuItem(
                  icon: Icons.fastfood,
                  label: 'Food',
                  color: Color(0xff0a3a8d),
                ),
                GridMenuItem(
                  icon: Icons.event,
                  label: 'Event',
                  color: Color(0xff0a3a8d),
                ),
              ],
            ),

            const SizedBox(height: 28),

            const Text(
              'Recent Transactions',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: Color(0xff0a3a8d),
              ),
            ),
            const SizedBox(height: 12),

            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: transactions.length,
              itemBuilder: (context, index) {
                return TransactionItem(
                  transaction: transactions[index],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

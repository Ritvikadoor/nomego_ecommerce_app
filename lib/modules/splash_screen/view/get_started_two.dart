import 'package:flutter/material.dart';
import 'package:nomego_ecommerce_app/modules/auth/view/auth_screens.dart';

class GetStartedTwo extends StatelessWidget {
  const GetStartedTwo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          const SizedBox(
            height: 200,
          ),
          Container(
            height: 250,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                    'assets/d544ba41-973c-4c06-8b9a-d0fb7a8cd894-removebg-preview.png'),
              ),
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                'Robotic Assistance',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 24,
                    fontWeight: FontWeight.w800),
              ),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  'Get all your cleared through our chottu robotic assistance with easy and transperant service after sales and in every trouble you face',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w400),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Row(
                      children: [
                        Text(
                          ".",
                          style: TextStyle(
                              fontSize: 100, color: Colors.purple.shade100),
                        ),
                        const Text(
                          ".",
                          style: TextStyle(fontSize: 100, color: Colors.purple),
                        ),
                        Text(
                          ".",
                          style: TextStyle(
                              fontSize: 100, color: Colors.purple.shade100),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 20),
                      child: ElevatedButton(
                        onPressed: () => const AuthScreen(),
                        child: const Text(
                          'Next',
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

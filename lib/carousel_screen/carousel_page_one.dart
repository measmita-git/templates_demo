import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CarouselPageOne extends StatelessWidget {
  const CarouselPageOne({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: 340,
        height: 600,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Color(0xFF1685F8),
        ),
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.only(top: 47),
              child: SizedBox(
                width: 42,
                height: 22,
                child: Text(
                  'Basic',
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 16,
                    color: Color(0xFFFFFFFF),
                  ),
                ),
              ),
            ),
            const Padding(
              padding:
                  EdgeInsets.only(top: 15),
              child: SizedBox(
                width: 93,
                height: 49,

                child: Text(
                  '\$1.25',
                  style: TextStyle(
                    fontWeight: FontWeight.w800,
                    fontSize: 34,
                    color: Color(0xFFFFFFFF),
                  ),
                ),
              ),
            ),
             Padding(
              padding: EdgeInsets.only(top:30 ,left: 24, right: 24),
              child: Container(


                child:  Column(
                  children: [
                    ListTile(
                      title: Text(
                        '• 1 Paid Registration Type ',
                        style: TextStyle(
                          color: Color(0xFFFFFFFF),
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    ListTile(
                      title: Text(
                        '• Cancellation & Refunds',
                        style: TextStyle(
                            color: Color(0xFFFFFFFF),
                            fontWeight: FontWeight.w500,
                            fontSize: 16),
                      ),
                    ),
                    ListTile(
                      title: Text('• Facebook Conversations',
                          style: TextStyle(color: Color(0xFFFFFFFF))),
                    ),
                    ListTile(
                      title: Text(
                        '• Use your own payment gateway',
                        style: TextStyle(
                            color: Color(0xFFFFFFFF),
                            fontWeight: FontWeight.w500,
                            fontSize: 16),

                      ),
                    ),
                    ListTile(
                      title: Text(
                        '• Basic Attendee Self-Service',
                        style: TextStyle(
                          color: Color(0xFFFFFFFF),
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 70),
              child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFFFFFFFF),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                    padding:
                        const EdgeInsets.symmetric(horizontal: 70, vertical: 20),
                  ),
                  child:  const Padding(
                    padding: EdgeInsets.only(left: 18.0,right: 18.0),
                    child: Text(
                      'Get Started',
                      style: TextStyle(
                        color: Color(0xFF303030),
                        fontWeight: FontWeight.w700,
                        fontSize: 16,
                      ),
                    ),
                  )),
            ),
          ],
        ),
      ),
    );
  }
}

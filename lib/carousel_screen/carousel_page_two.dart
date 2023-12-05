import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CarouselPageTwo extends StatelessWidget {
  const CarouselPageTwo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Center(
        child: Container(
          width: 340,
          height: 600,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Color(0xFFFFFFFF),
          ),
          child: Column(
            children: [
             Padding(
                padding: EdgeInsets.only(right: 89,left: 90),
                child:  SizedBox(
                  width: 161,
                  height: 22,

                  child: Row(
                    children: [
                      Text(
                        'Pro',
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                      ),
                      Text(
                        '(Recommended)',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            color: Color(0xFF1685F8)),
                      ),
                    ],
                  ),
                ),
              ),
              const Padding(
                padding:  EdgeInsets.only(top: 18),
                child: SizedBox(
                    width: 93,
                    height: 49,
                    child: Text(
                      '\$1.25',
                      style: TextStyle(fontWeight: FontWeight.w800, fontSize: 34),
                    )),
              ),
               Padding(
                padding: EdgeInsets.only(top: 27,left: 24,right: 24),
                child: Container(

                  child:  Column(
                    children: [
                      ListTile(
                        title: Text(
                          '• Unlimited Registration Type',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w500),
                        ),
                      ),
                      ListTile(
                          title: Text(
                        '• Cancellation & Refunds',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w500),
                      )),
                      ListTile(
                        title: Text(
                          '• 1000 Email Invites',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w500),
                        ),
                      ),
                      ListTile(
                        title: Text(
                          '• Advance Cross-Events Analytics',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w500),
                        ),
                      ),
                      ListTile(
                        title: Text(
                          '• Advanced Attendee Self-Service',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w500),
                        ),
                      ),
                      ListTile(
                        title: Text('• Discount Codes',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500),),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 30),
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF1685F8),
                    padding: EdgeInsets.symmetric(horizontal: 70, vertical: 20),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                  ),
                  child:  const Padding(
                    padding:EdgeInsets.only(left: 18.0,right: 18.0),
                    child: Text(
                      'Get Started',
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

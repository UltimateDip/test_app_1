import 'package:flutter/material.dart';

class PaymentPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.only(
          left: 25,
          right: 25
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 25.0),
              child: Center(
                child: Container(
                  height: 150,
                  width: 150,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(
                        'images/payment_page.png',
                      ),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
            ),
            Center(
              child: RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text:"Payment",
                      style: TextStyle(
                        color: Color(0xffffc1fa),
                        fontWeight: FontWeight.bold,
                        fontSize: 26,
                      ),
                    ),
                    TextSpan(
                      text:" Successful",
                      style: TextStyle(
                        color: Color(0xfff09ae9),
                        fontWeight: FontWeight.bold,
                        fontSize: 28,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Center(
              child: RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text:" Your order will be delivered by 30 min.",
                      style: TextStyle(
                        color: Color(0xff006a71),
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Center(
              child: RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text:" Be ready with your OTP.",
                      style: TextStyle(
                        color: Color(0xff8675a9),
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

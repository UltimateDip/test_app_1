import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test_app_1/foodmenu_page.dart';
import 'package:test_app_1/payment_page.dart';
import 'payment_page.dart';

class DetailedFoodItem extends StatefulWidget {
  static const String id = 'detailed_food_item';

  DetailedFoodItem({this.heroTag, this.foodName, this.foodPrice});
  final heroTag;
  final foodName;
  final foodPrice;

  @override
  _DetailedFoodItemState createState() => _DetailedFoodItemState();
}

class _DetailedFoodItemState extends State<DetailedFoodItem> {
  var counter = 1;
  var selectedCard = 'CALORIES';


  @override
  Widget build(BuildContext context) {
    var totalPrice = (int.parse(widget.foodPrice) * counter);

    final deviceSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color(0xff202040),
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          color: Colors.white,
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => FoodMenuPage(),
            ));
          },
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          'Details',
          style: TextStyle(fontSize: 18, color: Colors.white),
        ),
        centerTitle: true,

      ),
      body: ListView(
        children: <Widget>[
          Stack(
            children: <Widget>[
              Container(
                height: deviceSize.height - 82,
                width: deviceSize.width,
                color: Colors.transparent,
              ),
              Positioned(
                top: 35,
                child: Container(
                  height: deviceSize.height - 100,
                  width: deviceSize.width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(45),
                        topLeft: Radius.circular(45)),
                    color: Colors.white,
                  ),
                ),
              ),
              Positioned(
                top: 10,
                left: (deviceSize.width / 2) - 78,
                child: Hero(
                  tag: widget.heroTag,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      image: DecorationImage(
                          image: AssetImage(widget.heroTag), fit: BoxFit.cover),
                    ),
                    height: 150,
                    width: 150,
                  ),
                ),
              ),
              Positioned(
                top: 200,
                child: Center(
                  child: Container(
                    width: deviceSize.width,
                    color: Colors.transparent,
                    child: Column(
                      children: <Widget>[
                        Text(
                          widget.foodName,
                          style: TextStyle(
                            color: Color(0xff000000),
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            top: 25,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              Container(
                                decoration: BoxDecoration(
                                  color: Colors.transparent,
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(45),
                                  ),
                                ),
                                child: Text(
                                  'Rs. ' + widget.foodPrice + '/-',
                                  style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600),
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  color: Color(0xfff09ae9),
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(10),
                                  ),
                                ),
                                child: Row(
                                  children: <Widget>[
                                    IconButton(
                                        icon: Icon(Icons.do_not_disturb_on),
                                        onPressed: () {
                                          if (counter > 1)
                                            setState(() {
                                              counter--;
                                            });
                                        }),
                                    Text(
                                      counter.toString(),
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 18,
                                          fontWeight: FontWeight.w600),
                                    ),
                                    IconButton(
                                        icon: Icon(Icons.add_circle),
                                        onPressed: () {
                                          setState(() {
                                            counter++;
                                          });
                                        }),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 40,
                        ),
                        Text(
                          'Total Price =' + totalPrice.toString() + '/-',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          height: 80,
                          child: ListView(
                            scrollDirection: Axis.horizontal,
                            children: <Widget>[
                              _buildInfoCard('CALORIES', '250', 'CAL'),
                              SizedBox(
                                width: 10,
                              ),
                              _buildInfoCard('WEIGHT', '267', 'G'),
                              SizedBox(
                                width: 10,
                              ),
                              _buildInfoCard('VITAMINS', 'A', 'VIT'),
                              SizedBox(
                                width: 10,
                              ),
                              _buildInfoCard('AVAIL', 'NO', 'AV'),
                              SizedBox(
                                width: 10,
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        GestureDetector(
                          onTap: (){
                              Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => PaymentPage(),
                              ));
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(50),
                                bottomRight: Radius.circular(50),
                                topLeft: Radius.circular(10),
                                topRight: Radius.circular(10),
                              ),
                            ),
                            height: 100,
                            width: deviceSize.width -20,
                            child: Center(
                              child: Text(
                                'BUY NOW',
                                style: TextStyle(
                                    fontFamily: 'Montserrat',
                                    fontSize: 22,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

//Reusable infoCards

  Widget _buildInfoCard(String cardTitle, String info, String unit) {
    return InkWell(
      onTap: () {
        selectCard(cardTitle);
      },
      child: AnimatedContainer(
        duration: Duration(milliseconds: 500),
        curve: Curves.easeIn,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color:
              cardTitle == selectedCard ? Color(0xff7a9bee) : Color(0xffffffff),
          border: Border.all(
              color: cardTitle == selectedCard
                  ? Colors.transparent
                  : Colors.grey.withOpacity(0.3),
              style: BorderStyle.solid,
              width: 0.75),
        ),
        height: 80,
        width: 100,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                info,
                style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontSize: 12,
                    color:
                        cardTitle == selectedCard ? Colors.white : Colors.black,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Text(
              unit,
              style: TextStyle(
                  fontFamily: 'Montserrat',
                  fontSize: 12,
                  color:
                      cardTitle == selectedCard ? Colors.white : Colors.black,
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }

  selectCard(cardTitle) {
    setState(() {
      selectedCard = cardTitle;
    });
  }
}

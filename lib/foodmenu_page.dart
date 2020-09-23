import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test_app_1/detailed_food_items.dart';
import 'package:test_app_1/payment_page.dart';
import 'package:test_app_1/welcome_screen.dart';


class FoodMenuPage extends StatefulWidget {
  static const String id = 'food_menu_screen';

  @override
  _FoodMenuPageState createState() => _FoodMenuPageState();
}

class _FoodMenuPageState extends State<FoodMenuPage> {

  bool themeSwitch=false;
  dynamic themeColors(){
    if(themeSwitch){
      return Color(0xff1dd3bd) ;
    }
    else
      return Color(0xff202040);
  }
  bool value = true;
  int totalItemsInCart = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: themeColors(),
      body: ListView(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: 15, left: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                IconButton(
                  icon: Icon(Icons.arrow_back_ios),
                  color: Colors.white,
                  onPressed: () {
                    Navigator.pushNamed(context, WelcomeScreen.id);
                  },
                ),
                Container(
                  width: 125,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      IconButton(
                        icon: themeSwitch?
                        Icon(Icons.brightness_3,color: Colors.white,)
                            :
                        Icon(Icons.wb_sunny,color: Colors.white,)
                        ,
                        onPressed: () {
                          setState(() {
                            themeSwitch =!themeSwitch;
                          });
                        },
                      ),
                      IconButton(
                        icon: Icon(Icons.menu),
                        color: Colors.white,
                        onPressed: () {
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 25,
          ),
          Padding(
            padding: EdgeInsets.only(left: 40),
            child: RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: "Food",
                    style: TextStyle(
                      color: Color(0xfff09ae9),
                      fontWeight: FontWeight.bold,
                      fontSize: 32,
                    ),
                  ),
                  TextSpan(
                    text: " List",
                    style: TextStyle(
                      color: Color(0xffffffff),
                      fontWeight: FontWeight.bold,
                      fontSize: 33,
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 40,
          ),
          Container(
            height: MediaQuery.of(context).size.height - 185.0,
            decoration: BoxDecoration(
              color: Color(0xffffffff),
              borderRadius: BorderRadius.only(topLeft: Radius.circular(75)),
            ),
            child: ListView(
              primary: false,
              padding: EdgeInsets.only(left: 25, right: 20),
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(top: 45),
                  child: Container(
                    height: MediaQuery.of(context).size.height - 300,
                    child: ListView(
                      children: <Widget>[
                        _buildFoodItem(
                            context, 'images/pizza.jpg', 'Cheese Pizza', '180'),
                        _buildFoodItem(context, 'images/burger.jpg',
                            'Infinity Burger', '50'),
                        _buildFoodItem(context, 'images/corn.jpg',
                            'Desi Masala Corn', '25'),
                        _buildFoodItem(context, 'images/roasted.jpg',
                            'Eternal Salad', '40'),
                        _buildFoodItem(
                            context, 'images/pork.png', 'Pork Barbeque', '80'),
                      ],
                    ),
                  ),
                ),
                Container(
                  height: 60,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30),
                          topRight: Radius.circular(30)),
                      color: Color(
                        0xffffffff,
                      )),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      GestureDetector(
                        onTap: () {
                          showModalBottomSheet(
                              context: context, builder: _searchFoodScreen);
                        },
                        child: Container(
                          height: 65,
                          width: 65,
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color: Colors.grey,
                                  style: BorderStyle.solid,
                                  width: 1),
                              borderRadius: BorderRadius.circular(20)),
                          child: Center(
                            child: Icon(
                              Icons.search,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: (){
                          if(totalItemsInCart>0){
                            setState(() {
                              totalItemsInCart--;
                            });
                          }
                        },
                        child: Container(
                          height: 65,
                          width: 65,
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color: Colors.grey,
                                  style: BorderStyle.solid,
                                  width: 1),
                              borderRadius: BorderRadius.circular(20)),
                          child: Column(
                            children: <Widget>[
                              Text(
                                totalItemsInCart.toString(),
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w900,
                                ),
                              ),
                              Center(
                                child: Icon(
                                  Icons.shopping_cart,
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: (){
                          Navigator.of(context).push(MaterialPageRoute(
                              builder:(context)=> PaymentPage(),
                            ),
                          );
                        },
                        child: Container(
                          height: 65,
                          width: 100,
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color: Colors.grey,
                                  style: BorderStyle.solid,
                                  width: 1),
                              color: Color(0xff000000),
                              borderRadius: BorderRadius.circular(20)),
                          child: Center(
                            child: Text('Buy Now'),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
  //Food Item addition function

  Widget _buildFoodItem(
      BuildContext context, String imgPath, String foodName, String foodPrice) {
    return Padding(
      padding: EdgeInsets.only(left: 10, right: 10, top: 10),
      child: InkWell(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => DetailedFoodItem(
                    heroTag: imgPath,
                    foodName: foodName,
                    foodPrice: foodPrice,
                  )));
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
              child: Row(
                children: <Widget>[
                  Image(
                    image: AssetImage(imgPath),
                    fit: BoxFit.cover,
                    height: 75,
                    width: 75,
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        foodName,
                        style: TextStyle(
                            fontSize: 17,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'Rs. ' + foodPrice + '/-',
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            IconButton(
              icon: Icon(
                Icons.add,
                color: Colors.grey[800],
              ),
              color: Colors.black54,
              onPressed: () {
                setState(() {
                  totalItemsInCart++;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
//Search bar for foods

Widget _searchFoodScreen(BuildContext context) {

  return Container(
    decoration: BoxDecoration(
      color: Color(0xff757575),
    ),
    child: Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20), topRight: Radius.circular(20)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.fromLTRB(15.0, 10.0, 15.0, 10.0),
            child: TextField(

              style: TextStyle(
                color: Color(0xff000000),
              ),
              decoration: InputDecoration(
                icon: Icon(Icons.search),
                hintText: 'Search Here',
                hintStyle: TextStyle(color: Colors.grey[400]),
                contentPadding:
                    EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey[400]),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey[400]),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey[400]),
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15, right: 15),
            child: FlatButton(
              onPressed: () {
                Navigator.popAndPushNamed(context, FoodMenuPage.id);
              },
              color: Colors.lightBlueAccent,
              child: Text(
                'Search',
              ),
            ),
          ),
        ],
      ),
    ),
  );
}



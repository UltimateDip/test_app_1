import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test_app_1/reusable_elements/text_field_format.dart';
import 'package:test_app_1/welcome_screen.dart';
import 'reusable_elements/text_field_format.dart';

class FoodMenuPage extends StatefulWidget {
  static const String id = 'food_menu_screen';
  @override
  _FoodMenuPageState createState() => _FoodMenuPageState();
}

class _FoodMenuPageState extends State<FoodMenuPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff202040),
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
                        icon: Icon(Icons.brightness_4),
                        color: Colors.white,
                        onPressed: () {
                          //TODO
                        },
                      ),
                      IconButton(
                        icon: Icon(Icons.menu),
                        color: Colors.white,
                        onPressed: () {
                          //TODO
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
                            'images/pizza.jpg', 'Cheese Pizza', '180/-'),
                        _buildFoodItem(
                            'images/burger.jpg', 'Infinity Burger', '50/-'),
                        _buildFoodItem(
                            'images/corn.jpg', 'Desi Masala Corn', '25/-'),
                        _buildFoodItem(
                            'images/roasted.jpg', 'Eternal Salad', '40/-'),
                        _buildFoodItem(
                            'images/pork.png', 'Pork Barbeque', '80/-'),
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
                      Container(
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
                            Icons.shopping_cart,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      Container(
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
                          child: Text('Check Out'),
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
}

//Food Item addition function

Widget _buildFoodItem(String imgPath, String foodName, String foodPrice) {
  return Padding(
    padding: EdgeInsets.only(left: 10, right: 10, top: 10),
    child: InkWell(
      onTap: () {},
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
                      foodPrice,
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
            icon: Icon(Icons.add),
            color: Colors.black54,
            onPressed: () {
              //TODO
            },
          ),
        ],
      ),
    ),
  );
}

Widget _searchFoodScreen(BuildContext context) => Container(
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
            TextFieldFormat(
              hintTextTitle: 'Search here',
            ),
            SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsets.only(left: 15,right: 15),
              child: FlatButton(
                onPressed: (){
                  Navigator.popAndPushNamed(context, FoodMenuPage.id);
               //TODO
              },
                  color: Colors.lightBlueAccent,
                  child: Text(
                    'Search',
                  ),),
            ),
          ],
        ),
      ),
    );

import 'package:flutter/material.dart';


class RoundButton extends StatelessWidget {
  RoundButton({this.color, this.title,  this.route});
  final Color color;
  final String title;
  final Widget route;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 15.0),
      child: Material(
        elevation: 5.0,
        color: color,
        borderRadius: BorderRadius.circular(10.0),
        child: MaterialButton(
          onPressed: () {
            Navigator.push(context, AnimatedRouteTransition(route:route,),);
          },
          minWidth: 200.0,
          height: 42.0,
          child: Text(
            title,
          ),
        ),
      ),
    );
  }
}

class AnimatedRouteTransition extends PageRouteBuilder {
  final Widget route;
  AnimatedRouteTransition({@required this.route})
      : super(
      transitionDuration: Duration(milliseconds: 500),
      transitionsBuilder: (BuildContext context,
          Animation<double> animation,
          Animation<double> secAnimation,
          Widget child) {
        animation =
            CurvedAnimation(parent: animation, curve: Curves.easeInCubic);
        return ScaleTransition(
          scale: animation,
          child: child,
        );
      },
      pageBuilder: (BuildContext context, Animation<double> animation,
          Animation<double> secAnimation) {
        return route;
      });
}

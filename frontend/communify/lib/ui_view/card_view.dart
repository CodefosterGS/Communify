
import 'package:communify/app_theme.dart';
import 'package:flutter/material.dart';

class CardView extends StatelessWidget {
   final String titleTxt;
  final Image image;
  final AnimationController animationController;
  final Animation animation;

  const CardView(
      {Key key,
      this.titleTxt,
      this.image,
      this.animationController,
      this.animation})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    String title = titleTxt;
    return AnimatedBuilder(
      animation: animationController,
      builder: (BuildContext context, Widget child) {
        return FadeTransition(
          opacity: animation,
          child: new Transform(
            transform: new Matrix4.translationValues(
                0.0, 30 * (1.0 - animation.value), 0.0),
           child: Container(
             margin: EdgeInsets.symmetric(vertical: 20.0),
             height: 200.0,
          child: ListView(
                  scrollDirection: Axis.horizontal,
            children: <Widget>[
                    Container(
                      width: 160.0,
                      color: Colors.red,
                      padding: EdgeInsets.all(16.0),
                      child: Image.asset(
                        'assets/images/gdg.png',
                        height: 1.0 ,
                        width: 0.50 ,
                      ),
                    ),
                    Container(
                      width: 160.0,
                      color: Colors.blue,
                    ),
                    Container(
                      width: 160.0,
                      color: Colors.green,
                    ),
                    Container(
                      width: 160.0,
                      color: Colors.yellow,
                    ),
                    Container(
                      width: 160.0,
                      color: Colors.orange,
                    ),
                  ],
                ),
              ),
            ),
        );
      },
    );
  }
}

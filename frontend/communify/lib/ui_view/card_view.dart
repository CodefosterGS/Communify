
import 'package:communify/app_theme.dart';
import 'package:flutter/material.dart';

class CardView extends StatelessWidget {
  final List<String> titleTxt;
  final List<Image> image;
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
    return AnimatedBuilder(
      animation: animationController,
      builder: (BuildContext context, Widget child) {
        return FadeTransition(
          opacity: animation,
          child: new Transform(
            transform: new Matrix4.translationValues(
                0.0, 30 * (1.0 - animation.value), 0.0),
            child: Container(
              child: Padding(
                padding: const EdgeInsets.only(left: 24, right: 24),
                child: Row(
                  children: <Widget>[
                          
                          ],
                        ),
                      ),
                    )
                ),
        );
      },
    );
  }
}

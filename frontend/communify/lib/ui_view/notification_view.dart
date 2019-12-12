
import 'package:communify/app_theme.dart';
import 'package:flutter/material.dart';

class NotificationView extends StatelessWidget {
  final String title;
  final String subTitle;
  final String subSubTitle;
  final AnimationController animationController;
  final Animation animation;

  const NotificationView(
      {Key key,
      this.title,
      this.subTitle,
      this.subSubTitle,
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
                child: Card(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[    
                        ListTile(
                          leading: Icon(
                            Icons.notifications,
                            color: Colors.red.shade400,
                          ),
                          title: Text(title),
                          subtitle: Text(
                            subTitle + '\n' + subSubTitle
                          ),
                          trailing: Icon(Icons.arrow_forward_ios),
                          isThreeLine: true,
                        ),
                      ],
                    ),
                  ),
              )
            )
          ),
        );
      },
    );
  }
}

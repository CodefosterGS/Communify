
import 'package:communify/app_theme.dart';
import 'package:flutter/material.dart';

class EventView extends StatelessWidget {
  final String organizationImage;
  final String organizationTxt;
  final String eventTxt;
  final String time;
  final AnimationController animationController;
  final Animation animation;

  const EventView(
      {Key key,
      this.organizationImage,
      this.organizationTxt,
      this.eventTxt,
      this.time,
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
                          leading: new Image.asset(organizationImage),
                          title: Text(eventTxt),
                          subtitle: Text(
                            organizationTxt + '\n' + time
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

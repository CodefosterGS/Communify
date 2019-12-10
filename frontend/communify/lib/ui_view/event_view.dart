
import 'package:communify/app_theme.dart';
import 'package:flutter/material.dart';

class EventView extends StatelessWidget {
  final String organizationTxt;
  final String eventTxt;
  final String time;
  final AnimationController animationController;
  final Animation animation;

  const EventView(
      {Key key,
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
                child: Row(
                  children: <Widget>[
                           ListTile(
                                leading: FlutterLogo(size: 72.0),
                                title: Text(eventTxt),
                                subtitle: Text(
                                  organizationTxt + '\n' + time
                                ),
                                trailing: Icon(Icons.more_vert),
                                isThreeLine: true,
                            ),
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

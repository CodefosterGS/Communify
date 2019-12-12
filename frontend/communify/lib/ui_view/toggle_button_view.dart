
import 'package:communify/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:toggle_button/toggle_button.dart';

class ToggleButtonView extends StatelessWidget {
  final String titleTxt;
  final AnimationController animationController;
  final Animation animation;
  final bool isSwitched;
  const ToggleButtonView(
      {Key key,
      this.titleTxt: "",
      this.animationController,
      this.isSwitched=false,
      this.animation})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isSwitched = false;
    
    void _onSwitchChanged(bool value) {
      isSwitched = false;
    }
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
                    Expanded(
                      child: Text(
                        titleTxt,
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontFamily: AppTheme.fontName,
                          fontWeight: FontWeight.w500,
                          fontSize: 18,
                          letterSpacing: 0.5,
                          color: AppTheme.lightText,
                        ),
                      ),
                    ),
                     Switch(
                      onChanged: _onSwitchChanged,
                      value: isSwitched,
                      activeTrackColor: Colors.grey, 
                      activeColor: Colors.black,
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

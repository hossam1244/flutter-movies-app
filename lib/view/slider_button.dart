import 'package:flutter/material.dart';
import 'package:sliding_action_button/sliding_action_button.dart';

class SliderButton extends StatefulWidget {
  const SliderButton({super.key});

  @override
  State<SliderButton> createState() => _SliderButtonState();
}

class _SliderButtonState extends State<SliderButton> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CircleSlideToActionButton(
          width: double.infinity,
          parentBoxRadiusValue: 27,
          circleSlidingButtonSize: 50,
          bottomEdgeSpacing: 0,
          leftEdgeSpacing: 0,
          rightEdgeSpacing: 0,
          initialSlidingActionLabel: 'Add To Basket',
          finalSlidingActionLabel: 'Added To Basket',
          circleSlidingButtonIcon: const Icon(
            Icons.add_shopping_cart,
            color: Colors.orange,
          ),
          parentBoxBackgroundColor: Colors.orange,
          parentBoxDisableBackgroundColor: Colors.grey,
          /*
                  In case you want to use gradient colors instead of single color uncomment those lines.
                  Reminder that you have to remove the lines configuring single color
                  (parentBoxBackgroundColor, parentBoxDisableBackgroundColor)
                  parentBoxGradientBackgroundColor:
                      LinearGradient(colors: [Colors.red, Colors.white]),
                  parentBoxDisableGradientBackgroundColor:
                      LinearGradient(colors: [Colors.red, Colors.white]),*/
          circleSlidingButtonBackgroundColor: Colors.white,
          isEnable: true,
          onSlideActionCompleted: () {
            print("Sliding action completed");
          },
          onSlideActionCanceled: () {
            print("Sliding action cancelled");
          },
        ),
      ),
    );
  }
}

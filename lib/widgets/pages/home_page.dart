import 'package:flutter/material.dart';
import 'package:arduino_iot_app/utils/constants.dart';
import 'package:arduino_iot_app/widgets/components/layout/animated_background.dart';
import 'package:arduino_iot_app/widgets/components/headers/app_bar_actions.dart';
import 'package:arduino_iot_app/widgets/components/typography/h2.dart';
import 'package:arduino_iot_app/widgets/components/typography/h3.dart';
import 'package:arduino_iot_app/widgets/components/typography/caption.dart';
import 'package:arduino_iot_app/widgets/components/buttons/animated_buttons_bar.dart';
import 'package:arduino_iot_app/widgets/components/misc/localization.dart';
import 'package:arduino_iot_app/widgets/components/buttons/animated_card/animated_card.dart';
import 'package:arduino_iot_app/widgets//components/buttons/animated_card/animated_card_content.dart';
import 'package:arduino_iot_app/widgets/components/misc/example_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedBackground(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(Constants.paddingMedium),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const AppBarActions(),
                const SizedBox(height: 30),
                const H2(text: Constants.home__title),
                const SizedBox(height: 5),
                const Localization(location: 'Pertuis, France'),
                const SizedBox(height: 30),
                AnimatedButtonsBar(
                  outerPadding: Constants.paddingMedium,
                  tabNames: const ["Extérieur", "RDC", "Étage"],
                  onTabSelected: [
                    () => print("Extérieur selected"),
                    () => print("RDC selected"),
                    () => print("Étage selected"),
                  ],
                ),
                const Padding(
                  padding:
                      EdgeInsets.symmetric(vertical: 15.0, horizontal: 15.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      H3(text: Constants.home__subtitle),
                      Spacer(),
                      Caption(
                        text: "1 sur 5",
                        color: Constants.neutral,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 50),
                AnimatedCard(
                  width: MediaQuery.of(context).size.width - (70 * 2),
                  ratio: 1.2,
                  initialPosition: true,
                  onDoubleTap: () {
                    return false;
                  },
                  body: const AnimatedCardContent(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

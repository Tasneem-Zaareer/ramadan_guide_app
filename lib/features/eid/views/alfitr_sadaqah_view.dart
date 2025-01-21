import 'package:flutter/material.dart';
import 'package:ramadan_guide_app/core/widgets/text/custome_text.dart';

class SadaqahAlFitrView extends StatelessWidget {
  const SadaqahAlFitrView({super.key});

  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> sadaqahAlFitrMapInfo = {
      'title': 'Sadaqah al-Fitr (Zakat al-Fitr)',
      'purpose': [
        'Purification: Sadaqah al-Fitr is a way to purify the fast from any imperfections or shortcomings. It helps cleanse the soul and the fast from any inappropriate behavior, ensuring the fast is accepted by Allah.',
        'Help for the Needy: It provides those who are less fortunate the ability to join in the celebrations of Eid, ensuring that they have enough to eat and can take part in the joyous occasion.'
      ],
      'obligation': [
        'Sadaqah al-Fitr is obligatory for every Muslim who has the means to pay, including children, women, and the elderly, as long as they are financially able to.',
        'It is typically paid by the head of the household on behalf of their family members.',
        'The charity is given before the Eid prayer to ensure the needy can benefit from it before the celebrations begin.'
      ],
      'amount': [
        'The amount of Sadaqah al-Fitr is typically equivalent to the cost of one meal for an average person or the value of a specific quantity of staple food (such as wheat, dates, raisins, or barley).',
        'The amount can vary depending on the country and the local cost of living. In monetary terms, it is usually a small amount, but its value increases if it is given to those in need.'
      ],
      'time_to_pay': [
        'Sadaqah al-Fitr must be paid before the Eid prayer. It is often encouraged to pay it in the last few days of Ramadan, but it can be paid earlier in the month if necessary.'
      ],
      'benefits': {
        'purifies_fasting':
            'Purifies any possible mistakes or shortcomings during the month of Ramadan. By paying it, a person ensures that their fast is spiritually clean and accepted.',
        'fosters_solidarity':
            'It fosters a sense of unity within the Muslim community, especially on the occasion of Eid, where everyone can partake in the celebrations.',
        'supports_less_fortunate':
            'It provides food and financial assistance to those who may be struggling, ensuring they do not miss out on the joy of Eid celebrations.',
        'increases_reward':
            'Giving in charity during Ramadan is a highly rewarding act. The reward for charity in Ramadan is magnified, and paying Sadaqah al-Fitr can lead to greater blessings from Allah.'
      },
      'how_to_pay': [
        'Calculate the Amount: The amount of Sadaqah al-Fitr is calculated based on the local cost of a staple food item or the average price of a meal. Some organizations offer pre-determined amounts that are based on the current market value.',
        'Give Before Eid Prayer: The charity should be given before the Eid al-Fitr prayer, but it can be paid earlier in Ramadan to ensure the needy receive it in time.',
        'Pay Through Trusted Channels: Sadaqah al-Fitr can be paid directly to those in need or through local mosques, charities, and organizations. Many charities collect and distribute it on behalf of the donors.'
      ],
      'conclusion':
          'Sadaqah al-Fitr is an important act of charity that allows Muslims to purify their fast, ensure the less fortunate can celebrate Eid, and foster a sense of unity and compassion within the community. By fulfilling this obligation, Muslims show gratitude for Allah’s blessings and strengthen the bonds of brotherhood and sisterhood in the Muslim ummah (community).'
    };

    return Scaffold(
        appBar: AppBar(),
        body: SafeArea(
            child: ListView.builder(
          padding: EdgeInsets.symmetric(horizontal: 25),
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: 5,
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Column(
                children: [
                  CustomText(
                    text: sadaqahAlFitrMapInfo['title'],
                    fontSize: 20,
                    fontWeight: FontWeight.w900,
                    color: Theme.of(context).colorScheme.onSurface,
                  )
                ],
              ),
            );
          },
        )));
  }
}

import 'export.dart';

class CarouselItems {
  final String title;
  final String description;
  final String asset;
  const CarouselItems({
    required this.title,
    required this.description,
    required this.asset,
  });

  static const List<CarouselItems> items = <CarouselItems>[
    CarouselItems(
      title: 'Programming',
      description:
          "It's time to test your skills. Try a programming quiz to test yourself",
      asset: Assets.programming,
    ),
    CarouselItems(
      title: 'Cinematography',
      description:
          'Try to answer few questions about cinematogray. This will help you learn new things.',
      asset: Assets.cinematography,
    ),
    CarouselItems(
      title: 'Music',
      description: "Love music! It's time learn some facts about it.",
      asset: Assets.music,
    ),
    CarouselItems(
      title: 'Digital Marketing',
      description: 'Want to start with marketing. We can help you.',
      asset: Assets.marketing,
    ),
  ];
}

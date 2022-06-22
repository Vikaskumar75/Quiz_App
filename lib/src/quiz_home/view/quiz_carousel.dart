// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'quiz_home.dart';

class _QuizCarousel extends StatelessWidget {
  const _QuizCarousel({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 14.0.toWidth),
      child: Column(
        children: <Widget>[
          const _Carousel(items: CarouselItems.items),
          SizedBox(height: 10.toHeight),
          const _CarouselIcons(items: CarouselItems.items)
        ],
      ),
    );
  }
}

class _CarouselIcons extends StatelessWidget {
  const _CarouselIcons({
    Key? key,
    required List<CarouselItems> items,
  })  : _items = items,
        super(key: key);

  final List<CarouselItems> _items;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 16.toHeight,
      width: double.maxFinite,
      alignment: Alignment.center,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: _items.length,
        shrinkWrap: true,
        separatorBuilder: (BuildContext context, int index) {
          return const SizedBox(width: 4);
        },
        itemBuilder: (BuildContext context, int index) {
          return Consumer(
            builder: (_, WidgetRef ref, Widget? child) {
              final int carouselIndex = ref.watch(carouselIndexProvider);
              return Icon(
                carouselIndex == index ? Icons.circle : Icons.circle_outlined,
                size: 12,
                color: carouselIndex == index
                    ? ColorPallet.white
                    : ColorPallet.lightGrey,
              );
            },
          );
        },
      ),
    );
  }
}

class _Carousel extends ConsumerWidget {
  const _Carousel({
    Key? key,
    required List<CarouselItems> items,
  })  : _items = items,
        super(key: key);

  final List<CarouselItems> _items;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: CarouselSlider.builder(
        itemCount: _items.length,
        options: CarouselOptions(
          viewportFraction: 1,
          autoPlay: true,
          autoPlayAnimationDuration: const Duration(milliseconds: 1000),
          onPageChanged: (int index, _) {
            ref.read(carouselIndexProvider.notifier).state = index;
          },
        ),
        itemBuilder: (_, int itemIndex, int pageViewIndex) {
          return Stack(
            alignment: Alignment.bottomCenter,
            children: <Widget>[
              Image.asset(
                _items[itemIndex].asset,
                fit: BoxFit.cover,
              ),
              Container(
                height: double.maxFinite,
                width: double.maxFinite,
                alignment: Alignment.bottomCenter,
                padding: EdgeInsets.only(bottom: 10.toHeight),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    colors: <Color>[
                      ColorPallet.black.withOpacity(0.9),
                      ColorPallet.black.withOpacity(0.5),
                      ColorPallet.black.withOpacity(0.2),
                    ],
                  ),
                ),
                child: ListTile(
                  title: Text(
                    _items[itemIndex].title,
                    style: CustomTheme.headline6,
                  ),
                  visualDensity: VisualDensity.comfortable,
                  subtitle: Text(
                    _items[itemIndex].description,
                    style: CustomTheme.bodyText1.copyWith(
                      color: ColorPallet.grey,
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

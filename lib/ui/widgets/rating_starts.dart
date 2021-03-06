part of 'widgets.dart';

class RatingStars extends StatelessWidget {
  // const ({ Key? key }) : super(key: key);
  final double voteAverage;
  final double startSize;
  final double fontSize;
  final Color color;
  final MainAxisAlignment alignment;

  RatingStars(
      {this.voteAverage = 0,
      this.startSize = 20,
      this.fontSize = 12,
      this.color,
      this.alignment = MainAxisAlignment.start});

  @override
  Widget build(BuildContext context) {
    int n = (voteAverage / 2).round();

    List<Widget> widgets = List.generate(
        5,
        (index) => Icon(
              index < n ? MdiIcons.star : MdiIcons.starOutline,
              color: accentColor2,
              size: startSize,
            ));

    widgets.add(SizedBox(
      width: 3,
    ));

    widgets.add(Text(
      "$voteAverage/10",
      style: whiteNumberFont.copyWith(
        color: color ?? Colors.white,
        fontWeight: FontWeight.w300,
        fontSize: fontSize,
      ),
    ));

    return Row(
      mainAxisAlignment: alignment,
      children: widgets,
    );
  }
}

part of 'widgets.dart';

class ComingSoonCard extends StatelessWidget {
  // const ComingSoonCard({ Key? key }) : super(key: key);
  final Movie movie;
  final Function onTap;

  ComingSoonCard(this.movie, {this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 240,
      width: 105,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          image: DecorationImage(image: NetworkImage(imageBaseUrl + "w780" + movie.backdropPath), fit: BoxFit.cover)),
      child: Container(
        height: 240,
        width: 105,
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            gradient: LinearGradient(
                colors: [Colors.black.withOpacity(0.61), Colors.black.withOpacity(0)],
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter)),
        //   child: Column(
        //     mainAxisAlignment: MainAxisAlignment.end,
        //     crossAxisAlignment: CrossAxisAlignment.start,
        //     children: <Widget>[
        //       Text(
        //         movie.title,
        //         style: whiteTextFont,
        //         maxLines: 2,
        //         overflow: TextOverflow.ellipsis,
        //       ),
        //       RatingStarts(voteAverage: movie.voteAverage)
        //     ],
        //   ),
      ),
    );
  }
}

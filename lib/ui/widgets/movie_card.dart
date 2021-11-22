part of 'widgets.dart';

class MovieCard extends StatelessWidget {
  // const MovieCard({ Key? key }) : super(key: key);
  final Movie movie;
  final Function onTap;

  MovieCard(this.movie, {this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (onTap != null) {
          onTap();
        }
      },
      child: Container(
        height: 140,
        width: 210,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            image: DecorationImage(
                image: NetworkImage(imageBaseUrl +
                    "w780" +
                    (movie.backdropPath ?? movie.posterPath)),
                fit: BoxFit.cover)),
        child: Container(
          height: 140,
          width: 240,
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              gradient: LinearGradient(colors: [
                Colors.black.withOpacity(0.61),
                Colors.black.withOpacity(0)
              ], begin: Alignment.bottomCenter, end: Alignment.topCenter)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                movie.title,
                style: whiteTextFont,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              RatingStars(voteAverage: movie.voteAverage)
            ],
          ),
        ),
      ),
    );
  }
}

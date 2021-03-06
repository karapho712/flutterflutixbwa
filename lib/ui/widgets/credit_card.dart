part of 'widgets.dart';

class CreditCard extends StatelessWidget {
  // const CreditCard({ Key? key }) : super(key: key);
  final Credit credit;

  CreditCard(this.credit);

  @override
  Widget build(BuildContext context) {
    // print(credit);
    // return Container();
    return Column(
      children: <Widget>[
        Container(
          height: 80,
          width: 70,
          decoration: BoxDecoration(
              color: Colors.blueGrey[100],
              borderRadius: BorderRadius.circular(8),
              image: (credit.profilePath == null)
                  ? null
                  : DecorationImage(
                      image: NetworkImage(
                          imageBaseUrl + "w185" + credit.profilePath),
                      fit: BoxFit.cover)),
        ),
        Container(
          margin: EdgeInsets.only(top: 6),
          width: 70,
          child: Text(
            credit.name,
            textAlign: TextAlign.center,
            maxLines: 2,
            overflow: TextOverflow.clip,
            style: blackTextFont.copyWith(
                fontSize: 10, fontWeight: FontWeight.w400),
          ),
        )
      ],
    );
  }
}

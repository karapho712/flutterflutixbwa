part of 'pages.dart';

class TicketDetailPage extends StatelessWidget {
  // const TicketDetailPage({ Key? key }) : super(key: key);

  final Ticket ticket;

  TicketDetailPage(this.ticket);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async {
          context
              .read<PageBloc>()
              .add(GoToMainPage(bottomNavBarIndex: 1, isExpired: ticket.time.isBefore(DateTime.now())));

          return;
        },
        child: Scaffold(
          body: Center(child: Text(ticket.movieDetail.title)),
        ));
  }
}

part of 'pages.dart';

class EditProfilePage extends StatefulWidget {
  // const EditProfilePage({ Key? key }) : super(key: key);
  final User user;

  EditProfilePage(this.user);

  @override
  _EditProfilePageState createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        context.read<PageBloc>().add(GoToProfilePage());

        return;
      },
      child: Scaffold(
          body: Center(
        child: Text(widget.user.name),
      )),
    );
  }
}

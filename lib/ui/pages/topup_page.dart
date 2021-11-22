part of 'pages.dart';

class TopUpPage extends StatefulWidget {
  // const TopUpPage({ Key? key }) : super(key: key);
  final PageEvent pageEvent;

  TopUpPage(this.pageEvent);
  @override
  _TopUpPageState createState() => _TopUpPageState();
}

class _TopUpPageState extends State<TopUpPage> {
  TextEditingController amountController = TextEditingController(text: 'IDR 0');
  int selectedAmount = 0;

  @override
  Widget build(BuildContext context) {
    // context.read<ThemeBloc>().add(ChangeTheme(ThemeData().copyWith(primaryColor: Color(0xFFAAAAAA)))); //TIDAK JALAN KI
    BlocProvider.of<ThemeBloc>(context).add(ChangeTheme(ThemeData().copyWith(primaryColor: Color(0xFFAAAAAA))));
    // ChangeTheme(ThemeData().copyWith(primaryColor: Color(0xFFAAAAAA)));

    double cardWidth = (MediaQuery.of(context).size.width - 2 * defaultMargin - 40) / 3;

    return WillPopScope(
        onWillPop: () async {
          context.read<PageBloc>().add(widget.pageEvent);
          return;
        },
        child: Scaffold(
            body: ListView(
          children: <Widget>[
            Stack(
              children: <Widget>[
                // note: BACK ARROW
                SafeArea(
                    child: Container(
                  margin: EdgeInsets.only(top: 20, left: defaultMargin),
                  child: GestureDetector(
                      onTap: () {
                        context.read<PageBloc>().add(widget.pageEvent);
                      },
                      child: Icon(Icons.arrow_back, color: Colors.black)),
                )),
                // Content
                Container(
                  width: double.infinity,
                  margin: EdgeInsets.symmetric(horizontal: defaultMargin),
                  child: Column(
                    children: <Widget>[
                      SizedBox(height: 20),
                      Text("Top Up", style: blackTextFont.copyWith(fontSize: 20)),
                      SizedBox(height: 20),
                      TextField(
                          onChanged: (text) {
                            String temp = '';

                            for (int i = 0; i < text.length; i++) {
                              temp += text.isDigit(i) ? text[i] : '';
                            }

                            // selectedAmount = int.tryParse(temp) ?? 0;
                            setState(() {
                              selectedAmount = int.tryParse(temp) ?? 0;
                            });

                            amountController.text =
                                NumberFormat.currency(locale: 'id_ID', symbol: 'IDR ', decimalDigits: 0)
                                    .format(selectedAmount);

                            amountController.selection =
                                TextSelection.fromPosition(TextPosition(offset: amountController.text.length));
                          },
                          controller: amountController,
                          decoration: InputDecoration(
                              labelStyle: greyTextFont,
                              border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                              labelText: "Amount")),
                      Align(
                        alignment: Alignment.topLeft,
                        child: Container(
                            margin: EdgeInsets.only(top: 20, bottom: 14),
                            child: Text("Choose by template", style: blackTextFont)),
                      ),
                      Wrap(
                        spacing: 20,
                        runSpacing: 14,
                        children: <Widget>[
                          makeMoneyCard(amount: 50000, width: cardWidth),
                          makeMoneyCard(amount: 100000, width: cardWidth),
                          makeMoneyCard(amount: 150000, width: cardWidth),
                          makeMoneyCard(amount: 200000, width: cardWidth),
                          makeMoneyCard(amount: 250000, width: cardWidth),
                          makeMoneyCard(amount: 300000, width: cardWidth),
                        ],
                      ),
                      SizedBox(
                        height: 100,
                      ),
                      SizedBox(
                        height: 46,
                        width: 250,
                        child: BlocBuilder<UserBloc, UserState>(
                          builder: (_, userState) => RaisedButton(
                              elevation: 0,
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                              child: Text("Top Up My Wallet",
                                  style: whiteTextFont.copyWith(
                                      fontSize: 16, color: (selectedAmount > 0) ? Colors.white : Color(0xFFBEBEBE))),
                              disabledColor: Color(0xFFBEBEBE),
                              color: Color(0xFF3E9D9D),
                              onPressed: (selectedAmount > 0)
                                  ? () {
                                      context.read<PageBloc>().add(GoToSuccessPage(
                                          null,
                                          FlutixTransaction(
                                            userID: (userState as UserLoaded).user.id,
                                            title: "Top Up Wallet",
                                            amount: selectedAmount,
                                            subtitle:
                                                "${DateTime.now().dayName}, ${DateTime.now().day}, ${DateTime.now().monthName}, ${DateTime.now().year},",
                                            time: DateTime.now(),
                                          )));
                                    }
                                  : null),
                        ),
                      ),
                      SizedBox(
                        height: 100,
                      )
                    ],
                  ),
                )
              ],
            ),
          ],
        )));
  }

  MoneyCard makeMoneyCard({int amount, double width}) {
    return MoneyCard(
        amount: amount,
        width: width,
        isSelected: amount == selectedAmount,
        onTap: () {
          setState(() {
            if (selectedAmount != amount) {
              selectedAmount = amount;
            } else {
              selectedAmount = 0;
              // amountController.text = '0';
            }
            amountController.text =
                NumberFormat.currency(locale: 'id_ID', decimalDigits: 0, symbol: 'IDR ').format(selectedAmount);

            amountController.selection = TextSelection.fromPosition(TextPosition(offset: amountController.text.length));
          });
        });
  }
}

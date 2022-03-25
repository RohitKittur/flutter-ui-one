import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:prog_two/constants/color_constant.dart';
import 'package:prog_two/models/card_model.dart';
import 'package:prog_two/models/transaction_model.dart';
import '../models/operation_models.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  //CURRENT SELECTED
  int current = 0;

  get result => null;

  //HANDLE INDICATOR
  List<T> map<T>(List list, Function handler) {
    List<T> result = [];
    for (var i = 0; i < list.length; i++) {
      result.add(handler(i, list[i]));
    }
    return result;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.only(top: 8.0),
        child: ListView(
          physics: const ClampingScrollPhysics(),
          children: [
            Container(
              margin: const EdgeInsets.only(left: 16, right: 16, top: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
// ***************  CUSTOM APP BAR  ***********************************

                  Container(
                      height: 35,
                      width: 35,
                      child: GestureDetector(
                          onTap: () {
                            print('Drawer Pressed');
                          },
                          child: SvgPicture.asset('assets/svg/svg1.svg'))),
                  const CircleAvatar(
                    radius: 25,
                    backgroundImage: AssetImage('assets/images/two.jpg'),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 30.0,
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Good Morning',
                    style: GoogleFonts.inter(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(
                    'Lana Decruz',
                    style: GoogleFonts.inter(
                      fontSize: 30,
                      fontWeight: FontWeight.w700,
                    ),
                  )
                ],
              ),
            ),
            Container(
              height: 199,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: cards.length,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    height: 199,
                    width: 320,
                    margin: const EdgeInsets.only(right: 3, left: 16),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(28),
                      color: Color(cards[index].cardBackground),
                    ),
                    child: Stack(
                      children: [
                        Positioned(
                            bottom: 80,
                            right: 250,
                            child:
                                SvgPicture.asset(cards[index].cardElementTop)),
                        Positioned(
                            top: 70,
                            left: 190,
                            child: SvgPicture.asset(
                                cards[index].cardElementBottom)),
                        Positioned(
                            top: 70,
                            left: 50,
                            child: Text(
                              'CARD NUMBER',
                              style: GoogleFonts.inter(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: Colors.white,
                              ),
                            )),
                        Positioned(
                            top: 90,
                            left: 50,
                            child: Text(
                              cards[index].cardNumber,
                              style: GoogleFonts.inter(
                                fontSize: 18,
                                fontWeight: FontWeight.w700,
                                color: Colors.white,
                              ),
                            )),
                        Positioned(
                            top: 20,
                            left: 270,
                            child: Image.asset(
                              cards[index].cardType,
                              height: 27,
                              width: 27,
                            )),
                        Positioned(
                            top: 140,
                            left: 50,
                            child: Text(
                              'CARD HOLDER',
                              style: GoogleFonts.inter(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: Colors.white,
                              ),
                            )),
                        Positioned(
                            top: 160,
                            left: 50,
                            child: Text(
                              cards[index].user,
                              style: GoogleFonts.inter(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.white),
                            )),
                        Positioned(
                            top: 140,
                            left: 220,
                            child: Text(
                              'EXPIRY DATE',
                              style: GoogleFonts.inter(
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                                color: Colors.white,
                              ),
                            )),
                        Positioned(
                            top: 160,
                            left: 220,
                            child: Text(
                              cards[index].cardExpired,
                              style: GoogleFonts.inter(
                                fontSize: 14,
                                fontWeight: FontWeight.w700,
                                color: Colors.white,
                              ),
                            )),
                      ],
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Operation',
                    style: GoogleFonts.inter(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Row(
                    children: map<Widget>(
                      datas,
                      (index, selected) {
                        return Container(
                          alignment: Alignment.centerLeft,
                          height: 9,
                          width: 9,
                          margin: const EdgeInsets.only(right: 8.0),
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: current == index
                                  ? kBlueColor
                                  : kTwentyBlueColor),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: 123,
              child: ListView.builder(
                  itemCount: datas.length,
                  padding: const EdgeInsets.only(left: 16),
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          current = index;
                        });
                      },
                      child: OperationCard(
                          operation: datas[index].name,
                          selectionIcon: datas[index].selectedIcon,
                          unselectedIcon: datas[index].unselectedIcon,
                          isSelected: current == index,
                          context: this),
                    );
                  }),
            ),

            // ***********  TRANSACTION HISTORY  ****************

            
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Transaction Histories',
                style: GoogleFonts.inter(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),

            // *************  TRANSACTION HISTORY *************


            ListView.builder(
              itemCount: transactions.length,
              padding: const EdgeInsets.only(left: 16, right: 16.0),
              shrinkWrap: true,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  height: 76,
                  margin: const EdgeInsets.only(bottom: 13),
                  padding: const EdgeInsets.only(left: 24, top: 12, bottom: 12, right: 22.0),
                  decoration: BoxDecoration(
                    color: kWhiteColor,
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: const [
                      BoxShadow(
                        color: kTenBlackColor,
                        blurRadius: 10,
                        spreadRadius: 5,
                        offset: Offset(8.0, 8.0)
                      ),
                    ],
                  ),
                  child: Row(
                    children: [
                      // Container(
                      //   // height: 15,
                      //   // width: 15,
                      //   decoration: const BoxDecoration(
                      //     shape: BoxShape.circle,
                      //   ),
                      // ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(transactions[index].name,
                          style: GoogleFonts.inter(
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                            color: kBlackColor
                          )),
                          Text(
                            transactions[index].date,
                            style: GoogleFonts.inter(
                              fontSize: 15,
                              fontWeight: FontWeight.w400,
                              color: kGreyColor
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        width: 45,
                      ),
                      Row(
                        // crossAxisAlignment: CrossAxisAlignment.end,
                        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(transactions[index].amount, style: GoogleFonts.inter(fontSize: 15,
                          fontWeight: FontWeight.w700,
                          color: kBlueColor
                          ),)
                        ],
                      ),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class OperationCard extends StatefulWidget {
  OperationCard(
      {Key? key,
      required this.operation,
      required this.selectionIcon,
      required this.unselectedIcon,
      required this.isSelected,
      required this.context})
      : super(key: key);

  final String operation;
  final String selectionIcon;
  final String unselectedIcon;
  final bool isSelected;
  _HomeScreenState context;

  @override
  State<OperationCard> createState() => _OperationCardState();
}

class _OperationCardState extends State<OperationCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 16),
      width: 123,
      height: 123,
      decoration: BoxDecoration(
          boxShadow: const [
            BoxShadow(
              color: kTenBlackColor,
              blurRadius: 10,
              spreadRadius: 5,
              offset: Offset(8.0, 8.0),
            ),
          ],
          borderRadius: BorderRadius.circular(15),
          color: widget.isSelected ? kBlueColor : kWhiteColor),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // SvgPicture.asset(widget.isSelected ? widget.selectionIcon : widget.unselectedIcon),
          const SizedBox(
            height: 9,
          ),
          Text(
            widget.operation,
            textAlign: TextAlign.center,
            style: GoogleFonts.inter(
                fontSize: 15,
                fontWeight: FontWeight.w700,
                color: widget.isSelected ? kWhiteColor : kBlueColor),
          ),
        ],
      ),
    );
  }
}

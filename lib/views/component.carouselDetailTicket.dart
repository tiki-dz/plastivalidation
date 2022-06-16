import 'package:cached_network_image/cached_network_image.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:get/get.dart';
import 'package:plastivalidation/data/pallete.data.dart';
import 'package:sizer/sizer.dart';


import '../data/font.data.dart';
import '../model.Ticket.dart';
import '../model.event.dart';

class CarouselDetailsTickets extends StatefulWidget {
  CarouselDetailsTickets({required this.ticket,required this.event, Key? key}) : super(key: key);

  TicketModel ticket; EventModel event;

  @override
  _CarouselDetailsTicketsState createState() => _CarouselDetailsTicketsState();
}
class _CarouselDetailsTicketsState extends State<CarouselDetailsTickets> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      backgroundColor: KOrange,
      body:Center(
        child: Container(
          height:70.h ,
          width: 70.w,
          margin: EdgeInsets.symmetric(horizontal: 2.w),
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                spreadRadius: 2,
                blurRadius: 7,
                offset: const Offset(0, 4), // changes position of shadow
              ),
            ],
            color: Colors.white,
            borderRadius: BorderRadius.circular(10.sp),
          ),
          child: Column(
            children: [
              Expanded(
                  child: ClipRRect(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10.sp),
                          topRight: Radius.circular(10.sp)),
                      child: CachedNetworkImage( imageUrl: widget.event.ticketImage,errorWidget: (context,error,t)=>  Image.asset('assets/logo/plasti.jpg'),))),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 3.w),
                child: Column(
                  children: [
                    SizedBox(
                      height: 3.h,
                    ),
                    Text(
                     widget. event.name,
                      style: TextStyle(
                          color: Color(0xff6C6C6C),
                          fontWeight: semiBold,
                          fontSize: 15.sp),
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    Text(
                      widget.ticket.firstName + " " + widget.ticket.lastName,
                      style: TextStyle(
                          color: Colors.black, fontWeight: semiBold, fontSize: 16.sp),
                    ),
                    SizedBox(
                      height: 3.h,
                    ),
                    Column(
                      children: [
                        Row(
                          children: [
                            SizedBox(
                              width: 3.w,
                            ),
                            itemMatrix("date".tr, widget.event.startDateTitleFormat() ),
                            SizedBox(
                              width: 5.w,
                            ),
                            itemMatrix("lieu".tr, widget.event.addressExact())
                          ],
                        ),
                        SizedBox(
                          height: 2.h,
                        ),
                        Row(
                          children: [
                            SizedBox(
                              width: 3.w,
                            ),
                            itemMatrix("time".tr, "12:00 am - 11:00 pm"),
                            SizedBox(
                              width: 5.w,
                            ),
                            itemMatrix("price".tr, widget.event.price+" DA")
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 4.h,
                    ),
                    const DottedLine(
                      direction: Axis.horizontal,
                      lineLength: double.infinity,
                      lineThickness: 0.5,
                      dashLength: 4.0,
                      dashColor: Colors.grey,
                      dashRadius: 0.0,
                      dashGapLength: 4.0,
                      dashGapColor: Colors.transparent,
                      dashGapRadius: 0.0,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      )) ,
    );
  }
}



Widget itemMatrix(String title, String content) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        title,
        style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 12.sp,
            color: Color(0xff6C6C6C)),
      ),
      Text(
        content,
        style: TextStyle(
            fontWeight: FontWeight.w500, fontSize: 9.sp, color: Colors.black),
      )
    ],
  );
}

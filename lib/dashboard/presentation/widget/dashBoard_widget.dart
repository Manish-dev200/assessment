import 'package:assessment/common/color/colors.dart';
import 'package:assessment/dashboard/data/modal/modal.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';

class DashboardWidget {
  static PreferredSizeWidget appBar() {
    return AppBar(
      automaticallyImplyLeading: false,
      leading: const Icon(Icons.arrow_back_ios_new),
      title: Image.asset('assets/images/ac.png'),
      centerTitle: true,
    );
  }

  static Widget product(
      {required String imagePath,
      required String text,
      required double initialRating,
      required double rating,
      required int count,
      required double price}) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      decoration: BoxDecoration(
          color: AppColor.whiteColor, borderRadius: BorderRadius.circular(15)),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Container(
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(15)),
              child: Image.network(
                imagePath,
                height: 80,
                width: 85,
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  text,
                  style: GoogleFonts.poppins(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                  ),
                  // const TextStyle(
                  //     fontSize: 12, fontWeight: FontWeight.w500),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  'John Doe',
                  style: TextStyle(fontSize: 11,color: AppColor.semiBlackColor,fontWeight: FontWeight.w500),
                ),
                const SizedBox(
                  height: 5,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        RatingBar.builder(
                          itemSize: 15,
                          initialRating: initialRating,
                          minRating: 0,
                          // unratedColor: AppColor.ratingColor,

                          direction: Axis.horizontal,
                          allowHalfRating: true,
                          itemCount: 5,
                          // itemPadding: EdgeInsets.symmetric(horizontal: 2.0),
                          itemBuilder: (context, index) => Icon(
                            index < initialRating
                                ? Icons.star
                                : Icons.star_border,
                            color: index < initialRating
                                ? AppColor.ratingColor
                                : Colors.yellow,
                          ),
                          onRatingUpdate: (rating) {
                            print(rating);
                          },
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Text(
                          "($rating)",
                          style: TextStyle(fontSize: 12,color: AppColor.semiBlackColor,fontWeight: FontWeight.w500),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Text(
                          '($count)',
                          style: TextStyle(fontSize: 12,color: AppColor.semiBlackColor,fontWeight: FontWeight.w500),
                        )
                      ],
                    ),
                    Text(
                      '\$$price',
                      style: const TextStyle(
                          fontSize: 14, fontWeight: FontWeight.w500),
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

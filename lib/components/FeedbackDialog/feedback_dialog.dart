import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../components/RatingBar/ratingbar.dart';

void feedBackDialog({required BuildContext context}) {
  TextEditingController controller = TextEditingController();

  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.black,
      systemNavigationBarColor: Colors.black,
      statusBarIconBrightness: Brightness.light,
      systemNavigationBarIconBrightness: Brightness.light,
    ),
  );
  showDialog(
    context: context,
    builder: (BuildContext context) => Dialog(
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(
            Radius.circular(10.0),
          ),
        ),
        padding: const EdgeInsets.symmetric(vertical: 30.0, horizontal: 15.0),
        child: IntrinsicHeight(
          child: SingleChildScrollView(
            child: Column(
              children: [
                const Text(
                  "Please share your experience with us",
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 22.0,
                    color: Colors.black,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 20.0,
                ),
                const Text(
                  "3.0",
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 30.0,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(
                  height: 24.0,
                ),
                RatingBar(
                  initialRating: 0.5,
                  maxRating: 5,
                  onRatingUpdate: (RatingValue value) {},
                  filledColor: Colors.amber,
                  unfilledColor: Colors.grey,
                  size: 30,
                  ratingBehavior: RatingBehavior.onDragOnly,
                ),
                const SizedBox(
                  height: 24.0,
                ),
                Container(
                  decoration: const BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.all(Radius.circular(8.0))),
                  child: TextField(
                    controller: controller,
                    maxLines: 5,
                    decoration: const InputDecoration(
                      counterText: "",
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                      ),
                      contentPadding: EdgeInsets.all(10.0),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 24.0,
                ),
                Row(
                  children: [
                    Expanded(
                      child: FilledButton(
                        onPressed: () {},
                        style: FilledButton.styleFrom(
                          backgroundColor: Colors.green,
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(
                                5.0,
                              ),
                            ),
                          ),
                        ),
                        child: const Text("Submit"),
                      ),
                    ),
                    const SizedBox(
                      width: 10.0,
                    ),
                    Expanded(
                      child: FilledButton(
                        onPressed: () {},
                        style: FilledButton.styleFrom(
                          backgroundColor: Colors.orange,
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(
                                5.0,
                              ),
                            ),
                          ),
                        ),
                        child: const Text("Skip"),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    ),
  ).then(
    (_) {
      SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(
          statusBarColor: Colors.black,
          systemNavigationBarColor: Colors.black,
          statusBarIconBrightness: Brightness.light,
          systemNavigationBarIconBrightness: Brightness.light,
        ),
      );
    },
  );
}

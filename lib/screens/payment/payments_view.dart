import '../../../utils/export_file.dart';

class Payment extends StatefulWidget {
  const Payment({super.key});

  @override
  State<Payment> createState() => _PaymentState();
}

class _PaymentState extends State<Payment> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      backgroundColor: kBackground,
      appBar: AppBar(
        iconTheme: const IconThemeData(color: white),
        backgroundColor: Colors.transparent,
        elevation: 0,
       centerTitle: true,
        title: Text(
          'Payment',
          style: GoogleFonts.gothicA1(
              fontSize: kEighteenFont, color: white, fontWeight: kFW700),
        ),
      ),
      body: SingleChildScrollView(
        child: 
        Container(
          margin: EdgeInsets.all(15.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 10.h,
              ),
               Text(
          "Payment Method",
          style: GoogleFonts.gothicA1(
              fontSize: 17.sp, color: white, fontWeight: kFW700),
        ),
         SizedBox(
                height: 20.h,
              ),
              const Payment_card(),
               SizedBox(
                height: 20.h,
              ),
              const Mastercard(),
              // SizedBox(
              //   height: 100.h,
              // ),
            ],
          ),
        ),
      ),
    );
  }
}

import '../../../utils/export_file.dart';

class Subscription extends StatefulWidget {
  const Subscription({super.key});

  @override
  State<Subscription> createState() => _SubscriptionState();
}

class _SubscriptionState extends State<Subscription> {
  final _formKey = GlobalKey<FormState>();
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
            'Subscriptions',
            style: GoogleFonts.gothicA1(
                fontSize: kEighteenFont, color: white, fontWeight: kFW700),
          ),
        ),
        body: 
        Container(
          margin: EdgeInsets.all(15.w),
          child: Stack(
            children:   [
              Plans_card(),
              Column(
                children: [
                  SizedBox(height:450.h),
                   CustomProfileButton(
                    label: 'Continue',
                    isLoading: true,
                    onTap: () {
                     
                      Get.toNamed(KPayment);
                    },
                  ),
                ],
              ),
              
              // Button(),
              Swipe(),
            ],
          ),
        ));
  }
}

import 'package:biopay_mobile/features/pay_bill/model/provider_argument.dart';
import 'package:biopay_mobile/features/pay_bill/model/select_provider_argument.dart';
import 'package:biopay_mobile/router/routes.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SelectDthScreen extends StatefulWidget {
  final ProviderArgument args;
  const SelectDthScreen({super.key, required this.args});

  @override
  State<SelectDthScreen> createState() => _SelectDthScreenState();
}

class _SelectDthScreenState extends State<SelectDthScreen> {

  List<Map<String, dynamic>> providers = [];


  String searchQuery = '';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
      if(widget.args.name == 'dth') {

        providers = [
          {'name': 'Airtel Digital', 'icon': 'https://upload.wikimedia.org/wikipedia/commons/thumb/2/26/KSEB_logo.svg/2048px-KSEB_logo.svg.png'},
          {'name': 'Sun Direct', 'icon': 'https://upload.wikimedia.org/wikipedia/commons/thumb/2/26/KSEB_logo.svg/2048px-KSEB_logo.svg.png'},
          {'name': 'Dish TV', 'icon': 'https://upload.wikimedia.org/wikipedia/commons/thumb/2/26/KSEB_logo.svg/2048px-KSEB_logo.svg.png'},
          {'name': 'Sun Direct', 'icon': 'https://upload.wikimedia.org/wikipedia/commons/thumb/2/26/KSEB_logo.svg/2048px-KSEB_logo.svg.png'},
          {'name': 'TATA Play', 'icon': 'https://upload.wikimedia.org/wikipedia/commons/thumb/2/26/KSEB_logo.svg/2048px-KSEB_logo.svg.png'},
        ];

      } else if(widget.args.name == 'electric') {

        providers = [
          {
            'name': 'Kerala State Electricity Board (KSEB)',
            'logo': 'https://raw.githubusercontent.com/PiyushPoshiya/openfile/main/celebsBox/image/explore_bg.jpg',
          },
          {
            'name': 'Tamil Nadu Generation and Distribution Corporation (TANGEDCO)',
            'logo': 'https://raw.githubusercontent.com/PiyushPoshiya/openfile/main/celebsBox/image/explore_bg.jpg',
          },
          {
            'name': 'BSES Rajdhani Power Ltd (BRPL), BSES Yamuna Power Ltd (BYPL)',
            'logo': 'https://raw.githubusercontent.com/PiyushPoshiya/openfile/main/celebsBox/image/explore_bg.jpg',
          },
          {
            'name': 'Punjab State Power Corporation Limited (PSPCL)',
            'logo': 'https://raw.githubusercontent.com/PiyushPoshiya/openfile/main/celebsBox/image/explore_bg.jpg',
          },
        ];

      } else if(widget.args.name == 'water') {

        providers = [
          {
            'name': 'Kerala Water Authority (KWA)',
            'logo': 'https://upload.wikimedia.org/wikipedia/en/e/e7/KWA_Logo.png',
          },
          {
            'name': 'BWSSB – Bangalore Water Supply and Sewerage Board (Bengaluru)',
            'logo': 'https://bwssb.karnataka.gov.in/storage/sliders/October2021/tSK8UHwJQUWH2oHgW6vb.png',
          },
          {
            'name': 'KUWSDB – Karnataka Urban Water Supply and Drainage Board',
            'logo': 'https://kuwsdb.karnataka.gov.in/storage/sliders/October2021/ct9sF3EyWdr4JGk9umMg.png',
          },
          {
            'name': 'MCGM – Municipal Corporation of Greater Mumbai (Mumbai)',
            'logo': 'https://upload.wikimedia.org/wikipedia/en/3/3d/Municipal_Corporation_of_Greater_Mumbai_logo.png',
          },
          {
            'name': 'Hyderabad Metropolitan Water Supply and Sewerage Board (HMWSSB)',
            'logo': 'https://www.hyderabadwater.gov.in/en/wp-content/themes/zmhmwssb/assets/images/logo.png',
          },
        ];

      } else if(widget.args.name == 'gas') {

        providers = [
          {
            'name': 'Indane Gas',
            'logo': 'https://upload.wikimedia.org/wikipedia/en/2/20/IndianOil_Indane_logo.png',
          },
          {
            'name': 'Bharat Gas',
            'logo': 'https://bharatpetroleum.in/images/logo.png',
          },
          {
            'name': 'HP Gas',
            'logo': 'https://www.hindustanpetroleum.com/themes/hpcl/images/logo.png',
          },
          {
            'name': 'Mahanagar Gas',
            'logo': 'https://upload.wikimedia.org/wikipedia/en/4/44/Mahanagar_Gas_logo.png',
          },
        ];

    } else if(widget.args.name == 'broadband') {

        providers = [
          {
            'name': 'BSNL',
            'logo': 'https://upload.wikimedia.org/wikipedia/en/7/76/BSNL_logo.svg',
          },
          {
            'name': 'JioFiber',
            'logo': 'https://upload.wikimedia.org/wikipedia/commons/2/2c/Reliance_Jio_Logo.svg',
          },
          {
            'name': 'ACT Fibernet',
            'logo': 'https://upload.wikimedia.org/wikipedia/en/e/ea/ACT_Fibernet_logo.svg',
          },
          {
            'name': 'Hathway',
            'logo': 'https://upload.wikimedia.org/wikipedia/en/2/27/Hathway_Logo.svg',
          },
          {
            'name': 'Spectra',
            'logo': 'https://spectra.co/assets/images/logo.svg',
          },
          {
            'name': 'Excitel',
            'logo': 'https://upload.wikimedia.org/wikipedia/commons/3/3a/Excitel_logo.svg',
          },
          {
            'name': 'Tikona',
            'logo': 'https://upload.wikimedia.org/wikipedia/en/c/c5/Tikona_Digital_Networks_logo.png',
          },
          {
            'name': 'MTNL',
            'logo': 'https://upload.wikimedia.org/wikipedia/en/0/0e/MTNL_Logo.svg',
          },
        ];


      } else if(widget.args.name == 'emi') {

        providers = [
          {
            'name': 'Bajaj Finserv',
            'logo': 'https://raw.githubusercontent.com/PiyushPoshiya/openfile/main/celebsBox/image/explore_bg.jpg',
          },
          {
            'name': 'HDFC Bank',
            'logo': 'https://raw.githubusercontent.com/PiyushPoshiya/openfile/main/celebsBox/image/explore_bg.jpg',
          },
          {
            'name': 'ICICI Bank',
            'logo': 'https://raw.githubusercontent.com/PiyushPoshiya/openfile/main/celebsBox/image/explore_bg.jpg',
          },
          {
            'name': 'Axis Bank',
            'logo': 'https://raw.githubusercontent.com/PiyushPoshiya/openfile/main/celebsBox/image/explore_bg.jpg',
          },
          {
            'name': 'Tata Capital',
            'logo': 'https://raw.githubusercontent.com/PiyushPoshiya/openfile/main/celebsBox/image/explore_bg.jpg',
          },
          {
            'name': 'Home Credit',
            'logo': 'https://raw.githubusercontent.com/PiyushPoshiya/openfile/main/celebsBox/image/explore_bg.jpg',
          },
          {
            'name': 'ZestMoney',
            'logo': 'https://raw.githubusercontent.com/PiyushPoshiya/openfile/main/celebsBox/image/explore_bg.jpg',
          },
          {
            'name': 'TVS Credit',
            'logo': 'https://raw.githubusercontent.com/PiyushPoshiya/openfile/main/celebsBox/image/explore_bg.jpg',
          },
        ];

      }

  }

  @override
  Widget build(BuildContext context) {
    final filteredProviders = providers
        .where((provider) => provider['name']
        .toLowerCase()
        .contains(searchQuery.toLowerCase()))
        .toList();

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        leading: const BackButton(color: Colors.white),
        title: const Text(
          'Select Service Provider',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            // Search Box
            Container(
              decoration: BoxDecoration(
                color: const Color(0xFF1E1E1E),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.grey.shade800),
              ),
              child: TextField(
                onChanged: (value) {
                  setState(() {
                    searchQuery = value;
                  });
                },
                style: const TextStyle(color: Colors.white),
                decoration: const InputDecoration(
                  hintText: 'Search service provider',
                  hintStyle: TextStyle(color: Colors.grey),
                  border: InputBorder.none,
                  prefixIcon: Icon(Icons.search, color: Colors.grey),
                ),
              ),
            ),
            const SizedBox(height: 20),
            // Provider List
            Expanded(
              child: ListView.builder(
                itemCount: filteredProviders.length,
                itemBuilder: (context, index) {
                  final provider = filteredProviders[index];
                  return ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Colors.grey,
                      backgroundImage: NetworkImage(provider['logo'] ?? 'https://raw.githubusercontent.com/PiyushPoshiya/openfile/main/celebsBox/image/explore_bg.jpg'),
                    ),
                    title: Text(
                      provider['name'],
                      style: const TextStyle(color: Colors.white),
                    ),
                    onTap: () {
                      context.push(Routes.selectProviderScreen, extra: SelectProviderArgument(name: widget.args.name)); // pushes onto stack
                    },
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}

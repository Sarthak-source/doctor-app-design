import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.sizeOf(context).width;

    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            _buildHeader(width),
            Transform.translate(
                offset: const Offset(0, 640),
                child: _buildChooseProblemsSection()),
            Transform.translate(
                offset: const Offset(0, 200),
                child: _buildAppointmentBookingSection()),
            const SizedBox(
              height: 2250,
            ),
            Transform.translate(
                offset: const Offset(0, 1250),
                child: _buildSpecialistsSection()),

                Transform.translate(offset: const Offset(0, 1950),child: _buildImageSection(width)),
          ],
        ),
      ),
    );
  }

  final Color customPurple = const Color(0xFF6B5AE0);

  Widget _buildHeader(width) {
    return ClipPath(
      clipper: OvalBottomClipper(curveDepth: 120),
      child: Container(
        padding: const EdgeInsets.all(20),
        color: customPurple,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(
                  children: [
                    CircleAvatar(
                      backgroundImage:
                          NetworkImage('https://example.com/user_image.png'),
                      radius: 30,
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 30),
                        Text('Welcome',
                            style:
                                TextStyle(color: Colors.white, fontSize: 18)),
                        Text('Misty Simon',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 22,
                                fontWeight: FontWeight.bold)),
                        SizedBox(height: 20),
                      ],
                    )
                  ],
                ),
                Icon(Icons.settings, color: Colors.white),
              ],
            ),
            _buildSearchBar(),
            const SizedBox(
              height: 200,
            )
          ],
        ),
      ),
    );
  }

  Widget _buildSearchBar() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
      ),
      child: const TextField(
        decoration: InputDecoration(
          hintText: 'Search doctor',
          prefixIcon: Icon(Icons.search),
          border: InputBorder.none,
          contentPadding: EdgeInsets.all(15),
        ),
      ),
    );
  }

  Widget _buildAppointmentBookingSection() {
    return Container(
      margin: const EdgeInsets.all(20),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const Text('Appointment Booking',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          const SizedBox(height: 20),
          _buildTextField('Enter Name'),
          _buildTextField('Choose Date & Time'),
          _buildDropdown('Choose Problem'),
          _buildDropdown('Choose Test'),
          _buildDropdown('Choose Consultation'),
          const SizedBox(height: 20),
          Center(
            child: PhysicalModel(
              elevation: 15,
              borderRadius: BorderRadius.circular(30),
              color: customPurple,
              shadowColor: customPurple,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: customPurple,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 100, vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: const Text('Book Appointment',
                    style: TextStyle(fontSize: 16)),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTextField(String hint) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: PhysicalModel(
        elevation: 10,
        borderRadius: BorderRadius.circular(30),
        color: Colors.white,
        child: TextField(
          decoration: InputDecoration(
            hintText: hint,
            filled: true,
            fillColor: Colors.white,
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: BorderSide.none,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildDropdown(String hint) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: PhysicalModel(
        elevation: 10,
        borderRadius: BorderRadius.circular(30),
        color: Colors.white,
        child: DropdownButtonFormField<String>(
          decoration: InputDecoration(
            hintText: hint,
            filled: true,
            fillColor: Colors.white,
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: BorderSide.none,
            ),
          ),
          items:
              <String>['Option 1', 'Option 2', 'Option 3'].map((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value, style: const TextStyle(fontSize: 16)),
            );
          }).toList(),
          onChanged: (newValue) {},
        ),
      ),
    );
  }

  Widget _buildChooseProblemsSection() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: const BoxDecoration(
        color: Colors.greenAccent,
        borderRadius: BorderRadius.all(
          Radius.circular(40),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const Text('Choose Problems',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          const SizedBox(height: 20),
          GridView.count(
            shrinkWrap: true,
            crossAxisCount: 2,
            physics: const NeverScrollableScrollPhysics(),
            mainAxisSpacing: 20,
            crossAxisSpacing: 20,
            children: <Widget>[
              _buildProblemCard('Dental Braces', Icons.brush),
              _buildProblemCard('Dental Crown', Icons.brush),
              _buildProblemCard('Dental Filling', Icons.settings),
              _buildProblemCard('Anesthesia', Icons.healing),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildProblemCard(String title, IconData icon) {
    String? selectedProblem;

    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.greenAccent.withOpacity(0.8),
            offset: const Offset(-6.0, -6.0),
            blurRadius: 16.0,
          ),
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            offset: const Offset(6.0, 6.0),
            blurRadius: 16.0,
          ),
        ],
        color: Colors.greenAccent,
        borderRadius: BorderRadius.circular(25.0),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.greenAccent.withOpacity(0.8),
                        offset: const Offset(-6.0, -6.0),
                        blurRadius: 16.0,
                      ),
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        offset: const Offset(6.0, 6.0),
                        blurRadius: 16.0,
                      ),
                    ],
                    color: Colors.greenAccent,
                    borderRadius: BorderRadius.circular(25.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Icon(icon, size: 40, color: customPurple),
                  ),
                ),
                const Spacer(),
                Radio<String>(
                  value: title,
                  groupValue: selectedProblem,
                  onChanged: (String? value) {
                    setState(() {
                      selectedProblem = value;
                    });
                  },
                ),
              ],
            ),
            const SizedBox(height: 10),
            Text(
              title,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSpecialistsSection() {
    return Container(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const Text('Our Specialists',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          const SizedBox(height: 10),
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 20,
              mainAxisSpacing: 35,
              childAspectRatio: 0.72,
            ),
            itemCount: 4, // Number of specialists
            itemBuilder: (context, index) {
              return _buildSpecialistCard();
            },
          ),
        ],
      ),
    );
  }

  Widget _buildSpecialistCard() {
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: const Color(0xFFF8F7FE),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            width: 110,
            height: 110,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              // boxShadow: [
              //   BoxShadow(
              //     color: Colors.grey.withOpacity(0.3),
              //     spreadRadius: 2,
              //     blurRadius: 7,
              //     offset: const Offset(0, 3),
              //   ),
              // ],
            ),
            child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.network(
                  'https://t3.ftcdn.net/jpg/02/43/12/34/360_F_243123463_zTooub557xEWABDLk0jJklDyLSGl2jrr.jpg',
                  fit: BoxFit.cover,
                )),
          ),
          const SizedBox(height: 10),
          const Text('Dr. Tracy Austin',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          const SizedBox(height: 5),
          const Text('Dental Specialist',
              style: TextStyle(fontSize: 14, color: Colors.grey)),
          const SizedBox(height: 10),
          Transform.translate(
            offset: const Offset(0, 40),
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: customPurple,
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              child: const Text('Book', style: TextStyle(fontSize: 16)),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildImageSection(width) {
    return SizedBox(
      width: width,
      height: 300,
      child: Image.asset(
        'assets/banner_image.png', // Replace with your image asset path
        fit: BoxFit.contain, // Ensures the image covers the entire screen
      ),
    );
  }

}

class OvalBottomClipper extends CustomClipper<Path> {
  final double curveDepth;

  OvalBottomClipper({this.curveDepth = 100});

  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height + 200 - curveDepth);
    path.quadraticBezierTo(size.width / 2, size.height + curveDepth, size.width,
        size.height - curveDepth);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}

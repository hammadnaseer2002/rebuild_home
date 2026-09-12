import 'dart:ui';
import 'package:flutter/material.dart';

class PrivacyPolicyScreen extends StatelessWidget {
  const PrivacyPolicyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.white),
        title: const Text(
          'Privacy Policy',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w400,
            fontSize: 20,
            letterSpacing: 0.5,
          ),
        ),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          // Background
          Positioned.fill(
            child: Image.asset(
              'assets/images/b.jpg',
              fit: BoxFit.cover,
            ),
          ),
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.black.withValues(alpha: 0.6),
                    Colors.black.withValues(alpha: 0.8),
                  ],
                ),
              ),
            ),
          ),
          // Blur
          Positioned.fill(
            child: RepaintBoundary(
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 16.0, sigmaY: 16.0),
                child: const SizedBox.expand(),
              ),
            ),
          ),
          // Content
          SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    'Privacy Policy for Home Rebuild',
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                  SizedBox(height: 16),
                  Text(
                    'Last updated: September 12, 2026',
                    style: TextStyle(fontSize: 14, color: Colors.white70),
                  ),
                  SizedBox(height: 24),
                  Text(
                    '1. Information Collection and Use',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600, color: Colors.white),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Home Rebuild is a renovation cost estimation application. We value your privacy and do not collect, transmit, or store any personal data on our servers. All project data, including estimates, room dimensions, and calculator configurations, are stored entirely locally on your device using SQLite.',
                    style: TextStyle(fontSize: 15, color: Colors.white70, height: 1.5),
                  ),
                  SizedBox(height: 20),
                  Text(
                    '2. Third-Party Services',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600, color: Colors.white),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'The app does not use any third-party services that may collect information used to identify you. No analytics or tracking SDKs are integrated into this application.',
                    style: TextStyle(fontSize: 15, color: Colors.white70, height: 1.5),
                  ),
                  SizedBox(height: 20),
                  Text(
                    '3. Local Storage',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600, color: Colors.white),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'The data you input into the app remains on your device. Deleting the application will permanently delete all associated estimates and projects. We do not have access to your locally stored data.',
                    style: TextStyle(fontSize: 15, color: Colors.white70, height: 1.5),
                  ),
                  SizedBox(height: 20),
                  Text(
                    '4. Changes to This Privacy Policy',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600, color: Colors.white),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'We may update our Privacy Policy from time to time. Thus, you are advised to review this page periodically for any changes. We will notify you of any changes by posting the new Privacy Policy on this page.',
                    style: TextStyle(fontSize: 15, color: Colors.white70, height: 1.5),
                  ),
                  SizedBox(height: 20),
                  Text(
                    '5. Contact Us',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600, color: Colors.white),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'If you have any questions or suggestions about our Privacy Policy, do not hesitate to contact us at the email provided on the Google Play Store listing.',
                    style: TextStyle(fontSize: 15, color: Colors.white70, height: 1.5),
                  ),
                  SizedBox(height: 60),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

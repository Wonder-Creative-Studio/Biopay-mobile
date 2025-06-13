import 'package:biopay_mobile/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../router/routes.dart';
import '../../../widgets/custom_filled_button.dart';

class UploadDocumentsScreen extends StatefulWidget {
  const UploadDocumentsScreen({super.key});

  @override
  State<UploadDocumentsScreen> createState() => _UploadDocumentsScreenState();
}

class _UploadDocumentsScreenState extends State<UploadDocumentsScreen> {
  // Placeholder for uploaded file names or paths
  String? businessRegistrationFileName;
  String? ownersIdFileName;

  // Function to handle file picking (placeholder)
  void _pickFile(String documentType) {
    setState(() {
      if (documentType == 'businessRegistration') {
        businessRegistrationFileName =
            'business_registration.pdf'; // Example file name
      } else if (documentType == 'ownersId') {
        ownersIdFileName = 'owners_id.jpg'; // Example file name
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 40),
            Text(
              "Upload Business\nDocuments",
              style: Theme.of(
                context,
              ).textTheme.headlineMedium?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              "Please upload your business registration and\nowner's ID for verification.",
              style: Theme.of(context).textTheme.titleMedium,
            ),
            Expanded(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 40),
                    Text(
                      "Business Registration",
                      style: TextStyle(fontSize: 14),
                    ),
                    SizedBox(height: 8),
                    GestureDetector(
                      // Use GestureDetector for the upload area
                      onTap: () => _pickFile('businessRegistration'),
                      child: Container(
                        height: 150,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: darkGreyColor, // Dark background color
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.image, size: 40, color: lightGreyColor),
                            const SizedBox(height: 8),
                            Text(
                              businessRegistrationFileName ??
                                  "Upload PDF or Image",
                              style: TextStyle(
                                fontSize: 16,
                                color: lightGreyColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      "Owner's ID (Aadhaar/Passport)",
                      style: TextStyle(fontSize: 14),
                    ),
                    SizedBox(height: 8),
                    GestureDetector(
                      // Use GestureDetector for the upload area
                      onTap: () => _pickFile('ownersId'),
                      child: Container(
                        height: 150,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: darkGreyColor, // Dark background color
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.cloud_upload_outlined,
                              size: 40,
                              color: lightGreyColor,
                            ),
                            const SizedBox(height: 8),
                            Text(
                              ownersIdFileName ?? "Upload PDF or Image",
                              style: TextStyle(
                                fontSize: 16,
                                color: lightGreyColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 40),
                    CustomFilledButton(
                      onPressed: () {
                        context.push(Routes.onboardingSuccess);
                      },
                      title: "Submit for Approval",
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24), // Add some space at the bottom
          ],
        ),
      ),
    );
  }
}

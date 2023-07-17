# Insta Clone

Insta Clone is a mobile application that replicates some of the core features of the popular social media platform Instagram. It allows users to sign up, create profiles with bios, and share images. The application utilizes Firebase for authentication, database management, and cloud storage.

## Screenshots

| Login Screen | Signup Screen |
| :---: | :---: |
| ![Login Screen](https://github.com/Mr-Manpreet-Singh/instaclone/raw/main/github_readme_screenshots/login_screen.png) | ![Signup Screen](https://github.com/Mr-Manpreet-Singh/instaclone/raw/main/github_readme_screenshots/signup_screen.png) |

| Signing Up Loading | Successfully Signed In - Mobile Screen |
| :---: | :---: |
| ![Signing Up Loading](https://github.com/Mr-Manpreet-Singh/instaclone/raw/main/github_readme_screenshots/signingup_loading.png) | ![Successfully Signed In - Mobile Screen](https://github.com/Mr-Manpreet-Singh/instaclone/raw/main/github_readme_screenshots/successfully_signin_mobilescreen.png) |


## Features

- **Firebase Sign-In Authentication:** Users can sign in to the application securely using their Firebase authentication credentials.
- **Firebase Sign-Up with Bio and Form:** New users can create an account by providing their desired credentials, including a bio and additional information.
- **Firebase Cloud Storage:** Images uploaded by users are stored securely on Firebase Cloud Storage, ensuring reliable and scalable storage for the application.
- **Firebase Database:** The application uses Firebase's real-time database for efficient and synchronized data storage and retrieval.

## Dependencies

The following dependencies are used in the Insta Clone application:

- `cloud_firestore: ^4.8.2`: A Flutter plugin that provides an API for accessing and managing Cloud Firestore, a flexible, scalable NoSQL cloud database.
- `firebase_auth: ^4.6.3`: A Flutter plugin that provides Firebase Authentication API, enabling user authentication using various methods.
- `firebase_core: ^2.14.0`: The FlutterFire plugin for Firebase Core, which provides basic Firebase setup and initialization functionality.
- `firebase_storage: ^11.2.4`: A Flutter plugin that enables uploading and downloading files to/from Firebase Cloud Storage.
- `flutter_svg: ^2.0.7`: A Flutter plugin that allows rendering SVG (Scalable Vector Graphics) files as Flutter widgets.
- `image_picker: ^1.0.0`: A Flutter plugin that provides an interface for selecting images and videos from the device's gallery or camera.

Please ensure that you have these dependencies configured correctly in your Flutter project to ensure proper functionality of the Insta Clone application.

## Getting Started

To get started with the Insta Clone application, follow these steps:

1. Set up your Flutter development environment by installing Flutter and setting up an emulator or connecting a physical device.
2. Create a new Flutter project or open an existing one.
3. Add the dependencies mentioned above to your `pubspec.yaml` file.
4. Run `flutter pub get` to fetch the dependencies.
5. Implement the required authentication, database, and storage configurations using the Firebase SDKs. Refer to the official Firebase documentation for detailed instructions.
6. Develop the application features, including sign-in, sign-up, profile creation, and image uploading.
7. Test the application using the emulator or physical device.
8. Deploy the application to your desired platform(s) using the appropriate deployment process for Flutter applications.

## License

The Insta Clone application is released under the [MIT License](https://opensource.org/licenses/MIT). Please review the license file for more information.

## Acknowledgements

The Insta Clone application is inspired by the features and design of Instagram. It utilizes the power and convenience of Firebase services for authentication, database management, and cloud storage. The project is developed and maintained by [Your Name] and is not affiliated with or endorsed by Instagram or Firebase.

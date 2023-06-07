<h1 align="center">
  <h1 align="center">The BeetleHR SDK Flutter</h1>
</h1>

The BeetleHR SDK Flutter is a powerful software development kit that allows developers to integrate BeetleHR functionality into their Flutter applications. BeetleHR is a human resources management platform that provides various features related to employee management, such as attendance tracking, leave management, and employee performance evaluation. This documentation will guide you through the process of integrating and utilizing the BeetleHR SDK in your Flutter projects.

## Features

Here are all the features available on our sdk, take advantage and make your development easier with us.

<details><summary>Server</summary>

- [x] feature to retrieve server status from an endpoint

</details>

<details><summary>Authentication Employee</summary>

- [x] login with email and password
- [x] reset password with email

</details>

<details><summary>Attendance Employee</summary>

- [x] get attendence overview
- [x] upload attendence image
- [x] get attendence logs
- [x] check placement office
- [ ] get attendance detail
- [ ] check accept clock
- [ ] clock attendence
- [ ] get schedule
- [ ] check accept clock attendance
- [ ] get schedule log
- [ ] get clock button type
- [ ] sync attendance
- [ ] upload attendance image
- [ ] cancel attendance
- [ ] break time
- [ ] check breaktime setting

</details>

## Beetlehr SDK Versions

*Note*: Updated to new sdk with new features.

## Documentation

## Get Started

Add dependency

You can add beetlehr_sdk in your [pubspec.yaml](https://docs.flutter.dev/packages-and-plugins/using-packages) or use the command to add beetlerhr_sdk as a dependency with the latest stable version:

```bash
flutter pub add beetlehr_sdk
```

If you want to use it directly from github you can add it in pubspec.yaml as follows:

```dart
dependencies:
  flutter:
    sdk: flutter

  beetlehr_sdk:
    git:
      url: https://github.com/kodingworks/beetlehr_sdk.git
      ref: master # branch name
```

## Initialisasi Client

Before using the function on the sdk, make sure you initialize the client. You can use Dependency Injection (DI) like [get_it](https://pub.dev/packages/get_it). so you don't have to always initialize your Client. here's an example of initialization that you can try:

```dart
BeetleHRClient client = BeetleHRClient(
  'https://demo.beetlehr.com/api/v1',
  isLog: true,
);
```

## Usage Simple

Here is an example of using login authentication with email and password, you don't need to save the token because this package already helps save it. but we still return the token from the login result so you can use it for other purposes. here's an example:

```dart
void login() async {
  try {
    final client = BeetleHRClient(
      'https://demo.beetlehr.com/api/v1',
      isLog: true,
    );

    final result = await client.loginWithEmail(
      email: 'email@email.com',
      password: 'password',
    );

    print(result.meta); // return MetaData
    print(result.token); // return String
    print(result.user); // return UserModel
  } catch (e) {
    print('Something wrong!');
  }
}
```

## Error Handling

| Name                     | Item                                  |
| :--------------------    |:------------------------------------- |
|  Exception               | ServerException                       |
|                          | GeneralServerException                |
|                          | TimeOutServerException                |
|                          | NotFoundServerException               |
|                          | UnAuthenticationServerException       |
|                          | UnAuthorizeServerException            |
|                          | InternalServerException               |
|  Failure                 | CodeFailure                           |
|                          | ServerFailure                         |

## Community & Group Discussion 
You could join us at Telegram Group https://t.me/+Fbaf_eCVHEg4NTY1

## Contributing
We are very glad if you want to contribute and join our community.
Please take note when you make a pull request. You must be very clear when making a commit message. 
When you contribute code, the best thing to do is imitate the existing pattern BeetleHR code.

<!-- ## License
Beetlehr is released under the [AGPL-3.0](./LICENSE) license. -->
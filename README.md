# mau_lab_tech_test

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.


## Library Used

- [Get It](https://pub.dev/packages/get_it)
- [Dio](https://pub.dev/packages/dio)
- [Provider](https://pub.dev/packages/provider)
- [Path Provider](https://pub.dev/packages/path_provider)
- [Flutter Dotenv](https://pub.dev/packages/flutter_dotenv)
- [Cached Network Image](https://pub.dev/packages/cached_network_image)
- [intl](https://pub.dev/packages/intl)

## QnA
Question

- What kind of architecture did you use?
    - I use custom provider that similar like clean architecture 
- What libraries did you add to the app? What are they used for? if you not rely the other library tell us why?
    - Get It : For Dependency injector
    - Dio : For Http request
    - Provider : For state management
    - Flutter Dotenv : For read .env file
    - Cached Network Image: For render image with url
    - intl : For date format
- How long did you spend on the test?
    - 4 hours
- If you had more time, what further improvements or new features would you add?
    - Add connectivity check, in home page ill add tab for candidate and blog, improve UI list item, and also improve UI detail page.
- Which parts of your submission are you most proud of? And why? little advice, don't answer whole project, use one what you think it special.
    - function for combine candidate and blog data, because i need extra domain for mapping it.
- Which parts did you spend the most time with? What did you find most difficult?
    - creating skeleton
- How did you find the test overall? If you have any suggestions on how we can improve the test or our API, we'd love to hear them, please elaborate more about this.
    - i think, you can describe more about the requirement. I feel a little confused to understand it. maybe you can attach a wire frame, that can helpful.
    - for the API it already good enough for me, but maybe it's better not use id = 0 in address API. 
- The last question, quality or quantity?
    - quality of course.

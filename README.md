## Get Started

### Prerequirements
- xcode 8.0+

### Installation steps
1. Install Uber Rides SDK for iOS to your Application. There are [a few ways how to do it](https://github.com/uber/rides-ios-sdk#getting-started)
2. Install `react-native-uber-rides` by using [RNPM](http://github.com/rnpm/rnpm)
3. [Configure iOS 9.0](https://github.com/uber/rides-ios-sdk#configuring-ios-90)
4. [Configure SDK](https://github.com/uber/rides-ios-sdk#sdk-configuration)
5. Use it:

  ```js
  var UberLogin = require('react-native-uber-rides').LoginButton;
  // ...
  class Foo extends React.Component {
    render() {
      return (
        <View ...>
          <UberLogin
            onLogin={fn?}
            onLoginError={fn?}
            onLogout={fn?} />
        </View>
      );
    }
  }

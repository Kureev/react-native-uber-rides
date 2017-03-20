## Uber Rides SDK port to React Native

[![Greenkeeper badge](https://badges.greenkeeper.io/Kureev/react-native-uber-rides.svg)](https://greenkeeper.io/)

![Uber Rides for React Native](https://s31.postimg.org/5s35dq9kb/uber.jpg)

## Get Started

### Prerequirements
- xcode 8.0+
- deployment target 8.0+

### Installation steps
1. `$ rnpm install react-native-uber-rides`
2. [Configure SDK](https://github.com/uber/rides-ios-sdk#configuring-ios-90)
3. Use it:

  ```js
  import {LoginButton, RideRequestButton} from 'react-native-uber-rides';
  // ...
  class Foo extends React.Component {
    render() {
      return (
        <View ...>
          <LoginButton
            onLogin={fn?}
            onLoginError={fn?}
            onLogout={fn?} />
          <RideRequestButton
            pickup={{latitude: 0.0, longitude: 0.0}}
            dropoff={{latitude: 1.0, longitude: 1.0}} />
        </View>
      );
    }
  }

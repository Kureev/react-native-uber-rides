## Get Started

### Prerequirements
- xcode 8.0+
- deployment target 8.0+

### Installation steps
1. `$ rnpm install react-native-uber-rides`
3. [Configure SDK](https://github.com/uber/rides-ios-sdk#configuring-ios-90)
5. Use it:

  ```js
  import {LoginButton} from 'react-native-uber-rides';
  // ...
  class Foo extends React.Component {
    render() {
      return (
        <View ...>
          <LoginButton
            onLogin={fn?}
            onLoginError={fn?}
            onLogout={fn?} />
        </View>
      );
    }
  }

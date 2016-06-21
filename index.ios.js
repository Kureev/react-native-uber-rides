import React, { Component } from 'react';
import LoginButton from './src/LoginButton';
import {
  AppRegistry,
  StyleSheet,
  Text,
  View
} from 'react-native';

class RNUberRides extends Component {
  render() {
    return (
      <View style={styles.container}>
        <Text style={styles.welcome}>
          React Native Uber SDK
        </Text>
        <Text style={styles.instructions}>
          To get started, please, check the readme
        </Text>

        <LoginButton style={styles.uberButton}
          onLogout={() => alert('LOGOUT')}
          onLogin={() => alert('LOGIN')}
          onLoginError={() => alert('ERROR')}
        />
      </View>
    );
  }
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    justifyContent: 'center',
    alignItems: 'center',
    backgroundColor: '#F5FCFF',
  },
  welcome: {
    fontSize: 20,
    textAlign: 'center',
    margin: 10,
  },
  instructions: {
    textAlign: 'center',
    color: '#333333',
    marginBottom: 5,
  },
  uberButton: {
    marginTop: 10,
  },
});

AppRegistry.registerComponent('RNUberRides', () => RNUberRides);

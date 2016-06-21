import React from 'react';
import {requireNativeComponent, StyleSheet} from 'react-native';

const style = StyleSheet.create({
  button: {
    width: 250,
    height: 50,
    backgroundColor: 'black',
    borderRadius: 7,
  },
});

const Button = requireNativeComponent('LoginButton', null);

function UberLoginButton(props) {
  const {onLogin, onLogout, onLoginError} = props;
  return (
    <Button
      style={[style.button, props.style]}
      onLogin={onLogin}
      onLogout={onLogout}
      onLoginError={onLoginError}
    />
  );
};

UberLoginButton.propTypes = {
  /**
   * Callback that is called with accessToken & refreshToken
   * if user is successfully authorized
   * @param {String} nativeEvent.accessToken
   * @param {String} nativeEvent.refreshToken
   */
  onLogin: React.PropTypes.func,
  /**
   * Callback that is called with error message
   * if any error occurs during the login process
   * @param {String} nativeEvent.error
   */
  onLoginError: React.PropTypes.func,
  /**
   * Callback that is called with `logout` parameter after user's logout
   * @param {Boolean} nativeEvent.logout
   */
  onLogout: React.PropTypes.func,
};

UberLoginButton.defaultProps = {
  onLogin: () => {},
  onLoginError: () => {},
  onLogout: () => {},
};

export default UberLoginButton;

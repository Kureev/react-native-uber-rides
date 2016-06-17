import React from 'react';
import { requireNativeComponent } from 'react-native';

const style = {
  width: 300,
  height: 50,
  backgroundColor: 'black',
  borderRadius: 7,
  marginTop: 10
};

const Button = requireNativeComponent('LoginButton', null);

export default function UberLoginButton(props) {
  return <Button style={style}/>
};

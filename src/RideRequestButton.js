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

const Button = requireNativeComponent('RideRequestButton', null);

function UberRideRequestButton(props) {
  const {pickup, dropoff} = props;
  return (
    <Button
      style={[style.button, props.style]}
      pickup={pickup}
      dropoff={dropoff}
    />
  );
};

Button.propTypes = {
  pickup: React.PropTypes.object,
  dropoff: React.PropTypes.object,
};


export default UberRideRequestButton;

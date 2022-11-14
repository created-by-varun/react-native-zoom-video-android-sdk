import React from 'react';
import { IntroScreen } from './screens/intro-screen';
import { JoinScreen } from './screens/join-screen';
import { CallScreen } from './screens/call-screen';
import { MenuDrawer } from './components/menu-drawer';
import { createDrawerNavigator } from '@react-navigation/drawer';
import { createStackNavigator } from '@react-navigation/stack';

const Stack = createStackNavigator();
const Drawer = createDrawerNavigator();

function MainNavigation() {
  return (
    <Stack.Navigator initialRouteName="Intro">
      <Stack.Screen
        name="Intro"
        component={IntroScreen}
        options={{ headerShown: false }}
      />
      <Stack.Screen name="Join" component={JoinScreen} options={{title: ''}} />
      <Stack.Screen
        name="Call"
        component={CallScreen}
        options={{ headerShown: false }}
      />
    </Stack.Navigator>
  );
}

export function Navigation() {
  return (
    <Drawer.Navigator initialRouteName="Main" drawerContent={MenuDrawer}>
      <Drawer.Screen
          name="Main"
          component={MainNavigation}
          options={{headerShown: false}}
      />
    </Drawer.Navigator>
  );
}

import React from 'react';
import { StyleSheet, Text, TextInput, View } from 'react-native';

export interface TextInputRowProps {
  label: string;
  value: string;
  onChangeText: (text: string) => void;
  placeholder?: string;
  secureTextEntry?: boolean;
  keyboardType: any;
}

export function TextInputRow({
  label,
  value,
  onChangeText,
  placeholder,
  secureTextEntry,
  keyboardType,
}: TextInputRowProps) {
  return (
    <View style={styles.container}>
      <View style={styles.textWrapper}>
        <Text style={styles.text}>{label}</Text>
      </View>
      <TextInput
        style={styles.input}
        placeholder={placeholder}
        keyboardType={keyboardType}
        clearButtonMode="while-editing"
        value={value}
        onChangeText={onChangeText}
        secureTextEntry={secureTextEntry}
        autoCapitalize="none"
      />
    </View>
  );
}

const styles = StyleSheet.create({
  container: {
    marginLeft: 10,
    paddingVertical: 5,
    alignItems: 'center',
    flexDirection: 'row',
    borderBottomColor: '#8b8b9b',
    borderBottomWidth: StyleSheet.hairlineWidth,
  },
  textWrapper: {
    flex: 1,
  },
  text: {
    color: '#8b8b9b',
  },
  input: {
    flex: 2,
    height: 40,
  },
});

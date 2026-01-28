import React from "react";
import { SafeAreaView, StyleSheet, Text, View } from "react-native";

export default function App() {
  return (
    <SafeAreaView style={styles.safe}>
      <View style={styles.container}>
        <Text style={styles.title}>FLUX</Text>
        <Text style={styles.subtitle}>Realtime chat + voice, Work/Game modes.</Text>
      </View>
    </SafeAreaView>
  );
}

const styles = StyleSheet.create({
  safe: {
    flex: 1,
    backgroundColor: "#0f1115",
  },
  container: {
    flex: 1,
    alignItems: "center",
    justifyContent: "center",
    paddingHorizontal: 24,
  },
  title: {
    fontSize: 32,
    fontWeight: "700",
    color: "#f2f5ff",
    marginBottom: 8,
  },
  subtitle: {
    fontSize: 14,
    color: "#9aa3b2",
    textAlign: "center",
  },
});

import React from "react";
import ReactDOM from "react-dom/client";

const root = ReactDOM.createRoot(document.getElementById("root")!);

root.render(
  <React.StrictMode>
    <div style={{ fontFamily: "system-ui, sans-serif", padding: 32 }}>
      <h1>FLUX Web</h1>
      <p>Realtime chat + voice, Work/Game modes.</p>
    </div>
  </React.StrictMode>
);

import React from "react";
import "./App.css";

import img1 from "./assets/1.png";
import img2 from "./assets/2.png";
import img3 from "./assets/3.png";
import img4 from "./assets/4.png";
import img5 from "./assets/5.png";
import img6 from "./assets/6.png";
import img7 from "./assets/7.png";
import img8 from "./assets/8.png";

const images = [img1, img2, img3, img4, img5, img6, img7, img8];

function App() {
  return (
    <div className="scroll-container">
      {images.map((src, index) => (
        <img key={index} src={src} alt={`Image ${index + 1}`} />
      ))}
    </div>
  );
}

export default App;

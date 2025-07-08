# 🎧 Fourier Analysis of Trombone Audio Signal

This MATLAB project performs a spectral analysis of a real audio signal (`trombon.wav`) using the Fast Fourier Transform (FFT). The program extracts frequency components, generates a spectrogram, reconstructs the signal using a limited number of harmonics, and evaluates the reconstruction accuracy using Mean Squared Error (MSE).

---

## ⚙️ Technologies

- MATLAB R2020a+  
- Fast Fourier Transform (FFT)  
- Signal processing  
- Time-frequency visualization (Spectrogram)  
- MSE analysis

---

## 📁 Project Structure

```text
📂 root/
│
├── analiza_fourier.m         # Main MATLAB script
├── trombon.wav               # Audio signal file (not included in public repo)
├── docs/
│   ├── spectrum.png          # Screenshot of amplitude spectrum
│   ├── spectrogram.png       # Screenshot of spectrogram
│   └── mse_graph.png         # Screenshot of MSE plot
└── README.md                 # Project documentation

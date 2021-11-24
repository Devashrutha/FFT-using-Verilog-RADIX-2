# FFT-using-Verilog(RADIX-2)
 [![Generic badge](https://img.shields.io/badge/verilog_test-passed-green.svg)](https://user-images.githubusercontent.com/61559101/142257997-073c9d52-ccb6-4d82-a8e0-6f7274240be6.PNG)
[![Generic badge](https://img.shields.io/badge/RTL-schematic-red.svg)](https://user-images.githubusercontent.com/61559101/142258670-43d4ec95-bba3-4086-84b8-b5293848a852.PNG)


 
FFT is responsible for converting a signal into individual spectral components and thereby providing frequency information about the signal. The implementation of FFT is very efficient and vast in the field of Digital Signal Processing and Communication. Verilog implementation of the floating point FFT with reduced generation logic or reduced complexity is the proposed architecture, where the
two inputs and two outputs of butterflies can be used to exchange all data and addresses in FFT dispensation, can be stored or reordered. 

INTRODUCTION:

Fast Fourier Transform (FFT) is an algorithm that computes the discrete Fourier transform (DFT) of a N point sequence or the inverse (IDFT) of it. We know that Fourier Transform or Fourier Series converts the signal from its original domain (time or space) to a
representation in the frequency domain and vice versa. Basically, the DFT is obtained by decomposing the sequence of values into components of different frequency. This operation is useful in many fields but computing it directly from the definition is often too slow and comparatively complex to be practical.

The Fast Fourier Transform (FFT) rapidly computes such transformation by factorizing the
DFT matrix into a product of sparse (mostly zeros) factors. As a result, it reduces the
complexity of computing DFT in many factors as shown in the table below.

![FFT_1](https://user-images.githubusercontent.com/61559101/141434347-4de1735f-b0f2-48ff-8648-708fa8c1ac1d.PNG)

The difference in the speed can be enormous, especially for long data sequences where N may
be in the thousands or millions. Many FFT algorithms are much more accurate than
evaluating the DFT directly from the definition.

Decimation In Time(DIT) FFT algorithm rearranges the DFT formula into 2 parts, as a sum of odd and even parts.







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

DIT FFT:

Decimation In Time(DIT) FFT algorithm rearranges the DFT formula into 2 parts, as a sum of odd and even parts.

![DFT to FFT](https://user-images.githubusercontent.com/61559101/143253529-b7cce322-2402-4afd-89b7-3ef26a9e399b.PNG)

For even numbered discrete time indices n=[0,2,4,..,N-2] and odd numbered discrete time indices n=[1,3,5,...,N-1]. The odd indexed DFT is multiplied by a twiddle factor term WkN=e^−(i2πkN). This is called a decimation in time because the time samples are rearranged in alternating groups, and a radix-2 algorithm because there are two groups.

The number of stages in the flowgraph is given by M=log2N, where N is the length of the sequence.

📌3 stages to construct an 8-point DFT using Radix-2 FFT algorithm

🔺STAGE 1:
Consists of 4 butterflies. Each butterfly has 2 inputs and two outputs. The inputs are given 
after the bit reversal of the input sequence.

🔺STAGE 2:
The input samples to each butterfly are separated by N/4 samples i.e., 2 samples and there are 
two sets of butterflies. In each set of butterflies, the twiddle factor exponents are the same and 
separated by two.

🔺STAGE 3:
This stage includes decomposing of N/4 points transforms into N/8 points transforms.

Bit Reversal:
| BIT REVERSED BINARY(INPUT)  | BINARY(OUTPUT) |
| ------------- | ------------- |
| 000 x(0)  | 000 X(0)  |
| 100 x(4)  | 001 X(1)  |
| 010 x(2)  | 010 X(2)  |
| 110 x(6)  | 011 X(3)  |
| 001 x(1)  | 100 X(4)  |
| 101 x(5)  | 101 X(5)  |
| 011 x(3)  | 110 X(6)  |
| 111 x(7)  | 111 X(7)  |

Stages of 8-Point DIT FFT Algorithm:

![Stages of 8 point FFt](https://user-images.githubusercontent.com/61559101/143257088-70ef836a-7a97-466b-bb05-28c585471795.PNG)

 Flow Graph of 8-Point DIT FFT Algorithm:
 
![8 point DIT FFT](https://user-images.githubusercontent.com/61559101/143257478-decf9d98-5d57-4b2e-9c7e-fcf304a62d98.png)


Summary:

1) The number of input samples N = 2M , where, M is an integer.
2) The input sequence is shuffled through bit-reversal.
3) The number of stages in the flowgraph is given by M=log2N.
4) Each stage consists of N/2 butterflies.
5) Inputs/outputs of each butterfly are separated by 2^(m-1) samples,where m representsthe stage index, i.e., for first stage m=1 and for the second stage m=2 so on.
6) The number of complex multiplications is given by (N/2)𝐥𝐨𝐠𝟐 𝑵.
7) The number of complex additions is given by N*log2N.
8) The twiddle factor exponents are a function of the stage index m and is given by k=(N*t/2^m) where, t=0,1,2,.....2^(m-1) -1.
9) The number of sets or sections of butterflies in each stage is given by the formula
2^(M-m).
10)The exponent repeat factor (ERF), which is the number of times the exponent sequence associated with m is repeated is given by 2^(M-n).`

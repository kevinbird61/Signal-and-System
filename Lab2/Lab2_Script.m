# Calculate RC circuit

# Get the Input of the system - Square_wave
[Wave , T] = Square_wave(1,-1,100,0.5,1,44100);

# Calculate the RC circuit
R = 100;
C = 10e-6;

RC_cir = 1/(R*C) * exp(-T/R*C);

squareWaveLDS = conv(Wave,RC_cir);

convtime = (-44100:1:44100)*(1/44100);

squareWaveLDS = [0,squareWaveLDS,0];

plot(convtime,squareWaveLDS,'b');


# plot(T,Wave);
# axis([0 , 1 , -1.1 , 1.1]);
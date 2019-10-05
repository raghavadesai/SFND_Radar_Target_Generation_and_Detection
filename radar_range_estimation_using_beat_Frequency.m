% TODO : Find the Bsweep of chirp for 1 m resolution
c         = 3 * 10^8; % speed of light in m/s
d_res     = 1; % desired distance reoslution in m
Bsweep    = c/(2*d_res);


% TODO : Calculate the chirp time based on the Radar's Max Range
range_max = 300; % radar system's mas range
Ts        = 5.5*(2*range_max/c);


% TODO : define the frequency shifts 
beat_freq  = [0 1.1e6 13e6 24e6];
calculated_range =  c *beat_freq*Ts/( 2 * Bsweep);


% Display the calculated range
disp(calculated_range);
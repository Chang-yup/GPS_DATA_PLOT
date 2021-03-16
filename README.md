# GPS_NMEA_PLOT
plotting GPS NMEA Data by matlab

You can see animated GPS trajectory on matlab.


# How to use

1. Load your GPS log on GPS_NMEA_DATA_PLOT.m

2. Change 'fileID = fopen('INCH-RTCM32_TEST.log');' into 'fileID = fopen('your_log_data');'

3. Run it.

If you don't want to see animation, You can see whole trajectory only.

Comment out the 'Animated Plot' and uncomment 'Plot'. You will see whole trajectory.

# Description
GPS_NMEA_DATA_PLOT : Main matlab code.

INCH-RTCM32_TEST.log : GPS log file I used.

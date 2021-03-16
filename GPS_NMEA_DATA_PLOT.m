clc
clear all
close all

%% Load NMEA DATA & Count number of lines
fileID = fopen('INCH-RTCM32_TEST.log');
raw = fscanf(fileID,'%s');
N_lines = count(raw,'$');
fclose('all');

%% Initializing
n = 0;

%% Extracting GNGGA DATA
fileID = fopen('INCH-RTCM32_TEST.log');
for k=1:N_lines
    tline = fgetl(fileID);
    tline=extractBetween(tline,'GNGGA',',,');
    A = cell2mat(tline);
    
    if size(A) == 0
        n=n+1;
    end
    if size(A) ~= 0
        DATA{k-n}=A;
    end
    
end

fclose('all');
A=size(DATA);
N_DATA = A(2);

%% Extracting Zulu time, Latitude, Longtitude Conversion cell to double
for k=1:N_DATA
    time_cell_H(k)=extractBetween(DATA(k),2,3);
    time_cell_M(k)=extractBetween(DATA(k),4,5);
    time_cell_S(k)=extractBetween(DATA(k),6,7);
    
    lat_cell_D(k)=extractBetween(DATA(k),12,13);
    lat_cell_M(k)=extractBetween(DATA(k),14,21);
    long_cell_D(k)=extractBetween(DATA(k),25,27);
    long_cell_M(k)=extractBetween(DATA(k),28,35);
    
    time_raw_H(k)=str2double(time_cell_H(k));
    time_raw_M(k)=str2double(time_cell_M(k));
    time_raw_S(k)=str2double(time_cell_S(k));
    
    lat_raw_D(k)=str2double(lat_cell_D(k));
    lat_raw_M2D(k)=str2double(lat_cell_M(k))/60;
    long_raw_D(k)=str2double(long_cell_D(k));
    long_raw_M2D(k)=str2double(long_cell_M(k))/60;
end

%% Conversion minute to degree
lat_D = lat_raw_D + lat_raw_M2D;
long_D = long_raw_D + long_raw_M2D;

%% Geo plot
gx = geoaxes;
geoplot(gx,lat_D,long_D,'-o')
geobasemap(gx,'satellite')

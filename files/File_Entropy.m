clc
clear all
close all
[file,path] = uigetfile('*.txt');
if isequal(file,0)
   return;
end
fid = fopen(fullfile(path,file),'r');
x16=fread(fid,Inf,'uint16');%Persian
fclose(fid);
fid = fopen(fullfile(path,file),'r');
x8=fread(fid,Inf,'uint8');%English
fclose(fid);
hist(x8,max(x8)-min(x8)+1)
x8u=unique(x8);
for i = 1:length(x8u)
    p(i)=sum((x8==x8u(i)))/length(x8);
end
E8 = sum(-p.*log(p))
figure
hist(x16,max(x16)-min(x16)+1)
x16u=unique(x16);
for i = 1:length(x16u)
    p16(i)=sum((x16==x16u(i)))/length(x16);
end
E16 = sum(-p16.*log(p16))
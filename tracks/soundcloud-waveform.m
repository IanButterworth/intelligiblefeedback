scim=imread('soundcloud_logo.bmp');
figure(1)
hold off
subplot(3,1,1)
imagesc(scim)
axis image;
i=1;
currentrow(1)=0;
m=1;
for c = 1:size(scim,2)
    c/size(scim,2)
   for r = 1:size(scim,1)
       if scim(r,c) == 0
           currentrow(i) = r;
           i=i+1;
       end
   end
   for n = 1:25
       if size(currentrow,2) < 18
        noiseshape(m)= 630;  
       else
        noiseshape(m) = currentrow(randsample(size(currentrow,2),1));
       end
       m = m + 1;
   end
   clear currentrow
   i=1;
end

subplot(3,1,2)
plot(noiseshape)
axis tight

subplot(3,1,3)
waveform =630-noiseshape;
wlog = waveform.^3;
wn = wlog/max(wlog);

plot(wn)
axis tight

wavwrite(wn,44100,'scwaveform_log3.wav');

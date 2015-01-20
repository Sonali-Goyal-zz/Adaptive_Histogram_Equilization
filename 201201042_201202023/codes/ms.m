function Test_Project2()
%% Load in our test images.

[file path] = uigetfile('*.*');
univ=imread(file);
%% Build a few images of our own.

bands = zeros(500);
bands(:,100:199) = 0.25;
bands(:,200:299) = 0.50;
bands(:,300:399) = 0.75;
bands(:,400:499) = 1.0;




%% Normal histogram equalization tests.

tic;
he_univ = histoeq( univ, 256, 0, 256 );
toc

%% Show results

imshow(he_univ);
waitforbuttonpress;



%% Generate the histogram results

bar(histogram(univ, 256, 0, 256));
set(gca, 'xlim',[0 256]);
waitforbuttonpress;
bar(histogram(he_univ, 256, 0, 1));
set(gca, 'xlim',[0 256]);
waitforbuttonpress;




%% Save the results

imwrite(he_univ,   'images/he_univ.jpg', 'jpg');



%% Special equalization tests.

tic;
he_univ_128 = histoeq( univ, 128, 0, 256 );
toc
tic;
he_univ_64 = histoeq( univ, 64, 0, 256 );
toc
tic;
he_univ_32 = histoeq( univ, 32, 0, 256 );
toc
tic;
he_univ_16 = histoeq( univ, 16, 0, 256 );
toc


%% Show special equalization tests.

imshow(he_univ_128);
waitforbuttonpress;
imshow(he_univ_64);
waitforbuttonpress;
imshow(he_univ_32);
waitforbuttonpress;
imshow(he_univ_16);
waitforbuttonpress;


%% Save special equalization tests.

he_univ_x4 = [he_univ_128; he_univ_64; he_univ_32; he_univ_16];
imwrite(he_univ_x4,  'images/he_univ_x4.jpg', 'jpg');
%imwrite(he_univ_128, 'images/he_univ_128.jpg', 'jpg');
%imwrite(he_univ_64,  'images/he_univ_64.jpg', 'jpg');
%imwrite(he_univ_32,  'images/he_univ_32.jpg', 'jpg');
%imwrite(he_univ_16,  'images/he_univ_16.jpg', 'jpg');


%% Adaptive equalization tests.

i=[3 6 12 24 99 198];

ahe_univ = [];

if size(univ, 3)==3
univ = rgb2gray(univ);
end
ctnt=0;
for ii=i
    ctnt=ctnt+1
    tic;
    ahe_univ = [ahe_univ; AHE( univ, 256, ii )];
    toc;
end
%% Show adaptive equalization tests.

imshow(ahe_univ);
waitforbuttonpress;

%% Save adaptive equalization tests.

imwrite(ahe_univ,   'images/ahe_univ.tif', 'tif');





%% CLAHE tests

clahe_univ = [];
i=[99 198];
for ii=i
    for k=0.4:0.2:0.8
        tic;
        clahe_univ = [clahe_univ; CLAHE( univ, 256, k, ii )];
        toc

    end
end

%% Show clahe tests.

imshow(clahe_univ);
waitforbuttonpress;


%% Save clahe tests.

imwrite(clahe_univ,   'images/clahe_univ.jpg', 'jpg');

end


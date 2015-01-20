function Test_Project2()
%% Load in our test images.

univ = imread('university.jpg');
batman = imread('batman.jpg');
crowd = imread('crowd.jpg');
sky = imread('sky.jpg');

%% Build a few images of our own.

bands = zeros(500);
bands(:,100:199) = 0.25;
bands(:,200:299) = 0.50;
bands(:,300:399) = 0.75;
bands(:,400:499) = 1.0;

saltnpepper = rand(300);

imwrite(bands,   'bands.jpg', 'jpg');
imwrite(saltnpepper,   'saltnpepper.jpg', 'jpg');

walle = imread('WallE.jpg');


%% Normal histogram equalization tests.

tic;
he_univ = histoeq( univ, 256, 0, 256 );
toc
tic;
he_chang = histoeq( batman, 256, 0, 256 );
toc
tic;
he_crowd = histoeq( crowd, 256, 0, 256 );
toc
tic;
he_portal = histoeq( sky, 256, 0, 256 );
toc
tic;
he_bands = histoeq( bands, 256, 0, 1 );
toc
tic;
he_snp = histoeq( saltnpepper, 256, 0, 1 );
toc
tic;
he_walle = histoeq( walle, 256, 0, 256 );
toc

%% Show results

imshow(he_univ);
waitforbuttonpress;

imshow(he_chang);
waitforbuttonpress;

imshow(he_crowd);
waitforbuttonpress;

imshow(he_portal);
waitforbuttonpress;

imshow(he_bands);
waitforbuttonpress;

imshow(he_snp);
waitforbuttonpress;

imshow(he_walle);
waitforbuttonpress;

%% Generate the histogram results

bar(histogram(univ, 256, 0, 256));
set(gca, 'xlim',[0 256]);
waitforbuttonpress;
bar(histogram(he_univ, 256, 0, 1));
set(gca, 'xlim',[0 256]);
waitforbuttonpress;

bar(histogram(batman, 256, 0, 256));
set(gca, 'xlim',[0 256]);
waitforbuttonpress;
bar(histogram(he_chang, 256, 0, 1));
set(gca, 'xlim',[0 256]);
waitforbuttonpress;

bar(histogram(crowd, 256, 0, 256));
set(gca, 'xlim',[0 256]);
waitforbuttonpress;
bar(histogram(he_crowd, 256, 0, 1));
set(gca, 'xlim',[0 256]);
waitforbuttonpress;

bar(histogram(sky, 256, 0, 256));
set(gca, 'xlim',[0 256]);
waitforbuttonpress;
bar(histogram(he_portal, 256, 0, 1));
set(gca, 'xlim',[0 256]);
waitforbuttonpress;

bar(histogram(bands, 256, 0, 1));
set(gca, 'xlim',[0 256]);
waitforbuttonpress;
bar(histogram(he_bands, 256, 0, 1));
set(gca, 'xlim',[0 256]);
waitforbuttonpress;

bar(histogram(saltnpepper, 256, 0, 1));
set(gca, 'xlim',[0 256]);
waitforbuttonpress;
bar(histogram(he_snp, 256, 0, 1));
set(gca, 'xlim',[0 256]);
waitforbuttonpress;

bar(histogram(walle, 256, 0, 256));
set(gca, 'xlim',[0 256]);
waitforbuttonpress;
bar(histogram(he_walle, 256, 0, 1));
set(gca, 'xlim',[0 256]);
waitforbuttonpress;


%% Save the results

imwrite(he_univ,   'images/he_univ.jpg', 'jpg');
imwrite(he_chang,  'images/he_chang.jpg', 'jpg');
imwrite(he_crowd,  'images/he_crowd.jpg', 'jpg');
imwrite(he_portal, 'images/he_portal.jpg', 'jpg');
imwrite(he_bands,  'images/he_bands.jpg', 'jpg');
imwrite(he_snp,    'images/he_snp.jpg', 'jpg');
imwrite(he_walle,  'images/he_walle.jpg', 'jpg');


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
%%
tic;
he_crowd_20 = histoeq( crowd, 256, 0, 256, 0.20 );
toc
tic;
he_crowd_40 = histoeq( crowd, 256, 0, 256, 0.40 );
toc
tic;
he_crowd_60 = histoeq( crowd, 256, 0, 256, 0.60 );
toc
tic;
he_crowd_80 = histoeq( crowd, 256, 0, 256, 0.80 );
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
imshow(he_crowd_20);
waitforbuttonpress;
imshow(he_crowd_40);
waitforbuttonpress;
imshow(he_crowd_60);
waitforbuttonpress;
imshow(he_crowd_80);
waitforbuttonpress;

%% Save special equalization tests.

he_univ_x4 = [he_univ_128; he_univ_64; he_univ_32; he_univ_16];
imwrite(he_univ_x4,  'images/he_univ_x4.jpg', 'jpg');
%imwrite(he_univ_128, 'images/he_univ_128.jpg', 'jpg');
%imwrite(he_univ_64,  'images/he_univ_64.jpg', 'jpg');
%imwrite(he_univ_32,  'images/he_univ_32.jpg', 'jpg');
%imwrite(he_univ_16,  'images/he_univ_16.jpg', 'jpg');
he_crowd_x4 = [he_crowd_20; he_crowd_40; he_crowd_60; he_crowd_80];
imwrite(he_crowd_x4,  'images/he_crowd_x4.jpg', 'jpg');
%imwrite(he_crowd_20,  'images/he_crowd_20.jpg', 'jpg');
%imwrite(he_crowd_40,  'images/he_crowd_40.jpg', 'jpg');
%imwrite(he_crowd_60,  'images/he_crowd_60.jpg', 'jpg');
%imwrite(he_crowd_80,  'images/he_crowd_80.jpg', 'jpg');

%% Adaptive equalization tests.

i=[3 6 12 24 99 198];

ahe_univ = [];
ahe_chang = [];
ahe_crowd = [];
ahe_portal = [];
ahe_bands = [];
ahe_snp = [];
ahe_walle = [];
if size(univ, 3)==3
univ = rgb2gray(univ);
end
if size(batman, 3)==3
batman = rgb2gray(batman);
end
if size(crowd, 3)==3
crowd = rgb2gray(crowd);
end
if size(sky, 3)==3
sky = rgb2gray(sky);
end
if size(walle, 3)==3
walle = rgb2gray(walle);
end
if size(bands, 3)==3
bands = rgb2gray(bands);
end
if size(saltnpepper, 3)==3
saltnpepper = rgb2gray(saltnpepper);
end
ctnt=0;
for ii=i
    ctnt=ctnt+1
    tic;
    ahe_univ = [ahe_univ; AHE( univ, 256, ii )];
    toc;
    tic;
    ahe_chang = [ahe_chang; AHE( batman, 256, ii )];
    toc;
    tic;
    ahe_crowd = [ahe_crowd; AHE( crowd, 256, ii )];
    toc;
    tic;
    ahe_portal = [ahe_portal; AHE( sky, 256, ii )];
    toc;
    tic;
    ahe_bands = [ahe_bands; AHE( bands, 256, ii )];
    toc;
    tic;
    ahe_snp = [ahe_snp; AHE( saltnpepper, 256, ii )];
    toc;
    tic;
    ahe_walle = [ahe_walle; AHE( walle, 256, ii )];
    toc;
end
%% Show adaptive equalization tests.

imshow(ahe_univ);
waitforbuttonpress;
imshow(ahe_chang);
waitforbuttonpress;
imshow(ahe_crowd);
waitforbuttonpress;
imshow(ahe_portal);
waitforbuttonpress;
imshow(ahe_bands);
waitforbuttonpress;
imshow(ahe_snp);
waitforbuttonpress;
imshow(ahe_walle);
waitforbuttonpress;

%% Save adaptive equalization tests.

imwrite(ahe_univ,   'images/ahe_univ.tif', 'tif');
imwrite(ahe_chang,  'images/ahe_chang.tif', 'tif');
imwrite(ahe_crowd,  'images/ahe_crowd.tif', 'tif');
imwrite(ahe_portal, 'images/ahe_portal.tif', 'tif');
imwrite(ahe_bands,  'images/ahe_bands.tif', 'tif');
imwrite(ahe_snp,    'images/ahe_snp.tif', 'tif');
imwrite(ahe_walle,   'images/ahe_walle.tif', 'tif');




%% CLAHE tests

clahe_univ = [];
clahe_chang = [];
clahe_crowd = [];
clahe_portal = [];
clahe_bands = [];
clahe_snp = [];
clahe_walle = [];

i=[99 198];
for ii=i
    for k=0.4:0.2:0.8
        tic;
        clahe_univ = [clahe_univ; CLAHE( univ, 256, k, ii )];
        toc
        tic;
        clahe_chang = [clahe_chang; CLAHE( batman, 256, k, ii )];
        toc
        tic;
        clahe_crowd = [clahe_crowd; CLAHE( crowd, 256, k, ii )];
        toc
        tic;
        clahe_portal = [clahe_portal; CLAHE( sky, 256, k, ii )];
        toc
        tic;
        clahe_bands = [clahe_bands; CLAHE( bands, 256, k, ii )];
        toc
        tic;
        clahe_snp = [clahe_snp; CLAHE( saltnpepper, 256, k, ii )];
        toc
        tic;
        clahe_walle = [clahe_walle; CLAHE( walle, 256, k, ii )];
        toc
    end
end

%% Show clahe tests.

imshow(clahe_univ);
waitforbuttonpress;
imshow(clahe_chang);
waitforbuttonpress;
imshow(clahe_crowd);
waitforbuttonpress;
imshow(clahe_portal);
waitforbuttonpress;
imshow(clahe_bands);
waitforbuttonpress;
imshow(clahe_snp);
waitforbuttonpress;
imshow(clahe_walle);
waitforbuttonpress;

%% Save clahe tests.

imwrite(clahe_univ,   'images/clahe_univ.jpg', 'jpg');
imwrite(clahe_chang,  'images/clahe_chang.jpg', 'jpg');
imwrite(clahe_crowd,  'images/clahe_crowd.jpg', 'jpg');
imwrite(clahe_portal, 'images/clahe_portal.jpg', 'jpg');
imwrite(clahe_bands,  'images/clahe_bands.jpg', 'jpg');
imwrite(clahe_snp,    'images/clahe_snp.jpg', 'jpg');
imwrite(clahe_walle,  'images/clahe_walle.jpg', 'jpg');


end


I = imread('a.jpg');
I_gray = rgb2gray(I);
[I_eq, I_eq_pdf] = histeq(I);
rH = 2; rL = 0.6; c = 0.5; D0 = 2;
I_homo = Homomorphicfilter(I, rH, rL, c, D0);
%imwrite(I_homo,'temp/test.jpg');
figure(1);

subplot(2,3,1);imshow(I_gray);title('Original grayscale image');
subplot(2,3,2);imshow(I_eq);title('ֱ�����⻯��ͼ��');
subplot(2,3,3);imshow(uint8(I_homo));title('̬ͬ�˲�ͼ��');
subplot(2,3,4);imhist(I_gray,32);title('ԭʼֱ��ͼ')
subplot(2,3,5);imhist(I_eq,32);title('���⻯ֱ��ͼ')
subplot(2,3,6);imhist(uint8(I_homo),32);title('̬ͬ�˲�ֱ��ͼ')
figure(2), imshow(I_eq);
figure(3), imshow(uint8(I_homo));
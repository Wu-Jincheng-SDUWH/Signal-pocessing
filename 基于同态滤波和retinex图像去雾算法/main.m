clc,close all,clear all;
img=imread('image.jpg');
rH = 2; rL = 0.1; c = 0.5; D0 = 3;
ImgOriginal = Homomorphicfilter(img, rH, rL, c, D0);
figure(1)
subplot(1,2,2),imshow(uint8(ImgOriginal));title('̬ͬ�˲���ǿ��'); 
[m,n,z] = size(ImgOriginal);  
ImgOut = zeros(m,n,z);  
nIterations=100;
for i = 1:z  
    ImChannel = log(double(ImgOriginal(:,:,i))+eps);  
    ImgOut(:,:,i)=retinex_frankle_mccann(ImChannel,nIterations);   
    ImgOut(:,:,i)=exp(ImgOut(:,:,i));  
    a=min(min(ImgOut(:,:,i)));  
    b=max(max(ImgOut(:,:,i)));  
    ImgOut(:,:,i)=((ImgOut(:,:,i)-a)/(b-a))*255;       
end  
ImgOut=uint8(ImgOut);  
figure(1);
subplot(2,3,1);imshow(img);title('��ԭʼ��ͼ��');
subplot(2,3,2);imshow(uint8(ImgOriginal));title('̬ͬ�˲����ͼ��');
subplot(2,3,3);imshow(ImgOut);title('retienx��ǿ��ͼ��');
subplot(2,3,4);imhist(img,32);title('ԭʼֱ��ͼ')
subplot(2,3,5);imhist(uint8(ImgOriginal),32);title('̬ͬ�˲�ֱ��ͼ')
subplot(2,3,6);imhist(ImgOut,32);title('����ֱ��ͼ')
figure(2);  
imshow(uint8(ImgOriginal));  
figure(3);  
imshow(ImgOut);
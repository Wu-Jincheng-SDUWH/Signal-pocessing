%%% 高斯高通滤波器的实现
function H = GaussianHighPassFilter(I, RH, RL, C, D0)
    if ndims(I) == 3
        I = rgb2gray(I);
    end
    [M, N] = size(I);%%获取图像大小

    % 记录图像的中点
    n1 = floor(M/2);
    n2 = floor(N/2);
    H = zeros(n1, n2);
    %计算高斯高通滤波器H（i，j）
for i=1:M    
    for j=1:N    
        D(i,j)=((i-n1).^2+(j-n2).^2);    
        H(i,j)=(RH-RL).*(exp(C*(-D(i,j)./(D0^2))))+RL;%高斯同态滤波    
    end    
end 
end
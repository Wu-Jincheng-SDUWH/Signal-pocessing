%%% ��˹��ͨ�˲�����ʵ��
function H = GaussianHighPassFilter(I, RH, RL, C, D0)
    if ndims(I) == 3
        I = rgb2gray(I);
    end
    [M, N] = size(I);%%��ȡͼ���С

    % ��¼ͼ����е�
    n1 = floor(M/2);
    n2 = floor(N/2);
    H = zeros(n1, n2);
    %�����˹��ͨ�˲���H��i��j��
for i=1:M    
    for j=1:N    
        D(i,j)=((i-n1).^2+(j-n2).^2);    
        H(i,j)=(RH-RL).*(exp(C*(-D(i,j)./(D0^2))))+RL;%��˹̬ͬ�˲�    
    end    
end 
end
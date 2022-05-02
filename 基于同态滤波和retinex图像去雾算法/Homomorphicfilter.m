%%%̬ͬ�˲�������
function I_homo = Homomorphicfilter(I, rH, rL, c, d0)
%%if ndims(I) == 3
    %%I = rgb2gray(I);%%��ȡͼ��
%%end
    % I=double(rgb2gray(I));
    I = double(I);  
    [M,N,channals]=size(I); 
    for ch=1:channals
    I1=log(I(:,:,ch)+1);%ȡ����    
    FI=dft(I1);%����Ҷ�任       
    H = GaussianHighPassFilter(I, rH, rL,c, d0); 
    I2=Idft(H.*FI);%����Ҷ��任    
    I_homo(:,:,ch)=real(exp(I2));
    end

    minV=min(min(min(I_homo)));
    maxV=max(max(max(I_homo)));
    for ch=1:channals
    for i=1:M   
            for j=1:N    
                I_homo(i,j,ch)=255* (I_homo(i,j,ch)-minV)./(maxV-minV);
            end
    end
    end
end
%%��ɢ����Ҷ������д
function F_ij = dft(f_ij)
    if ndims(f_ij) == 3
        f_ij = rgb2gray(f_ij);
    end
    % ���ｫ�����л�Ϊ˫����
    f_ij = double(f_ij);
    % �����ȡ��ͼ��Ĵ�С
    [nrows, ncols] = size(f_ij);

    % ��ʽFT��ʸ����ʵ��
    vy = (0:nrows-1)' * (0:nrows-1);
    M_vy = exp(-1i*2*pi*vy/nrows);
    F_xv = M_vy * f_ij;

    % ��ʽFT��ʸ����ʵ��
    ux = (0:ncols-1)' * (0:ncols-1);
    M_ux = exp(-1i*2*pi*ux/ncols);
    F_ij = F_xv * M_ux;
end
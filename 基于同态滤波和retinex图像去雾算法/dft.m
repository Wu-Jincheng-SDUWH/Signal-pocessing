%%离散傅里叶函数编写
function F_ij = dft(f_ij)
    if ndims(f_ij) == 3
        f_ij = rgb2gray(f_ij);
    end
    % 这里将整数切换为双精度
    f_ij = double(f_ij);
    % 这里获取了图像的大小
    [nrows, ncols] = size(f_ij);

    % 列式FT的矢量化实现
    vy = (0:nrows-1)' * (0:nrows-1);
    M_vy = exp(-1i*2*pi*vy/nrows);
    F_xv = M_vy * f_ij;

    % 行式FT的矢量化实现
    ux = (0:ncols-1)' * (0:ncols-1);
    M_ux = exp(-1i*2*pi*ux/ncols);
    F_ij = F_xv * M_ux;
end
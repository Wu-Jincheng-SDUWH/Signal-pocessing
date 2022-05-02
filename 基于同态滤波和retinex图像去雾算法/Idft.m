%%%¿Î…¢∏µ¿Ô“∂ƒÊ±‰ªª∫Ø ˝±‡–¥
function f_xy = Idft(F_ij)    
    if ndims(F_ij) == 3
        F_ij = rgb2gray(F_ij);
    end
    [nrows, ncols] = size(F_ij);
    vy = (0:nrows-1)' * (0:nrows-1);
    M_vy = exp(1i*2*pi*vy/nrows);
    f_uy = M_vy * F_ij;

    ux = (0:ncols-1)' * (0:ncols-1);
    M_ux = exp(1i*2*pi*ux/ncols);
    f_xy = real(f_uy * M_ux / (ncols*nrows));
end
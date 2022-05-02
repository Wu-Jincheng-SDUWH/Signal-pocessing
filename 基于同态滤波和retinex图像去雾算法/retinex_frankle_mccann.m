function Retinex = retinex_frankle_mccann(L, nIterations)
global  RR IP OP NP Maximum
RR = L;
Maximum = max(L(:));                        
[nrows, ncols] = size(L);

shift = 2^(fix(log2(min(nrows, ncols)))-1);     
OP = double(Maximum)*ones(nrows, ncols);              

while (abs(shift) >= 1)
   for i = 1:nIterations
      CompareWith(0, shift);                      
      CompareWith(shift, 0);                         
   end
   shift = -shift/2;                               
end
Retinex = NP;
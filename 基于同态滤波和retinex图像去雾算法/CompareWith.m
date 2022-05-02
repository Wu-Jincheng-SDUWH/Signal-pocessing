function CompareWith(row, col)
global RR IP OP NP Maximum
IP = OP;
if (row + col > 0)
   IP((row+1):end, (col+1):end) = double(OP(1:(end-row), 1:(end-col))) + ...
   double(RR((row+1):end, (col+1):end) )- double(RR(1:(end-row), 1:(end-col)));
else
   IP(1:(end+row), 1:(end+col)) = double(OP((1-row):end, (1-col):end)) + ...
   double(RR(1:(end+row),1:(end+col))) - double(RR((1-row):end, (1-col):end));
end
IP(IP > Maximum) = Maximum;               
NP = (IP + OP)/2;                                  
OP = NP;                                          
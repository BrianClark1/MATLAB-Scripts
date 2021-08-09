vf = 0.7 ;
Em = 3 ;
Fmt = 0.1 ;
Fh = 3.5 ;



i = 0;
ef = 5:5:200 '
fit = 2*45 + (3.15/ef) ;
f(i+1/1) = fit ;
E(i+1 , 1) = ef ;
i = i+1 ;

end
pbt(f,E_
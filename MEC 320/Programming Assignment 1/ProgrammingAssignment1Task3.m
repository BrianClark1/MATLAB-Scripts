%Brian Clark Task 3
%1.) Incremental Search
%2.) Bisection
%3.) Secant
% f(x) = ln(.09x)*cos(.2x)

f = @(x) log(.09*x)*cos(.2*x);

%Incremental Search

dx=10;
lower=0.01;
upper=50.01;
increments=(upper-lower)/dx;
totalf=0;

for i = 1:increments
    totalf=totalf+1;
   xl=dx*i;
   xu=xl+dx;

   fxl=f(xl);
   fxu=f(xu);

   if fxl*fxu<0
      %Search Increment w bisection
      es=.1;
      ea=1;
      while ea>es
          totalf=totalf+1;
          fxl=f(xl);
          fxu=f(xu);
          xr=(xl+xu)/2;
          fxr=f(xr);

          if fxr*fxl<0
              xu=xr;
          elseif fxr*fxl>0
                  xl=xr;
              else
                  xl=xl+.0001;
          end

          ea=abs((xl-xr)/(xu-xr));

      end
      %Secant Method
      es=.5*10^-4;
      ea=1;
      x0=xl;
      xi=xr;
      while ea>es
          totalf=totalf+1;
          xn1=x0;
          x0=xi;
          xi=x0-(f(x0)*(x0-xn1))/(f(x0)-f(xn1));
          ea=abs((xi-x0)/xi);

          if ea<es
              root=xr
          end
      end


   end

end
totalf
totalf =

    18

% This is the code for a task. Under the "Publish" tab, click "Publish" and
% copy the code in that format into your word document.

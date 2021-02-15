function AlmostNewtonCustom(x1,x2)
D=[1 0 ; 0 1];
k=0;
e=0.0000000215;
g=0.00001;
df=gradf(x1,x2);
while sqrt(df(1)^2+df(2)^2)>=e
    dk=-D*gradf(x1,x2);
    while transpose(df)*dk>=transpose(gradf(x1+g*dk(1),x2+g*dk(2)))*dk
        g=g*1.001;
    end
    p=[g*dk(1);g*dk(2)];
    q=gradf(x1+g*dk(1),x2+g*dk(2))-df;
    
    if abs((f(x1+g*dk(1),x2+g*dk(2))-f(x1,x2))/f(x1,x2))<0.001 && transpose(df)*dk<transpose(gradf(x1+2*g*dk(1),x2+2*g*dk(2)))*dk
        g=g*10;
    end
    
    x1=x1+g*dk(1);
    x2=x2+g*dk(2);
    t=transpose(q)*D*q;
    u=(p/(transpose(p)*q)) - ((D*q)/t);
    D=D + ((p*transpose(p))/(transpose(p)*q)) - ((D*q*transpose(q)*D)/(transpose(q)*D*q)) + t*u*transpose(u);
    eigenvalues=eig(D);
    if eigenvalues(1)<=0 || eigenvalues(2)<=0
        disp('Error');
    end
    df=gradf(x1,x2);
    g=0.00001;
    k=k+1;
end
x1
x2
k
end


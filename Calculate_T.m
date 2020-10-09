function T = Calculate_T(t)
syms theta1 theta2 d1 a2 d3 real
     alpha = [pi/2 pi/2 0];
   DH1 = [theta1   d1 0	alpha(1)];
   DH2 = [theta2	0	0	alpha(2)];
   DH3 = [0	a2+d3	0	alpha(3)];
if t == 3
    T = trotz(theta1)*transl(0,0,DH1(2))* transl(DH1(3),0,0)*trotx(DH1(4))* ...
            trotz(theta2)*transl(0,0,DH2(2))* transl(DH2(3),0,0)*trotx(DH2(4))* ...
            trotz(0)*transl(0,0,DH3(2))* transl(DH3(3),0,0)*trotx(DH3(4));
elseif t ==2
        T = trotz(theta1)*transl(0,0,DH1(2))* transl(DH1(3),0,0)*trotx(DH1(4))* ...
            trotz(theta2)*transl(0,0,DH2(2))* transl(DH2(3),0,0)*trotx(DH2(4));
elseif t ==1
        T = trotz(theta1)*transl(0,0,DH1(2))* transl(DH1(3),0,0)*trotx(DH1(4));
end 
T = simplify(T);
end
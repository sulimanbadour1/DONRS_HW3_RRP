function [Jacobian_classic,Jacobian_geom] = JacobMonachSym()
    % Classical Approach for Jacobian

      syms d1 theta1 theta2 d3 a2

        O1 = [0;
              0;
              d1];
 
     d01 = [diff(O1, theta1), diff(O1, theta2), diff(O1, d3)];
     
     O2 = [a2*cos(theta2)*cos(theta1);
          a2*cos(theta2)*sin(theta1);
          d1+a2*sin(theta2)];
 
     d02 = [diff(O2, theta1), diff(O2, theta2), diff(O2, d3)];


T = Calculate_T(3); % function for calculating homo. matrix T30.
    O30 = T(1:3,4); % It's coordinates of the tool (O3)
    dO30 = [diff(O30, theta1), diff(O30, theta2), diff(O30, d3)] ;  % Get Jacobian
    Jacobian_classic = dO30;
    % Geometrical Approach for Jacobian

    k = [0
        0
        1];

    T10 = Calculate_T(1);
    R10 = T10(1:3,1:3);
    O10 = T10(1:3,4);
    T20 = Calculate_T(2);
    R20 = T20(1:3,1:3);
    O20 = T20(1:3,4);
    Jacobian = [cross(k, O30), cross(R10*k, O30-O10), R20*k
                k, R10*k, 0*k];
    Jacobian_geom = simplify(Jacobian);
end


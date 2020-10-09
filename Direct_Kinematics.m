function T_solved = Direct_Kinematics(q0)
   %Using DH parameters
   %L = Link ([Th d a alpha])
   %Th - the angle about the prev z to aligh its x to the new x
   %d - the depth along the previous joint's z axis to the common normal
   %a - is the distance along the rotated x axis (radius of rotation about
   %previous z axis)
   %alpha - angle of rotation about the new x axis to put previous z in its
   %desired orientation
   %if z and z next are parallel then a = 0. d is various
   %Configuration, DH-parameters
   d1 = 5; a2 = 7;  d3 = 10;
   q = [q0(1) q0(2)+pi/2 q0(3)]; %Set rotations;
   alpha = [pi/2 pi/2 0];
   DH1 = [q(1)   d1 0	alpha(1)];
   DH2 = [q(2)	0	0	alpha(2)];
   DH3 = [0	a2+d3	0	alpha(3)];
   clear L;

  %Plotting
   figure(1);
   R_base = rotz(0);
   trplot(R_base,'color','black')
   L(1) = Link('revolute',DH1);
   L(2) = Link('revolute',DH2);
   L(3) = Link('prismatic',DH3);
   R = SerialLink(L, 'name', 'Robot');
   R.plot(q, 'jaxes')
   %Exam the Forward Kinematics solution
   T_validate = R.fkine(q);
   %To use my own solver for FK at first we should convert rad to deg
%    Jacobian = R.jacobn(q);
   T_solved = FK(q, alpha, DH1, DH2, DH3);

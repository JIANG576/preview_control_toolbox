function Psim=GetPSim(P)

error('this function does not work')
[A,B,C,D,Ts]=ssdata(P);
[n_1,p,q,l,m]=Getsz(Set_k(P,1));
[lw,lr]=Getlwlr(P);

% Asim=A(1:n_1-lr,1:n_1-lr);
% Bsim=B(1:n_1-lr,:);
% Csim=C(:,1:n_1-lr);
% Psim=GenSys(ss(Asim,Bsim,Csim,D,P.GenSys.Ts),q,m);
C(1:p,n_1-lr+1:n_1)=zeros(p,lr); % disconnect preview states from output
A(1:n_1-lr,n_1-lr+1:end)=zeros(n_1-lr,P.k*lr); % disconnect preview states from other states
...this approach does not leave Wz with correct state (for when using state feedback)

Psim=GenSys(ss(A,B,C,D,Ts),q,m);
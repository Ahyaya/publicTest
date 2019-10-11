## Copyright (C) 2019 Chan
##
## Python package SymPy is supposed to be installed.
## Octave package symbolic should be activated by tpying "pkg load symbolic".
##
## Presettings in Line 11 and Line 12 are neccesary.

syms M
syms t r th fi

g=diag([-(1-2*M/r),1/(1-2*M/r),r*r,r*r*sin(th)*sin(th)]);
x=[t,r,th,fi];

index_max=length(x);up_g=g^-1;gamma=sym('0');
printf("\n====================================================\n");
for rho=1:index_max
	mu=0;
	while(index_max-mu)
		nu=mu++;
		while(index_max-nu)
			nu++;
			sig=0;
			while(index_max-sig)
				sig++;
				gamma+=sym('1/2')*up_g(rho,sig)*(diff(g(sig,nu),x(mu))+diff(g(mu,sig),x(nu))-diff(g(mu,nu),x(sig)));
			end
			sig=0;
			if(gamma!=sym('0'))
				if(mu-nu)
					printf("\033[1;31;40m Γ^%d_%d%d = Γ^%d_%d%d \033[0m\n\n",rho-1,mu-1,nu-1,rho-1,nu-1,mu-1);
				else
					printf("\033[1;31;40m Γ^%d_%d%d \033[0m\n\n",rho-1,mu-1,nu-1);
				endif
				disp(gamma);
				printf("====================================================\n");
				gamma=sym('0');
			endif
		end
	end
	mu=0;
end


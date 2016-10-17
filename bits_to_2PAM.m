function [Xk]= bits_to_2PAM(bits,N)

for k=[0:N]
	if bits(N)==0
		Xk(N)=+1
	end
	if bits(N)==1
		Xk(N)=-1
	end
end 

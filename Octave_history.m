fit=[];
for pf=1:148
D=importdata(path(pf).name);
D=D(50:end-15,:);
M=D(:,2);R=D(:,3);k2=D(:,4);I=D(:,7);
m=M.*4.9167e-6;
r=R./3e5;
I=I.*m.*r.*r;
y=I./(m.^3);x=m./r;
fit=[fit;x,y];
end

D=importdata(path(50).name);
D=D(10:end-3,:);
M=D(:,2);R=D(:,3);k2=D(:,4);I=D(:,7);
m=M.*4.9167e-6;
r=R./3e5;
I=I.*m.*r.*r;
y=I./(m.^3);x=2/3*k2.*(r.^5)./(m.^5);
l1=plot(x,y,'b-','LineWidth',2);

xlabel('\bf \Lambda','FontSize',18);ylabel('\bf I/M^3','FontSize',18);
set(gca,'Box','on','xminortick','on','yminortick','on','TickDir','in','TickLength',[.02 0]);set(gca,'Xscale','log','LineWidth',3,'fontsize',18,'fontweight','bold');
axis([1 3e5 0 100]);
d1=plot(x(50),y(50),'ko');
Le1=legend([d1 l1],{'ANM EoS','universal relation'},'location','northwest');
legend('boxoff');

Z=importdata('RMpdf_prior');
x=(9:0.05:13.5);y=(1:0.02:2);[X,Y]=meshgrid(x,y);
contour(X,Y,Z,[200 200]),sum(Z(find(Z(:)<200)))/sum(Z(:))
Z=Z-200;Z(find(Z(:)<=0))=0;

pri   [300 300], [1285 1285]

pos [550 550], [1640 1640]

Z(51,55)
for a=1:51
for b=5:51
if (Z(a,b)>sum(Z(a,b-4:b+4))/7.67)
Z(a,b)=(sum(Z(a,b-4:b+4))-Z(a,b))/8;
else if (Z(a,b)<sum(Z(a,b-4:b+4))/11)
Z(a,b)=(sum(Z(a,b-4:b+4))-Z(a,b))/8;
end
end
end
end



for pf=1:length(PDFq)
pc1(pf)=sum(PDFq(1:pf,2));
end
u1=rand(2500,1);
for pf=1:length(pc1)
temp=find(u1(:)<pc1(pf));
q(temp)=(PDFq(pf,1)-0.5*(PDFq(2,1)-PDFq(1,1)))+(PDFq(2,1)-PDFq(1,1))*rand(length(temp),1);
u1(temp)=9999999;
end

m1=1.186.*((1+q).^0.2)./(q.^0.6);m2=m1.*q;


ComLambda=16/13*((m1+12*m2).*(m1.^4).*L1+(m2+12*m1).*(m2.^4).*L2)./((m1+m2).^5);



D=importdata('GW170817det');
m1det=D(:,1);
m2det=D(:,2);
L1=D(:,3);
L2=D(:,4);
z=0.0099;
m1=m1det/(1+z);
m2=m2det/(1+z);
ComLambda=16/13*((m1+12*m2).*(m1.^4).*L1+(m2+12*m1).*(m2.^4).*L2)./((m1+m2).^5);


>> m1=sum(D(:,1))/1.0099/3952
m1 =  1.4858
>> m2=sum(D(:,2))/1.0099/3952
m2 =  1.2548
>> L1=sum(D(:,3))/3952
L1 =  341.04
>> L2=sum(D(:,4))/3952
L2 =  553.30

L1=110;
L2=260;

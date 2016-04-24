close all;
clear all;
clc;

X = [10*randn(400,2); 10*randn(400,2)];
plot (X(: ,1) ,X(: ,2) , 'k.');

figure;

[ cidx , ctrs ] = kmeans(X, 7 , 'dist' , 'sqEuclidean' , 'rep' ,5 , 'disp' ,'final' , 'EmptyAction' , 'singleton' );

plot (ctrs(:,1) ,ctrs (:,2), 'kx', ... 
X(cidx==1,1), X( cidx==1 ,2), 'r.', X(cidx==2,1), X(cidx==2,2), 'b.');
hold on
plot (X(cidx==3,1) ,X(cidx==3,2), 'y.', X(cidx ==4,1), X(cidx==4,2), 'g.');
hold on
plot (X(cidx==5,1) ,X(cidx==5,2), 'c.', X(cidx ==6,1), X(cidx==6,2), 'm.');
hold on
plot (X(cidx==7,1) ,X(cidx==7,2), 'k.');

figure;
[silk ,h]= silhouette (X, cidx , 'sqEuclidean') ;
mean( silk );
close all; clear; clc;

% #######################################################################
%
% YILDIZ TECHNICAL UNIVERSITY
% Faculty of Electrical & Electronics Engineering
% Control and Automation Engineering Department
% 
% -----------------------------------------------------------------------
%
% Yiğit ARPACIOĞLU
% 18567037
% yigit.arpacioglu@gmail.com
% 
% #######################################################################


%% Section 1: Data Import, Normalization and Visualization of Comparing Normal Data and Normalized Data

data=load('X4.mat'); % Data set into workspace

X=struct2array(data);

Xnorm=prep(X);

[m,n]=size(X);


figure;

grid on

subplot(1,2,1), 
plot(X(:,1),X(:,2),'go'), 
title('Data Distribution'), 
xlabel('1st Feature'), 
ylabel('2nd Feature'),

subplot(1,2,2),
plot(Xnorm(:,1),Xnorm(:,2),'bo'), 
title('Normalized Data Distribution'),
xlabel('1st Feature'), 
ylabel('2nd Feature'),



%% Section 2: Initializing Centroids

% Defining K value for K-means Algorithm 

k=input('Please enter k-value for clustering algorithm\n');

a=mean(min(Xnorm));b=mean(max(Xnorm));
centroids=(b-a)*rand(k,n)+a;

figure;
plot(Xnorm(:,1),Xnorm(:,2),'bo'), 
title('Center Points'),
xlabel('1st Axis of Centers'), 
ylabel('2nd Axis of Centers'),

hold on
plot(centroids(:,1),centroids(:,2),'ko','LineWidth',5,'MarkerSize',8)
legend('Data Points','center points')
hold off
iter=0;
maxiter=400;

% E=1;

while  iter<maxiter  %e E>0
%% Section 3: Program Situation
if iter==maxiter
    fprintf('Program has reached %d iterations and it is the maximum iteration number that defined by coder',maxiter);
    
    break
end
iter=iter+1;

%% Section 4: Distance Matrix

Xdis=zeros(m,k); % Pre-allocating

for i=1:k
Xdis(:,i)=euc(Xnorm,centroids(i,:)); % Euclidean Distance Calculation with user defined function
end


%% Section 5: Calculating Minimum Distances


[~,cmp]=min(transpose(Xdis));       % Getting minimum indice info from distance matrix
cmp=cmp';                           % Since array is 1xm converting back to mx1
                                    % Clustered into classes

%% Section 6: Updating Centroids

% prev_centroids=centroids;  % centroids will be kept

for i=1:k
     centroids(i,:)=mean(Xnorm(cmp==i,:));    % Centroid update      
end


%% Section 7: Viusalizing Output
if mod(iter,100)==0 || iter==1 || iter==10 || iter==50 
figure;
hold on

plot(Xnorm(cmp==1,1),Xnorm(cmp==1,2),'ro')
plot(Xnorm(cmp==2,1),Xnorm(cmp==2,2),'bo')
plot(Xnorm(cmp==3,1),Xnorm(cmp==3,2),'go')
plot(Xnorm(cmp==4,1),Xnorm(cmp==4,2),'yo')
plot(Xnorm(cmp==5,1),Xnorm(cmp==5,2),'mo')

plot(centroids(:,1),centroids(:,2),'ko','LineWidth',5,'MarkerSize',8)
title(['Clustered Data Step: ',num2str(iter)]);
hold off

end


%% Extra: Calculating mean squared error between old and new centroids

% E=mean(sqrt(sum(power((centroids-prev_centroids),2))));
fprintf('K-Means iteration %d/...\n', iter);

% if E==0
%     figure;
% hold on
% plot(Xnorm(cmp==1,1),Xnorm(cmp==1,2),'ro')
% plot(Xnorm(cmp==2,1),Xnorm(cmp==2,2),'bo')
% plot(Xnorm(cmp==3,1),Xnorm(cmp==3,2),'go')
% plot(Xnorm(cmp==4,1),Xnorm(cmp==4,2),'yo')
% plot(Xnorm(cmp==5,1),Xnorm(cmp==5,2),'mo')
% plot(centroids(:,1),centroids(:,2),'ko','LineWidth',5,'MarkerSize',8)
% title(['Clustered Data Step: ',num2str(iter)]);
% hold off
% end
end

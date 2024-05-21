% SCA.m
%
% Copyright (C) 2024 Khaled Mahfouz, Sharaz Ali and Mohamed Al-Betar
%
% This program is free software: you can redistribute it and/or modify it under
% the terms of the GNU General Public License as published by the Free Software
% Foundation, either version 3 of the License, or (at your option) any later
% version.
%
% This program is distributed in the hope that it will be useful, but WITHOUT
% ANY WARRANTY; without even the implied warranty of  MERCHANTABILITY or FITNESS
% FOR A PARTICULAR PURPOSE. See the GNU General Public License for more details.
%
% You should have received a copy of the GNU General Public License along with
% this program.  If not, see <http://www.gnu.org/licenses/>.

%-----------------------------------------------------------------------------------------------
% The Sine Cosine Algorithm (SCA) was originally designed by Seyedali Mirjalili:                    
% S. Mirjalili, SCA: A Sine Cosine Algorithm for solving optimization problems
% Knowledge-Based Systems, DOI: http://dx.doi.org/10.1016/j.knosys.2015.12.022
%-----------------------------------------------------------------------------------------------


function [Destination_fitness,Destination_position,Destination_bin,Convergence_curve]=SCA(N,Max_iteration,lb,ub,dim,fobj,no_items,capacity,weights,profit)

display('SCA is optimizing your problem');

UPB=bi2de(ones(1,no_items));
LOWB=bi2de(zeros(1,no_items));

%Initialize the set of random solutions
[X_BIN,X]=initialization(N,dim,ub,lb,no_items,UPB,LOWB);

Destination_position=zeros(1,dim);
Destination_fitness=0;

Convergence_curve=zeros(1,Max_iteration);
Objective_values = zeros(1,size(X,1));
All_objective_values = zeros(1,size(X,1));

tic
% Calculate the fitness of the first set and find the best one
for i=1:size(X,1)
    Objective_values(1,i)=fobj(X_BIN(i,:),capacity,weights,profit);
    if Objective_values(1,i) == 2440 %Dont forget to change optimum
            toc
            t=1
    end
    if i==1
        Destination_position = X(i,:);
        Destination_bin = X_BIN(i,:);
        Destination_fitness=Objective_values(1,i);
    elseif Objective_values(1,i)>Destination_fitness
        Destination_position=X(i,:);
        Destination_bin = X_BIN(i,:);
        Destination_fitness=Objective_values(1,i);
    end
    
    All_objective_values(1,i)=Objective_values(1,i);
end

%Main loop
t=2; % start from the second iteration since the first iteration was dedicated to calculating the fitness
while t<=Max_iteration
    
    % Eq. (3.4)
    a = 2;
    Max_iteration = Max_iteration;
    r1=a-t*((a)/Max_iteration); % r1 decreases linearly from a to 0
    
    % Update the position of solutions with respect to destination
    for i=1:size(X,1) % in i-th solution
        for j=1:size(X,2) % in j-th dimension
            
            % Update r2, r3, and r4 for Eq. (3.3)
            r2=(2*pi)*rand();
            r3=2*rand;
            r4=rand();
            
            % Eq. (3.3)
            if r4<0.5
                % Eq. (3.1)
                X(i,j)= X(i,j)+(r1*sin(r2)*abs(r3*Destination_position(j)-X(i,j)));
                %TEST = abs(round(((X(i,j) - lb)*(UPB-LOWB))/(ub-lb)));
                %X_BIN(i,:) = de2bi(TEST,no_items);
            else
                % Eq. (3.2)
                X(i,j)= X(i,j)+(r1*cos(r2)*abs(r3*Destination_position(j)-X(i,j)));
                %TEST = abs(round(((X(i,j) - lb)*(UPB-LOWB))/(ub-lb)));
                %X_BIN(i,:) = de2bi(TEST,no_items);
            end
            
        end
    end
    
    for i=1:size(X,1)
         
        % Check if solutions go outside the search spaceand bring them back
        Flag4ub=X(i,:)>ub;
        Flag4lb=X(i,:)<lb;
        X(i,:)=(X(i,:).*(~(Flag4ub+Flag4lb)))+ub.*Flag4ub+lb.*Flag4lb;
        TEST = abs(round(((X(i,:) - lb)*(UPB-LOWB))/(ub-lb)));
        %TEST = abs(round(((X(i,:) - lb)*(1.2676506e+30))/(ub-lb)));
        X_BIN(i,:) = de2bi(TEST,no_items);

        % Calculate the objective values
        Objective_values(1,i)=fobj(X_BIN(i,:),capacity,weights,profit);
        if Objective_values(1,i) == 2440 %Dont forget to change optimum
            toc
            t
        end
        % Update the destination if there is a better solution
        if Objective_values(1,i)>Destination_fitness
            Destination_position=X(i,:);
            Destination_bin = X_BIN(i,:);
            Destination_fitness=Objective_values(1,i);
        end
        
         All_objective_values(1,i)=Objective_values(1,i); 
    end
    
    Convergence_curve(t)=Destination_fitness;
    
    % Display the iteration and best optimum obtained so far
    if mod(t,50)==0
        display(['At iteration ', num2str(t), ' the optimum is ', num2str(Destination_fitness)]);
    end
    
    % For GUI
    %{
    if t>2
        line([t-1 t], [Convergence_curve(t-1) Convergence_curve(t)],'Color','r')
        xlabel('Iteration');
        ylabel('Best score obtained so far');
        drawnow
    end
    
    
    set(handles.itertext,'String', ['The current iteration is ', num2str(t)])
    set(handles.optimumtext,'String', ['The current optimal value is ', num2str(Destination_fitness)])
    if value==1
        hold on
        scatter(t*ones(1,N),All_objective_values,'.','k')
    end
    %}
    
    % Increase the iteration counter
    t=t+1; 
    
end

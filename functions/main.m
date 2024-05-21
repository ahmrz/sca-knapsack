% main.m
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


% fobj = @YourCostFunction
% dim = number of your variables
% Max_iteration = maximum number of iterations
% SearchAgents_no = number of search agents
% lb=[lb1,lb2,...,lbn] where lbn is the lower bound of variable n
% ub=[ub1,ub2,...,ubn] where ubn is the upper bound of variable n
% If all the variables have equal lower bound you can just
% define lb and ub as two single numbers 

clear 
close all 
clc

[lb,ub,dim,fobj] = Get_Functions_details('F23');

Max_iteration = 5000;
SearchAgents_no = 30;

for run=1:30
    
[Best_score,Best_pos,cg_curve]=SCA(SearchAgents_no,Max_iteration,lb,ub,dim,fobj);
Best_score_run(run) = Best_score;

end
disp('Resulting objective values')
Best_score_run

disp('Average objective value')
mean(Best_score_run)

disp('Standard Deviation of resulting objective values')
std(Best_score_run)

%disp('Best solution found')
%Best_pos
%disp('Best objective value')
%Best_score


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

clear 
close all 
clc


[no_items,fobj,capacity,weights,profit] = Get_Knapsack_details('L15');

Max_iteration = 1000;
SearchAgents_no = 20;
lb = -50;
ub = 50;
dim = 1;

Best_score_run = zeros(1,30);
Best_bin_run = zeros(30,no_items);

for run=1:30
[Best_score,Best_pos,Best_bin,cg_curve]=SCA(SearchAgents_no,Max_iteration,lb,ub,dim,fobj,no_items,capacity,weights,profit);
Best_score_run(run) = Best_score;
Best_bin_run(run,:) = Best_bin;
end

disp('Resulting objective values found')
Best_score_run

disp('Average of resulting objective values')
mean(Best_score_run)

disp('Standard Deviation of resulting objective values')
std(Best_score_run)

disp('Minimum of resulting objective values')
min(Best_score_run)

disp('Maximum of resulting objective values')
max(Best_score_run)

disp('SR')
sum(Best_score_run(:) == 2440) %Dont forget to change optimum

%disp('Best solution found')
%Best_pos
%disp('Best knapsack solution found')
%Best_bin
%disp('Best objective value')
%Best_score


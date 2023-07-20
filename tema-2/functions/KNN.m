%% Copyright (C) 2021 Andrei
%% Copyright (C) 2023 Alexandru Sima
%%
%% This program is free software: you can redistribute it and/or modify
%% it under the terms of the GNU General Public License as published by
%% the Free Software Foundation, either version 3 of the License, or
%% (at your option) any later version.
%%
%% This program is distributed in the hope that it will be useful,
%% but WITHOUT ANY WARRANTY; without even the implied warranty of
%% MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
%% GNU General Public License for more details.
%%
%% You should have received a copy of the GNU General Public License
%% along with this program.  If not, see <https://www.gnu.org/licenses/>.

%% -*- texinfo -*-
%% @deftypefn {} {@var{prediction} =} KNN (@var{label}, @var{Y}, @var{test}, @
%%  @var{k})
%%
%% Calculeaza distantele de la @var{Y} la @var{test} si alege distanta mediana a
%% celor @var{k} cele mai apropiate imagini.
%%
%% @seealso{}
%% @end deftypefn

%% Author: Andrei <Andrei@DESKTOP-PK505U9>
%% Created: 2021-08-09

function [prediction] = KNN (labels, Y, test, k)
  % Pentru fiecare rand calculeaza distanta Euclidiana dintre acesta si
  % vectorul de test primit ca argument.
  distance = sqrt (dot (Y - test, Y - test, 2));

  %% Ordoneaza crescator distantele si tine minte intr-un vector primele
  %% k valori care reprezinta valorile adevarate ale acestor imagini care s-au
  %% dovedit a fi cele mai apropiate.
  [_, indexes] = sort (distance);
  indexes = indexes(1:k);
  labels = labels(indexes);

  % Calculeaza predictia ca mediana celor k valori cele mai apropiate.
  prediction = median (labels);
endfunction

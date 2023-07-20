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
%% @deftypefn {} {@var{train}, @var{miu}, @var{Y}, @var{Vk} =} magic_with_pca @
%%  (@var{train_mat}, @var{pcs})
%%
%% Calculeaza matricea @var{train}, aproximand matricea de covarianta a
%% @var{train_mat}.
%%
%% @seealso{}
%% @end deftypefn

%% Author: Andrei <Andrei@DESKTOP-PK505U9>
%% Created: 2021-09-08

function [train, miu, Y, Vk] = magic_with_pca (train_mat, pcs)
  [m, n] = size (train_mat);

  % Cast train_mat la double.
  train_mat = cast (train_mat, "double");

  % Calculeaza media fiecarei coloane a matricii.
  miu = sum (train_mat, 1) / m;

  % Scade media din matricea initiala.
  train_mat -= miu;

  % Calculeaza matricea de covarianta.
  Z = (train_mat' * train_mat) / (m - 1);

  % Calculeaza vectorii si valorile proprii ale matricei de covarianta.
  [V, S] = eig (Z);

  %% Ordoneaza descrescator valorile proprii si creaza o matrice V
  %% formata din vectorii proprii asezati pe coloane, astfel incat prima coloana
  %% sa fie vectorul propriu corespunzator celei mai mari valori proprii si
  %% asa mai departe.

  % Retine valorile proprii ca un vector linie.
  lambdas = ones (1, size (S, 1)) * S;

  % Sorteaza descrescator valorile proprii retinand indecsii originali.
  [_, indexes] = sort (lambdas, "descend");

  % Ordoneaza vectorii proprii dupa indecsii valorilor proprii asociate.
  V = V(:, indexes);

  % Pastreaza doar primele pcs coloane din matricea obtinuta anterior.
  Vk = V(:, 1:pcs);

  % Creaza matricea Y schimband baza matricii initiale.
  Y = train_mat * Vk;

  % Calculeaza matricea train care este o aproximatie a matricii initiale
  % folosindu-va de matricea Vk calculata anterior
  train = Y * Vk';
endfunction

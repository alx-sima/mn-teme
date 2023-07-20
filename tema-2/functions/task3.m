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
%% @deftypefn {} {@var{new_X} =} task3 (@var{photo}, @var{pcs})
%%
%% Realizeaza compresia imaginii @var{photo}, folosind vectorii proprii asociati
%% celor mai mari @var{k} valori principale ale matricei de covarianta.
%%
%% @seealso{}
%% @end deftypefn

%% Author: Andrei <Andrei@DESKTOP-PK505U9>
%% Created: 2021-09-06

function new_X = task3 (photo, pcs)
  [m, n] = size (photo);

  % Cast photo la double.
  photo = cast (photo, "double");

  % Calculeaza media fiecarui rand al matricii.
  miu = sum (photo, 2) / n;

  % Normalizeaza matricea initiala scazand din ea media fiecarui rand.
  photo -= miu;

  % Calculeaza matricea de covarianta.
  Z = (photo * photo') / (n - 1);

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


  % Pastreaza doar primele pcs coloane
  % OBS: primele coloane din V reprezinta componentele principale si
  % pastrandu-le doar pe cele mai importante obtinem astfel o compresie buna
  % a datelor. Cu cat crestem numarul de componente principale claritatea
  % imaginii creste, dar de la un numar incolo diferenta nu poate fi sesizata
  % de ochiul uman asa ca pot fi eliminate.
  W = V(:, 1:pcs);

  % Creaza matricea Y schimband baza matricii initiale.
  Y = W' * photo;

  % Calculeaza matricea new_X care este o aproximatie a matricii initiale
  new_X = W * Y;

  % Aduna media randurilor scazuta anterior.
  new_X += miu;

  % Transforma matricea in uint8 pentru a fi o imagine valida.
  new_X = cast (new_X, "uint8");
endfunction

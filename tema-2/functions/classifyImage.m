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
%% @deftypefn {} {@var{prediction} =} classifyImage (@var{im}, @var{train_mat},@
%%  @var{pcs})
%%
%% Aplica `magic_with_pca` pe datele de antrenament, apoi clasifica imaginea
%% @var{im}, aplicand `KNN` pe aceasta.
%%
%% @seealso{}
%% @end deftypefn

%% Author: Andrei <Andrei@DESKTOP-PK505U9>
%% Created: 2021-09-08

function prediction = classifyImage (im, train_mat, train_val, pcs)
  % Cast im la double.
  im = cast (im, "double");

  % Aplica functia magic_with_pca setului de date de antrenament.
  [train, miu, Y, Vk] = magic_with_pca (train_mat, pcs);

  % Scade din vectorul imagine media fiecarei coloane din train_mat.
  im = im' - miu;

  % Schimba baza inmultind cu matricea Vk.
  Y = Y * Vk';

  % Calculeaza predictia folosindu-se de metoda k nearest neighbour
  % implementata anterior cu k = 5.
  prediction = KNN (train_val, Y, im, 5);
endfunction

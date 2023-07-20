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
%% @deftypefn {} {@var{new_X} =} task1 (@var{photo}, @var{k})
%%
%% Realizeaza compresia imaginii @var{photo}, retinand primele
%% @var{k} valori singulare.
%%
%% @seealso{}
%% @end deftypefn

%% Author: Andrei <Andrei@DESKTOP-PK505U9>
%% Created: 2021-09-14

function new_X = task1 (photo, k)
  [m, n] = size (photo);

  % Cast photo la double.
  photo = cast (photo, "double");

  % Aplica algoritmul SVD asupra photo.
  [U, S, V] = svd (photo);

  % calculeaza noile matrici reduse U, S si V.
  U = U(1:m, 1:k);
  S = S(1:k, 1:k);
  V = V(1:n, 1:k);

  % Calculeaza new_X care este aproximarea matricii initiale photo,
  % folosindu-va de matricile calculate anterior.
  new_X = U * S * V';

  % Transforma matricea in uint8 pentru a fi o imagine valida.
  new_X = cast (new_X, "uint8");
endfunction

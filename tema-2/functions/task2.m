%% Copyright (C) 2023 Andrei
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
%% @deftypefn {} {@var{new_X} =} task2 (@var{photo}, @var{pcs})
%%
%% Realizeaza compresia imaginii @var{photo}, retinandu-se primele @var{pcs}
%% componente principale.
%%
%% @seealso{}
%% @end deftypefn

%% Author: Andrei <Andrei@DESKTOP-PK505U9>
%% Created: 2023-02-28

function new_X = task2 (photo, pcs)
  [m n] = size(photo);

  % Cast photo la double.
  photo = cast (photo, "double");

  % Normalizeaza matricea initiala scazand din ea media fiecarui rand.
  miu = sum (photo, 2) / n;
  photo -= miu;

  % Construieste matricea Z.
  Z = photo' / sqrt (n - 1);

  % Calculeaza matricile U, S si V din SVD aplicat matricii Z
  [_, _, V] = svd (Z);

  % Construieste matricea W din primele pcs coloane ale lui V
  W = V(:, 1:pcs);

  % Calculeaza matricea Y
  Y = W' * photo;

  % Aproximeaza matricea initiala
  photo = W * Y + miu;

  % Transforma matricea in uint8 pentru a fi o imagine valida.
  new_X = cast (photo, "uint8");
endfunction

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
%% @deftypefn {} {@var{sir} =} prepare_photo (@var{im})
%%
%% Pregateste imaginea pentru clasificare, inversandu-i valorile pixelilor si
%% transformand-o intr-un vector linie.
%%
%% @seealso{}
%% @end deftypefn

%% Author: Andrei <Andrei@DESKTOP-PK505U9>
%% Created: 2021-09-08

function sir = prepare_photo (im)
  % Inverseaza pixelii imaginii im.
  im = 255 - im;

  % Transpune imaginea, iar apoi transforma imaginea intr-un vector linie.
  sir = reshape (im', [], 1);
endfunction

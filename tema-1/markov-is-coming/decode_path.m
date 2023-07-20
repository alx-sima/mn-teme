%% Copyright (C) 2023 Sima Alexandru (312CA)

%% -*- texinfo -*-
%% @deftypefn {} {@var{decoded_path} =} decode_path (@var{path}, @var{lines}, @
%%  @var{cols})
%%
%% Construieste un vector @var{decoded_path} care contine pozitiile (i, j)
%% patratelelor pe care se merge spre iesire. @var{path} contine pozitiile in
%% forma plana ("al catelea patratel din tabla este"), deci trebuie decodificati
%% (i, j), stiind dimensiunile tablei, @var{lines} si @var{cols}.
%%
%% @seealso{}
%% @end deftypefn

function [decoded_path] = decode_path (path, lines, cols)
  path_len = length (path) - 1;
  decoded_path = zeros (path_len, 2);

  for i = 1:path_len
    line = floor ((path(i) - 1) / cols) + 1;
    col = mod (path(i), cols);

    if col == 0
      col = cols;
    endif

    decoded_path(i, :) = [line col];
  endfor

endfunction

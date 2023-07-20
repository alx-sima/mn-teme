%% Copyright (C) 2023 Sima Alexandru (312CA)

%% -*- texinfo -*-
%% @deftypefn {} {@var{X}, @var{y} =} load_dataset (@var{path})
%%
%% Citeste din fisierul @var{path} (avand formatul ".mat") variabilele @var{X}
%% si @var{y}.
%%
%% @seealso{}
%% @end deftypefn

function [X, y] = load_dataset (path)
  load (path, "X", "y");
endfunction

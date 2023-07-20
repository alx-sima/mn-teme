%% Copyright (C) 2023 Sima Alexandru (312CA)

%% -*- texinfo -*-
%% @deftypefn {} {@var{Labyrinth} =} parse_labyrinth (@var{file_path})
%%
%% Citeste din fisierul @var{file_path} labirintul @var{Labyrinth}.
%%
%% @seealso{}
%% @end deftypefn

function [Labyrinth] = parse_labyrinth (file_path)
  fdes = fopen (file_path);

  if fdes == -1
    error ("Unable to open file");
  endif

  [m, n] = fscanf (fdes, "%d%d", "C");
  Labyrinth = fscanf (fdes, "%d", [n, m])';

  fclose (fdes);
endfunction

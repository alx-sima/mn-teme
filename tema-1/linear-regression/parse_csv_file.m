%% Copyright (C) 2023 Sima Alexandru (312CA)

%% -*- texinfo -*-
%% @deftypefn {} {@var{Y}, @var{InitialMatrix} =} parse_csv_file ( @
%%  @var{file_path})
%%
%% Citeste fisierul csv @var{file_path} si initializeaza @var{Y} si
%% @var{InitialMatrix}.
%%
%% @seealso{parse_data_set_file}
%% @end deftypefn

function [Y, InitialMatrix] = parse_csv_file (file_path)
  fdes = fopen (file_path);

  if fdes == -1
    error ("Unable to open file");
  endif

  csv_data = textscan (fdes, "%q", "delimiter", ",", "headerlines", 1){1, 1};
  csv_data = reshape (csv_data, 13, [])'; % Transforma datele intr-o matrice cu
                                          % 13 coloane.

  Y = str2double (csv_data(:, 1));
  InitialMatrix = csv_data(:, 2:end);

  fclose (fdes);
endfunction

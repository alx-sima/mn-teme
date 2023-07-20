%% Copyright (C) 2023 Sima Alexandru (312CA)

%% -*- texinfo -*-
%% @deftypefn {} {@var{Y}, @var{InitialMatrix} =} parse_data_set_file ( @
%%  @var{file_path})
%%
%% Citeste din fisierul @var{file_path} dimensiunile matricei
%% @var{InitialMatrix}, apoi datele acesteia si ale vectorului de iesiri
%% @var{Y}.
%%
%% @seealso{parse_csv_file}
%% @end deftypefn

function [Y, InitialMatrix] = parse_data_set_file (file_path)
  fdes = fopen (file_path);

  if fdes == -1
    error ("Unable to open file");
  endif

  [m, n] = fscanf (fdes, "%d %d\n", "C");

  content = textscan(fdes, "%q"){1, 1};
  content = reshape(content, n + 1, m)';  % Transforma datele citite (sub forma 
                                          % de coloana) intr-un tablou cu
                                          % dimensiunile necesare.

  Y = str2double (content(:, 1));
  InitialMatrix = content(:, 2:end);

  fclose (file_path);
endfunction

%% Copyright (C) 2023 Sima Alexandru (312CA)

%% -*- texinfo -*-
%% @deftypefn {} {@var{is_positive} =} positive_definite (@var{A})
%%
%% Verifica daca matricea patratica @var{A} este pozitiv definita (toti
%% determinantii ce incep din (1, 1) sunt pozitivi).
%%
%% @seealso{}
%% @end deftypefn

function [is_positive] = positive_definite (A)
  is_positive = true;

  for i = 1:size (A, 1)

    if det (A(1:i, 1:i)) <= 0
      is_positive = false;
      return
    endif

  endfor

endfunction

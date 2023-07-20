%% Copyright (C) 2023 Sima Alexandru (312CA)

%% -*- texinfo -*-
%% @deftypefn {} {@var{matrix} =} initialize_weights (@var{L_prev}, @
%%  @var{L_next})
%%
%% Initializeaza @var{matrix} cu valori aleatoare in (-eps, eps).
%%
%% @tex
%% $$
%%  eps = \sqrt{\frac{6}{L_{next} + L_{prev}}}
%% $$
%% @end tex
%%
%% @ifnottex
%% eps = sqrt (6 / (L_next + L_prev))
%% @end ifnottex
%%
%% Deoarece functia @ref{rand} returneaza valori in (0, 1), intervalul este
%% marit intai la (0, 2 * eps), apoi translatat la stanga, devenind (-eps, eps).
%%
%% @seealso{}
%% @end deftypefn

function [matrix] = initialize_weights (L_prev, L_next)
  eps = sqrt (6 / (L_prev + L_next));
  interval_len = 2 * eps;

  matrix = -eps + interval_len * rand (L_next, L_prev + 1);
endfunction

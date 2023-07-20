%% Copyright (C) 2023 Sima Alexandru (312CA)

%% -*- texinfo -*-
%% @deftypefn {} {@var{X}, @var{err}, @var{steps} =} perform_iterative ( @
%%  @var{G}, @var{c}, @var{x0}, @var{tol}, @var{max_steps})
%%
%% Plecand de la aproximatia initiala @var{x0}, se cauta iterativ
%% probabilitatile de castig pentru fiecare patratel, folosind metoda Jacobi.
%% @var{G} este matricea de iteratie, iar @var{c} sunt termenii liberi
%% (probabilitatile de iesire).
%%
%% Algoritmul ruleaza de maximum @var{max_steps} ori, sau pana cand se atinge o
%% eroare @var{err} < @var{tol} si intoarce si eroarea obtinuta si numarul de
%% pasi executati.
%%
%% @seealso{}
%% @end deftypefn

function [x, err, steps] = perform_iterative (G, c, x0, tol, max_steps)
  x = x0;

  for steps = 1:max_steps
    prev = x;
    x = G * x + c;

    err = norm (x - prev, 2);

    if err < tol
      return
    endif

  endfor

endfunction

%% Copyright (C) 2023 Sima Alexandru (312CA)

%% -*- texinfo -*-
%% @deftypefn {} {@var{Theta} =} normal_equation (@var{FeaturesMatrix}, @
%%  @var{Y}, @var{tol}, @var{iter})
%%
%% Calculeaza coeficientii @var{Theta} aplicand metoda gradientului conjugat pe
%% intrarile @var{FeaturesMatrix} si iesirile @var{Y}. Algoritmul va rula de
%% maximum @var{iter} ori, sau pana cand eroarea e mai mica de @var{tol}.
%%
%% @seealso{gradient_descent}
%% @end deftypefn

function [Theta] = normal_equation (FeaturesMatrix, Y, tol, iter)
  n = size(FeaturesMatrix, 2);

  A = FeaturesMatrix' * FeaturesMatrix;
  b = FeaturesMatrix' * Y;
  Theta = zeros (n + 1, 1);

  if !positive_definite (A)
    return
  endif

  r = b - A * Theta(2:end);
  v = r;

  tol = tol^2;

  for k = 1:iter
    dot_prod = dot (r, r);

    if dot_prod <= tol
      return
    endif

    t = dot_prod / (v' * A * v);
    Theta(2:end) += t * v;
    r -= t * A * v;
    s = dot (r, r) / dot_prod;
    v = r + s * v;
  endfor

endfunction

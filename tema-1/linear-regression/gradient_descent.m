%% Copyright (C) 2023 Sima Alexandru (312CA)

%% -*- texinfo -*-
%% @deftypefn {gradient_descent.m} {@var{Theta} =} gradient_descent ( @
%%  @var{FeaturesMatrix}, @var{Y}, @var{n}, @var{m}, @var{alpha}, @var{iter})
%%
%% Calculeaza coeficientii @var{Theta} dupa @var{iter} operatii.
%% @var{FeaturesMatrix} = matricea predictorilor (m x n).
%% @var{Y} = vectorul de iesiri ale antrenamentelor (vector coloana cu m linii).
%% @var{m} = numarul de antrenamente.
%% @var{n} = numarul de predictori.
%%
%% @seealso{normal_equation}
%% @end deftypefn

function [Theta] = gradient_descent (FeaturesMatrix, Y, n, m, alpha, iter)
  Theta = zeros (n + 1, 1);

  for k = 1:iter
    delta = FeaturesMatrix' * (Theta(1) + FeaturesMatrix * Theta(2:end) - Y);
    delta /= m;

    Theta(2:end) -= alpha * delta;
  endfor

endfunction

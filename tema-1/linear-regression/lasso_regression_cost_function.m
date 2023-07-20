%% Copyright (C) 2023 Sima Alexandru (312CA)

%% -*- texinfo -*-
%% @deftypefn {} {@var{Error} =} lasso_regression_cost_function (@var{Theta}, @
%%  @var{Y}, @var{FeMatrix}, @var{lambda})
%%
%% Calculeaza functia de cost @var{Error} pentru coeficientii @var{Theta},
%% intrarile @var{FeMatrix} si iesirile @var{y}, folosind lasso regression, cu
%% coeficientul @var{lambda}.
%%
%% @seealso{linear_regression_cost_function, ridge_regression_cost_function}
%% @end deftypefn

function [Error] = lasso_regression_cost_function (Theta, Y, FeMatrix, lambda)
  m = size(Y, 1);
  T = Y - (Theta(1) + FeMatrix * Theta(2:end));
  Error = dot (T, T) / m + lambda * norm (Theta, 1);
endfunction

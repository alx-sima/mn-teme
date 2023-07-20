%% Copyright (C) 2023 Sima Alexandru (312CA)

%% -*- texinfo -*-
%% @deftypefn {} {@var{Error} =} ridge_regression_cost_function (@var{Theta}, @
%%  @var{Y}, @var{FeMatrix}, @var{lambda})
%%
%% Calculeaza functia de cost @var{Error} pentru coeficientii @var{Theta},
%% intrarile @var{FeMatrix} si iesirile @var{y}, folosind ridge regression, cu
%% coeficientul @var{lambda}.
%%
%% @seealso{lasso_regression_cost_function, linear_regression_cost_function}
%% @end deftypefn

function [Error] = ridge_regression_cost_function (Theta, Y, FeMatrix, lambda)
  m = size(Y, 1);
  T = Theta(1) + FeMatrix * Theta(2:end) - Y;
  Error = dot (T, T) / (2 * m) + lambda * dot (Theta, Theta);
endfunction

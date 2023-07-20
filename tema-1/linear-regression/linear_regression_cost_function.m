%% Copyright (C) 2023 Sima Alexandru (312CA)

%% -*- texinfo -*-
%% @deftypefn {} {@var{Error} =} linear_regression_cost_function (@var{Theta}, @
%%  @var{Y}, @var{FeatureMatrix})
%%
%% Calculeaza functia de cost @var{Error} pentru coeficientii @var{Theta},
%% aplicati pe intrarile @var{FeatureMatrix} si cu iesirile @var{Y}.
%%
%% @seealso{lasso_regression_cost_function, ridge_regression_cost_function}
%% @end deftypefn

function [Error] = linear_regression_cost_function (Theta, Y, FeatureMatrix)
  T = Theta(1) + FeatureMatrix * Theta(2:end) - Y;
  Error = dot (T, T) / (2 * size(FeatureMatrix, 1));
endfunction

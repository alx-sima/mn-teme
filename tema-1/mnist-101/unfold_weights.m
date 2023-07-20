%% Copyright (C) 2023 Sima Alexandru (312CA)

%% -*- texinfo -*-
%% @deftypefn {} {@var{theta1}, @var{theta2} =} unfold_weights (@var{weights}, @
%%  @var{input_layer_size}, @var{hidden_layer_size}, @var{output_layer_size)
%%
%% Extrage matricele @var{theta1}, @var{theta2}, redimensionandu-le
%% corespunzator, din @var{weights}
%%
%% @seealso{}
%% @end deftypefn

function [theta1, theta2] = unfold_weights (weights, input_layer_size, ...
    hidden_layer_size, output_layer_size)
  params_no = hidden_layer_size * (input_layer_size + 1);

  theta1 = weights(1:params_no);
  theta2 = weights(params_no + 1:end);
  theta1 = reshape (theta1, hidden_layer_size, input_layer_size + 1);
  theta2 = reshape (theta2, output_layer_size, hidden_layer_size + 1);
endfunction

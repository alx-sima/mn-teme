%% Copyright (C) 2023 Sima Alexandru (312CA)

%% -*- texinfo -*-
%% @deftypefn {} {@var{classes} =} predict_classes (@var{X}, @var{weights}, @
%%  @var{input_layer_size}, @var{hidden_layer_size}, @var{output_layer_size})
%%
%% Folosind ponderile @var{weights} si forward propagation, realizeaza predictii
%% pentru inputurile din @var{X}.
%%
%% @seealso{forward_propagation}
%% @end deftypefn

function [classes] = predict_classes (X, weights, input_layer_size, ...
    hidden_layer_size, output_layer_size)
  [theta1, theta2] = unfold_weights (weights, input_layer_size,
    hidden_layer_size, output_layer_size);

  predictions = forward_propagation (X, theta1, theta2);

  %% Se cauta maximul pe fiecare linie (test). Valoarea prezisa
  %% este indicele corespunzator valorii maxime.
  [_, classes] = max (predictions, [], 2);
endfunction

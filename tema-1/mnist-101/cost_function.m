%% Copyright (C) 2023 Sima Alexandru (312CA)

%% -*- texinfo -*-
%% @deftypefn {} {@var{J}, @var{grad} =} cost_function (@var{params}, @var{X}, @
%%  @var{y}, @var{lambda}, @var{input_layer_size}, @var{hidden_layer_size}, @
%%  @var{output_layer_size})
%%
%% Calculeaza costul @var{J} si vectorul gradientilor @var{grad}, primind
%% intrarile @var{X}, vectorul de iesiri @var{y}, coeficientii desfasurati
%% @var{params} si dimensiunile acestora.
%%
%% @seealso{}
%% @end deftypefn

function [J, grad] = cost_function (params, X, y, lambda, input_layer_size, ...
    hidden_layer_size, output_layer_size)
  m = size (X, 1);

  [theta1, theta2] = unfold_weights (params, input_layer_size,
    hidden_layer_size, output_layer_size);

  %% Ponderile la care ne asteptam sunt:
  %% - 1 pentru iesirea corecta;
  %% - 0 pentru celelalte.
  expected = zeros (m, output_layer_size);
  for i = 1:m
    expected(i, y(i)) = 1;
  endfor

  [predictions, a2, a1] = forward_propagation (X, theta1, theta2);

  cost = -sum (dot (expected, log (predictions)) + ...
    dot (1 - expected, log (1 - predictions)));
  reg = sum (dot (theta1(:, 2:end), theta1(:, 2:end))) + ...
    sum (dot (theta2(:, 2:end), theta2(:, 2:end)));

  J = cost / m + lambda * reg / (2 * m);

  delta3 = predictions - expected;
  delta2 = delta3 * theta2(:, 2:end) .* (a2 .* (1 - a2))(:, 2:end);

  grad2 = delta3' * a2;
  grad1 = delta2' * a1;

  grad2 ./= m;
  grad1 ./= m;

  grad2(:, 2:end) += theta2(:, 2:end) * lambda ./ m;
  grad1(:, 2:end) += theta1(:, 2:end) * lambda ./ m;

  grad = [grad1(:); grad2(:)];
endfunction

%% Copyright (C) 2023 Sima Alexandru (312CA)

%% -*- texinfo -*-
%% @deftypefn {} {@var{a3}, @var{a2}, @var{a1} =} forward_propagation (@var{X},@
%%  @var{theta1}, @var{theta2})
%%
%% Aplica pe variabilele din @var{X} (la care se adauga bias) transformarile
%% @var{theta1} si @var{theta2}. Dupa fiecare transformare se aplica si functia
%% @ref{sigmoid}.
%%
%% Returneaza atat valoarea finala @var{a3}, cat si cele intermediare (@var{a2}
%% - dupa prima transformare - si @var{a1} - inainte de transformari, avand si
%% coloane de bias).
%%
%% @seealso{sigmoid}
%% @end deftypefn

function [a3, a2, a1] = forward_propagation (X, theta1, theta2)
  a1 = [ones(size(X, 1), 1) X];                              % Se adauga bias-ul
  a2 = sigmoid (a1 * theta1');                    % Se aplica prima transformare
  a2 = [ones(size(a2, 1), 1) a2];                            % Se adauga bias-ul
  a3 = sigmoid (a2 * theta2');                    % Se aplica a 2-a transformare
endfunction

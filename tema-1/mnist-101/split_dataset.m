%% Copyright (C) 2023 Sima Alexandru (312CA)

%% -*- texinfo -*-
%% @deftypefn {} {@var{x_train}, @var{y_train}, @var{X_test}, @var{y_test} =} @
%%  split_dataset (@var{X}, @var{y}, @var{percent})
%%
%% Amesteca datele de intrare @var{X} si iesirile @var{y}. Primele
%% @var{percent}% vor reprezenta date de antrenament, iar restul vor fi teste.
%%
%% @seealso{}
%% @end deftypefn

function [x_train, y_train, X_test, y_test] = split_dataset (X, y, percent)
  m = size (X, 1);
  m_train = m * percent;     % Se calculeaza cate intrari vor fi de antrenament.

  %% Se genereaza o permutare a numerelor 1:n. Elementul i din permutare
  %% reprezinta indicele testului i dupa amestecare.
  shuffle_indices = randperm (m);
  X = X(shuffle_indices, :);
  y = y(shuffle_indices);

  %% Se imparte setul de date in antrenamente si teste.
  x_train = X(1:m_train, :);
  y_train = y(1:m_train);
  X_test = X(m_train + 1:end, :);
  y_test = y(m_train + 1:end);
endfunction

%% Copyright (C) 2023 Sima Alexandru (312CA)

%% -*- texinfo -*-
%% @deftypefn {} {@var{Adj} =} get_adjacency_matrix (@var{Labyrinth})
%%
%% Calculeaza matricea de adiacenta @var{Adj} a labirintului, plecand de la
%% codificarile in binar ale peretilor din @var{Labyrinth}.
%%
%% Matricea de adiacenta va contine pozitiile patratelelor in forma plana, adica
%% al catelea patratel din matrice este (de la stanga la dreapta si de sus in
%% jos), iar ultimele doua stari vor fi castig si pierdere.
%%
%% @seealso{get_link_matrix}
%% @end deftypefn

function [Adj] = get_adjacency_matrix (Labyrinth)
  [m, n] = size (Labyrinth);

  nr_states = m * n + 2;              % Sunt m * n patratele + 2 iesiri posibile
  Adj = sparse (nr_states, nr_states);

  directions = [-1 1 n -n];

  win_state = m * n + 1;                                        % Starea de win
  lose_state = m * n + 2;                                       % Starea de lose

  for i = 1:m

    for j = 1:n

      for k = 1:length (directions);

        %% Verifica daca bitul `k` al codificarii este
        %% setat (exista perete pe acea directie).
        if bitand (Labyrinth(i, j), bitshift (1, k - 1))
          continue
        endif

        current = (i - 1) * n + j;

        if (k == 1 && j == 1) || (k == 2 && j == n)
          Adj(current, lose_state) = 1;
        elseif (k == 3 && i == m) || (k == 4 && i == 1)
          Adj(current, win_state) = 1;
        else
          neighbor = current + directions(k);
          Adj(current, neighbor) = 1;
        endif

      endfor

    endfor

  endfor

  %% Din starile win/lose se poate ajunge doar in ele insele.
  Adj(win_state, win_state) = 1;
  Adj(lose_state, lose_state) = 1;
endfunction

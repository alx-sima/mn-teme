%% Copyright (C) 2023 Sima Alexandru (312CA)

%% -*- texinfo -*-
%% @deftypefn {} {@var{Link} =} get_link_matrix (@var{Labyrinth})
%%
%% Genereaza matricea de legaturi a @var{Labyrinth}-ului.
%%
%% Aceasta contine pe pozitia (i, j) sansele sa se treaca din patratelul i in j,
%% deci este similara cu matricea de adiacenta, doar ca valorile de pe linii se
%% impart la numarul de valori nenule (pentru ca sansele sunt egale sa treaca in
%% orice patratel disponibil, probabilitatea este 1 / nr. optiuni).
%%
%% @seealso{get_adjacency_matrix}
%% @end deftypefn

function [Link] = get_link_matrix (Labyrinth)
  Link = get_adjacency_matrix (Labyrinth);
  n = size (Link, 1);

  for i = 1:n
    %% Fiecare linie este impartita la numarul de valori nenule de pe aceasta
    %% (echivalent cu suma liniei, pt. ca toate valorile sunt 1), devenind o
    %% matrice stocastica.
    Link(i, :) ./= sum (Link(i, :));
  endfor

endfunction

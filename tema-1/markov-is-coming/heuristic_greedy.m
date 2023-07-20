%% Copyright (C) 2023 Sima Alexandru (312CA)

%% -*- texinfo -*-
%% @deftypefn {} {@var{path} =} heuristic_greedy (@var{start_position}, @
%%  @var{probabilities}, @var{Adj})
%%
%% Genereaza traseul de la @var{start_position} la iesire, avand matricea de
%% adiacenta @var{Adj} si probabilitatile de trecere intre patratele
%% @var{probabilities}.
%%
%% @seealso{}
%% @end deftypefn

function [path] = heuristic_greedy (start_position, probabilities, Adj)
  states = length (probabilities);
  path = [start_position];                     % Stiva care retine traseul urmat
  visited = sparse (states, 1);                      % Vector de frecventa care
  visited(start_position) = 1;                       % retine pozitiile vizitate

  win = states - 1;                                         % Pozitia starii win

  while path
    position = path(end);

    %% S-a iesit din labirint. Cautarea a luat sfarsit.
    if position == win
      return
    endif

    %% Se cauta vecinul cu probabilitatea maxima si care nu a fost vizitat.
    unvisited_neighbors = Adj(position, :)' .* !visited;
    [_, neigh] = max (unvisited_neighbors .* probabilities);

    %% Patratul nu are vecini nevizitati, se scoate din coada.
    if neigh == 0
      path = path(1:end - 1);
      continue
    endif

    %% Se adauga vecinul cu probabilitatea maxima.
    visited(neigh) = 1;
    path = [path; neigh];
  endwhile

endfunction

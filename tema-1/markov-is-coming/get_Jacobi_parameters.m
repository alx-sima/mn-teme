%% Copyright (C) 2023 Sima Alexandru (312CA)

%% -*- texinfo -*-
%% @deftypefn {} {@var{G}, @var{c} =} get_Jacobi_parameters (@var{Link})
%%
%% Calculeaza parametrii matricei @var{Link} pentru metoda Jacobi.
%%
%% @var{G} reprezinta matricea legaturilor intre patratele, iar @var{c}
%% reprezinta coloana legaturilor dintre patratele si iesirea castigatoare.
%%
%% @seealso{}
%% @end deftypefn

function [G, c] = get_Jacobi_parameters (Link)
  G = Link(1:end - 2, 1:end - 2);
  c = Link(1:end - 2, end - 1);
endfunction

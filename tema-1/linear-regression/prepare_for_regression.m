%% Copyright (C) 2023 Sima Alexandru (312CA)

%% -*- texinfo -*-
%% @deftypefn {} {@var{FeatureMatrix} =} prepare_for_regression ( @
%%  @var{InitialMatrix})
%%
%% Transforma valorile string din @var{InitialMatrix} in numere astfel:
%%  - yes             -> 1;
%%  - no              -> 0;
%%  - semi-furnished  -> [1 0];
%%  - unfurnished     -> [0 1];
%%  - furnished       -> [0 0].
%%
%% @seealso{}
%% @end deftypefn

function [FeatureMatrix] = prepare_for_regression (InitialMatrix)
  [m n] = size (InitialMatrix);
  FeatureMatrix = [];

  for i = 1:m
    new_vals = [];

    for j = 1:n
      val = InitialMatrix{i, j};

      if strcmp (val, "yes")
        encoding = 1;
      elseif strcmp (val, "no")
        encoding = 0;
      elseif strcmp (val, "semi-furnished")
        encoding = [1 0];
      elseif strcmp (val, "unfurnished")
        encoding = [0 1];
      elseif strcmp (val, "furnished")
        encoding = [0 0];
      else
        encoding = str2double (val);
      endif

      new_vals = [new_vals encoding];
    endfor

    FeatureMatrix = [FeatureMatrix; new_vals];
  endfor

endfunction

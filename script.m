getStartTime1;

[x0, y0, nx0, ny0, V, nV, Nm, mL] = Process_VT1(position_results, 0, arena_data);

%Time spent on particular sides of chamber
[N, edges] = histcounts(x0, edges);

%Time spent on particular sides of chamber, ½ assay 
[x0, y0, nx0, ny0, V, nV, Nm, mL] = Process_VT1(position_results, startFrame, arena_data);
frames = 1:length(x0);
frames = frames';  % Transpose to column vector
% boundaries determined via plot(x0,y0)
N = histcounts2(x0, frames, [Ledge, middle, Redge], [1, length(frames)/2, length(frames)]);
N = N / 30; % Convert from frames to seconds, assuming 30Hz framerate


% Determine distance traveled between two time points
getStartTime1;
[x0, y0, nx0, ny0, V, nV, Nm, mL] = Process_VT1(position_results, 1, arena_data);

% ComputeDistanceTraveled - Assuming this is a function defined elsewhere
D = ComputeDistanceTraveled(x0, y0);

% Specifying time in seconds
timeins = linspace(1, length(x0) / 30, length(x0));

% Get a linear index for times between 60s and 120s
indx = find(timeins >= 60 & timeins <= 120);

% Compute total distance traveled in cm
% Assuming 'conversion_factor' is a variable defined in 'arena_data'
total_distance = nansum(D(indx)) / conversion_factor;


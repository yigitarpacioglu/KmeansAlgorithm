function y=prep(x)

% This function normalize data between [-1,1].

z_score = (x-mean(x))./std(x);

y = sigmo (z_score );


end
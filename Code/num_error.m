function error = num_error(a, b, n)
    error = 0;
    for i=1: n
        if(a(i) ~= b(i))
            error = error + 1;
        end
    end
    error = error ./ n;
end
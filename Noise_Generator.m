Settings;
exp_type = mod(round(rand() * 1000), 4);
%disp(exp_type);
noise1  = rand(1, len);
switch exp_type
    case 0
        noise2  = rand(1, len);
    case 1
        noise2  = noise1;
    case 2
        noise2(delaying + 1:len) = noise1(1:len - delaying);
        noise2(1:delaying) = noise1(len - delaying + 1:len);
    case 3
        noise2(len - delaying + 1:len) = noise1(1:delaying);
        noise2(1:len - delaying) = noise1(delaying + 1:len);
end
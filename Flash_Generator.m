Settings;
%disp(noise);
mat = zeros(height,width, 3, len); 
%F = VideoWriter(FileName);
%F.FrameRate = framerate;
%open(F);
%tic;
cnt = 0;
task_answer = 0;
vis = 1;
for i = 1:len
    mat(31:60, 26:55, 3 - 2 * rb_type, i) = ones(30) * noise1(i);
    cnt = cnt + 1;
    if mod(cnt, 153) + mod(round(rand() * 1000), 2) == 0
        vis = 1 - vis;
        task_answer = task_answer + 1;
    end
    mat(31:60, 66:95, 2, i) = ones(30) * vis;
    mat(31:60, 106:135, 1 + 2 * rb_type, i) = ones(30) * noise2(i);
    image(mat( :, :, :, i));
    drawnow;
    %writeVideo(F, mat(:, :, :, i));
end
disp("Task answer:");
disp(task_answer);
%toc;
%disp(toc);
%close(F);
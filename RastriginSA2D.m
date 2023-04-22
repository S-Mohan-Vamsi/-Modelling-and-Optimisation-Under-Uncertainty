rastrigin = @(x) sum((x.^2 - 10*cos(2*pi*x)) + 10*2);
dim = 2;
num_runs = 15;

lb = -5.12 * ones(1,dim);
ub = 5.12 * ones(1,dim);

options = saoptimset('Display', 'off');

sa_results = zeros(num_runs, 3);

for i = 1:num_runs
    x0 = lb + rand(1,dim) .* (ub-lb);

    [x, fval] = simulannealbnd(rastrigin, x0, lb, ub, options);

    sa_results(i,:) = [fval, rastrigin(x), i];
end

sa_avg = mean(sa_results(:,1:2));
sa_std = std(sa_results(:,1:2));

sa_best = min(sa_results(:,1:2));
sa_worst = max(sa_results(:,1:2));

figure;
errorbar(sa_results(:,3), sa_results(:,2), sa_std(2)*ones(num_runs,1), 'b.');
hold on;
plot(sa_results(:,3), sa_results(:,1), 'r.');
xlabel('Iterations');
ylabel('Function Value');
title('Shifted Rastrigin''s Function Optimization with Simulated Annealing 2D');
legend('Average Result', 'Best Result');

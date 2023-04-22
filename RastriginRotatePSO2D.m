rastrigin = @(x) sum((x.^2 - 10*cos(2*pi*x)) + 10*2) + sum((x - 5).^2);

dim = 2;
num_runs = 15;

lb = -5.12 * ones(1,dim);
ub = 5.12 * ones(1,dim);

options = optimoptions('particleswarm','Display','off');

pso_results = zeros(num_runs, 3);

for i = 1:num_runs
    [x, fval] = particleswarm(rastrigin, dim, lb, ub, options);

    pso_results(i,:) = [fval, rastrigin(x), i];
end

pso_avg = mean(pso_results(:,1:2));
pso_std = std(pso_results(:,1:2));

pso_best = min(pso_results(:,1:2));
pso_worst = max(pso_results(:,1:2));

figure;
errorbar(pso_results(:,3), pso_results(:,2), pso_std(2)*ones(num_runs,1), 'b.');
hold on;
plot(pso_results(:,3), pso_results(:,1), 'r.');
xlabel('Iterations');
ylabel('Function Value');
title('Shifted Rotated Rastrigin''s Function Optimization with Particle Swarm 2D');
legend('Average Result', 'Best Result');

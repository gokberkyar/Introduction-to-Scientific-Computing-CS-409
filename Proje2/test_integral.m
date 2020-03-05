function test_integral(f,h,tol,counter)



f_upper= @(x) -sqrt(3)/3 * (x-h);
f_below= @(x)  sqrt(3)/3 * (x-h);
tic
Benchmark_Approximation = integral2(f,-h/2,h,f_below,f_upper,'AbsTol',tol);
benchmark_runtime=toc;

tic
figure
[myInt_approximation,iter,error]= my_Integral(f,h,tol);


myIntegration_runtime=toc;
function_name =  func2str(f);
figureName = "Function "+ function_name + " h value " + string(h) + " tol " + string(tol);
title(figureName)
counter =counter+1;
saveName = "file"+string(counter) + ".eps";

print('-depsc2', '-loose', saveName);

figure
[x,y] = meshgrid(-3:.2:3);
z =  f(x,y);
surf(x,y,z)
Absolute_Difference_Benchmark=abs(Benchmark_Approximation-myInt_approximation);
Absolute_Difference_Benchmarks=sprintf('Absolute Diff. : %0.2e',Absolute_Difference_Benchmark);
ratio=myIntegration_runtime/benchmark_runtime;
myInt_runtime = sprintf('My Runtime : %0.2e',myIntegration_runtime);
Runtime_Ratio = sprintf('Runtime ratio my/bench : %0.1e',ratio);
benchmark_app = sprintf('Bench App. : %0.5e',Benchmark_Approximation);
myInt_app     = sprintf('My App. : %0.5e ',myInt_approximation);
myInt_iter    = sprintf('My Iter : %d ',iter);
myInt_error   = sprintf('My Error : %0.5e ',error);
Absolute_Difference_Benchmarks=sprintf('Absolute Diff. : %0.2e',Absolute_Difference_Benchmark);
benchmark_runtimes = sprintf('Benchmark Runtime : %0.2e',benchmark_runtime);
dim=[0.7 0.6 0.3 0.4];
str = {benchmark_app,benchmark_runtime,myInt_app,myInt_iter,myInt_error,myInt_runtime,Absolute_Difference_Benchmarks,Runtime_Ratio};
annotation('textbox',dim,'FitBoxToText','on','String',str);
%function_name =  func2str(f);
%figureName = "Function "+ function_name + " h value " + string(h) + " tol " + string(tol);
title(figureName,'horizontalAlignment', 'right')

end
% iros_data_2.m

A = [
0.022713 0.012118 -0.002525 -0.019043
0.017778 0.005808 -0.016395 -0.003676
0.025385 0.012826 -0.018780 -0.011279
0.006122 -0.000988 -0.002778 -0.005365
0.015181 0.014655 -0.002020 -0.003411
0.014054 0.008803 -0.010272 -0.003808
0.017397 0.008015 -0.013469 -0.007551
0.005061 0.004967 -0.000940 -0.000243
0.009532 0.001787 -0.000725 -0.009335
0.010401 0.010385 -0.000580 -0.000074
];

B = [
0.011124 0.008689 -0.004705 -0.005111
0.009328 0.005268 -0.007162 -0.002823
0.009165 0.006552 -0.006085 -0.002007
0.002381 0.000729 -0.002141 0.000745
0.014838 0.012886 -0.007014 -0.002222
0.009026 -0.000029 -0.000929 0.008978
0.009233 0.006915 -0.003197 -0.005215
0.003484 0.002059 -0.000139 -0.002807
0.004039 0.001618 -0.003441 -0.001361
0.013037 0.008789 -0.008113 -0.005184
];

C = [
0.016548 0.008029 -0.012552 -0.007200
0.017462 -0.004370 -0.015189 -0.007423
0.019286 0.008022 -0.017538 0.000139
0.006832 0.000623 -0.006595 0.001671
0.013054 0.007098 -0.010163 -0.004092
0.014384 0.009166 -0.010296 -0.004107
0.022304 0.011403 -0.002809 -0.018962
0.023296 0.018491 -0.004243 -0.013519
0.006817 0.003981 -0.004094 -0.003724
0.026582 -0.019641 -0.002929 -0.017670
];

D = [
0.007836 0.007411 -0.000841 -0.002404
0.012347 0.007894 -0.006248 -0.007149
0.001509 0.001301 -0.000694 -0.000323
0.006663 0.004953 -0.000315 -0.004446
0.009104 -0.009011 -0.000554 -0.001179
0.011129 0.008082 -0.001843 0.007426
0.004852 0.004685 -0.000270 0.001234
0.009705 -0.007947 -0.000145 -0.005568
0.005329 0.004864 -0.000394 -0.002142
0.004277 0.004147 0.000003 0.001045
];

meanA = mean(A); stdA = std(A);
meanB = mean(B); stdB = std(B);
meanC = mean(C); stdC = std(C);
meanD = mean(D); stdD = std(D);

for i = 1:4
    fprintf('& $%f \\pm %f$',meanA(i),stdA(i));
end
fprintf('\n');
for i = 1:4
    fprintf('& $%f \\pm %f$',meanB(i),stdB(i));
end
fprintf('\n');
for i = 1:4
    fprintf('& $%f \\pm %f$',meanC(i),stdC(i));
end
fprintf('\n');
for i = 1:4
    fprintf('& $%f \\pm %f$',meanD(i),stdD(i));
end
fprintf('\n');

%% graphic
%bar(meanA,meanB,meanC,meanD)
figure; %hold on;
bar(abs([meanA; meanB; meanC; meanD])');
set(gca,'fontsize',14);
ylabel('Average error (m)');
legend('no options/no lookahead','no options/lookahead','options/no lookahead','options/lookahead');
set(gca,'XTickLabel',{'Distance', 'X', 'Y', 'Z'});
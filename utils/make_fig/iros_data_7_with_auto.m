% iros_data_2.m

A = [
%0.242604 0.142780 -0.174416 0.089719
%0.346199 0.331833 -0.088881 0.042905
0.014012 0.013069 -0.001370 0.004863
0.036230 0.015586 -0.005926 0.032165
0.023172 -0.018296 -0.002299 -0.014033
%0.218775 -0.199996 0.073229 -0.050018
%0.119906 -0.037644 0.110149 0.028764
0.010604 0.010394 0.000059 -0.002097
%0.481964 -0.131066 -0.451607 0.105650
0.017310 0.017295 -0.000516 0.000479
0.009445 0.003538 -0.007351 -0.004759
0.020784 0.011128 -0.017268 -0.003159
0.006739 0.003814 -0.002098 0.005145
0.006210 0.001828 -0.000262 -0.005929
0.018413 0.006385 -0.017238 -0.001060
%0.218773 -0.199991 0.073220 -0.050042
0.025529 -0.020544 0.012332 -0.008811
0.017202 0.010373 0.000203 -0.013721
%0.252747 -0.031457 -0.185358 -0.168919
0.011845 0.000439 -0.011806 0.000851
];

B = [
0.007629 0.004250 -0.000701 -0.006296
0.009818 0.006890 -0.005929 0.003711
0.010744 0.009620 -0.004166 -0.002353
%0.308808 -0.000001 0.073227 0.300000
0.011211 -0.006709 -0.004282 0.007896
%0.298330 -0.253058 -0.030852 -0.154955
0.010387 0.003960 -0.009183 -0.002809
0.011519 0.010408 -0.001573 -0.004677
0.020399 0.014693 -0.003824 -0.013624
0.011921 0.011754 0.000227 -0.001973
0.006861 0.004081 -0.000856 -0.005449
0.011800 0.007846 -0.004403 -0.007635
0.011597 0.007563 -0.008741 -0.000945
0.009367 0.008782 -0.000590 -0.003204
0.003274 0.000580 -0.001867 0.002626
0.008437 0.008194 -0.001566 -0.001260
0.013628 0.005492 -0.006513 -0.010637
0.012432 0.009336 -0.006907 0.004435
0.007329 0.006675 0.000004 -0.003026
0.002891 -0.000105 -0.000762 -0.002787
];

C = [
0.014546 0.004382 -0.008446 -0.011002
0.019408 0.008652 -0.015578 -0.007690
0.014159 0.008094 -0.011215 0.003032
%0.308808 -0.000028 0.073226 0.300000
0.043692 -0.007457 0.033808 -0.026653
%0.130027 -0.050338 0.037796 0.113774
%1.358262 1.119358 -0.146296 0.755322
0.008432 0.008013 -0.001880 0.001833
0.015418 0.014763 -0.004103 -0.001710
%0.112506 0.042298 -0.009260 -0.103840
0.053399 -0.052066 0.006603 -0.009851
0.003256 0.003108 -0.000342 -0.000910
0.020755 -0.010378 -0.000657 -0.017961
0.094331 0.019130 0.047122 -0.079447
0.022279 -0.017401 -0.003566 -0.013449
0.005222 -0.004710 -0.000587 -0.002178
0.017471 -0.000905 -0.016438 0.005848
%0.185984 -0.026461 0.053638 -0.176104
%0.308806 -0.000090 0.073220 0.300000
0.017144 -0.013494 0.000114 -0.010574
];

D = [
0.008665 0.008654 0.000086 0.000429
0.006709 0.006603 -0.000157 -0.001176
0.014374 0.014287 -0.001070 0.001166
0.012942 0.011464 -0.001063 -0.005911
0.006384 0.004399 -0.004084 -0.002174
0.006985 0.000234 -0.002221 -0.006619
0.007901 0.007384 -0.002527 -0.001230
0.015105 0.011841 -0.009360 -0.000592
0.007224 0.006160 -0.002927 -0.002384
0.004288 0.002360 -0.003560 -0.000374
0.002221 -0.000320 -0.000894 -0.002008
0.006267 -0.005994 -0.000699 0.001689
0.012154 -0.004809 -0.000417 -0.011155
0.005121 -0.004326 -0.000182 0.002734
0.011652 0.006147 -0.009884 0.000531
0.002190 0.001560 -0.001515 0.000268
0.007078 0.004882 -0.005003 -0.001111
0.005032 -0.001748 -0.002166 -0.004192
0.009094 0.008184 -0.000054 -0.003966
0.008445 0.000003 -0.006234 -0.005697
];

AA = [
0.005250 0.003627 -0.000427 -0.003772
0.005584 -0.002741 -0.000163 -0.004863
0.004128 0.001407 -0.003837 -0.000582
0.003309 -0.003122 0.000108 -0.001092
0.002831 -0.001850 -0.002079 -0.000520
0.005948 0.005374 -0.000000 -0.002547
0.001648 -0.000784 -0.001293 -0.000656
0.004806 0.001067 -0.002524 -0.003949
0.009212 -0.006600 -0.000117 -0.006426
0.013626 -0.012007 -0.002585 -0.005900
0.014371 -0.010839 0.000660 -0.009413
0.020033 -0.006397 -0.018904 0.001743
0.003514 -0.003287 -0.001083 -0.000611
0.021197 -0.020242 -0.004335 -0.004559
0.008404 -0.008306 -0.000568 -0.001150
%0.218782 -0.200011 0.073220 -0.050000
%0.103317 -0.042175 0.082089 0.046444
0.020968 0.009402 -0.018676 0.001572
0.025678 -0.025456 -0.001409 0.003066
0.015746 0.004974 -0.014104 -0.004927
    ];
BB = [
    0.005250 0.003627 -0.000427 -0.003772
0.005584 -0.002741 -0.000163 -0.004863
0.004128 0.001407 -0.003837 -0.000582
0.003309 -0.003122 0.000108 -0.001092
0.002831 -0.001850 -0.002079 -0.000520
0.005948 0.005374 -0.000000 -0.002547
0.001648 -0.000784 -0.001293 -0.000656
0.004806 0.001067 -0.002524 -0.003949
0.009212 -0.006600 -0.000117 -0.006426
0.013626 -0.012007 -0.002585 -0.005900
0.010271 -0.009290 -0.003345 -0.002827
0.007147 -0.002388 0.000539 -0.006714
0.010036 -0.002750 -0.009638 0.000517
0.005667 -0.004173 0.000155 -0.003831
0.008366 -0.001790 0.000168 -0.008171
0.007148 -0.006907 0.000377 -0.001801
0.005780 -0.004428 -0.000200 -0.003709
0.084674 0.015763 0.083023 -0.005335
0.002448 -0.001039 -0.000576 -0.002140
0.004036 0.002119 -0.001394 -0.003139
    ];
CC = [
%1.588276 -1.379801 0.398915 -0.677964
%0.247565 -0.143716 -0.181534 -0.087631
0.076927 -0.035139 0.058140 0.036093
%0.308806 -0.000070 0.073221 0.300000
0.007525 -0.004723 -0.000969 0.005777
%0.218773 -0.199993 0.073221 -0.050031
0.022983 -0.022107 -0.001244 -0.006161
0.026763 0.010202 0.001099 -0.024718
0.018261 -0.003577 0.000345 -0.017904
%0.220863 0.029290 -0.058471 0.210959
%0.280050 -0.184080 -0.105585 0.182740
0.004605 -0.004181 -0.000437 -0.001880
0.000681 -0.000231 -0.000473 -0.000431
0.017925 -0.011531 -0.011034 -0.008162
0.034035 -0.001570 0.000488 -0.033995
0.014557 -0.013337 -0.001335 -0.005680
0.019835 -0.004497 -0.018505 -0.005550
0.019465 0.002531 -0.000498 -0.019293
0.039481 0.004453 -0.000038 -0.039229
%2.284281 0.377487 -0.425350 -2.212356
    ];
DD = [
0.004134 0.002392 -0.000442 -0.003342
0.002245 0.002106 -0.000408 -0.000661
0.004771 -0.002400 -0.003785 0.001637
0.004509 0.002745 -0.001856 -0.003059
0.002452 0.002291 0.000059 -0.000872
0.011838 -0.009942 -0.000315 -0.006418
0.003128 -0.000036 -0.000883 0.003000
0.003864 0.003107 -0.002204 -0.000646
0.003538 0.002545 -0.000093 0.002457
0.005727 -0.002417 -0.001339 -0.005016
0.007108 0.006740 -0.000715 -0.002140
0.003142 -0.001457 -0.002741 0.000485
0.081717 0.016802 0.079945 -0.002042
0.002679 0.001666 -0.000623 -0.002003
0.010837 -0.008953 -0.000318 0.006099
0.081301 0.009160 0.080778 0.000953
0.009961 -0.002631 -0.009607 0.000059
0.004645 0.001192 -0.001167 -0.004335
0.009571 -0.008364 -0.003855 0.002605
0.002549 0.002531 -0.000186 0.000231
    ];

A = abs(A);
B = abs(B);
C = abs(C);
D = abs(D);
AA = abs(AA);
BB = abs(BB);
CC = abs(CC);
DD = abs(DD);

percentile = 20;
meanA = trimmean(A,percentile); stdA = std(A);
meanB = trimmean(B,percentile); stdB = std(B);
meanC = trimmean(C,percentile); stdC = std(C);
meanD = trimmean(D,percentile); stdD = std(D);
meanAA = trimmean(AA,percentile); stdAA = std(AA);
meanBB = trimmean(BB,percentile); stdBB = std(BB);
meanCC = trimmean(CC,percentile); stdCC = std(CC);
meanDD = trimmean(DD,percentile); stdDD = std(DD);

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
%bar(abs([meanA; meanB; meanC; meanD;meanAA; meanBB; meanCC; meanDD])');
bar(abs([meanA; meanB; meanD;meanAA; meanBB; meanDD])');
%barwitherr([stdA;stdB;stdD;stdAA;stdBB;stdDD]',abs([meanA; meanB; meanD;meanAA; meanBB; meanDD])');
set(gca,'fontsize',14);
ylabel('Average error (m)');
%legend('no options/no lookahead','no options/lookahead', ...
%    'options/no lookahead','options/lookahead',...
%    'a/no options/no lookahead', ...
%    'a/no options/lookahead', ...
%    'a/options/no lookahead', ...
%    'a/options/lookahead');
legend('Baseline','No Options', ...
    'Full',...
    'Auto/Baseline', ...
    'Auto/No Options', ...
    'Auto/Full');
set(gca,'XTickLabel',{'Distance', 'X', 'Y', 'Z'});
clear all;close all;clc

%load('C:\Users\felipep\Dropbox\Doutorado\Massive MIMO\simulations\uplink_detection_comparison_flat_fading_results\Massive_MU_MIMO_M_100_K_10_flat_fading_various_detectors_20150208T141007.mat');
%load('C:\Users\felipep\Dropbox\Doutorado\Massive MIMO\simulations\uplink_detection_comparison_flat_fading_results\Massive_MU_MIMO_M_50_K_10_flat_fading_various_detectors_20150208T163418.mat');
%load('C:\Users\felipep\Dropbox\Doutorado\Massive MIMO\simulations\uplink_detection_comparison_flat_fading_results\Massive_MU_MIMO_M_250_K_10_flat_fading_various_detectors_20150208T222131.mat');
%load('C:\Users\felipep\Dropbox\Doutorado\Massive MIMO\simulations\uplink_detection_comparison_flat_fading_results\Massive_MU_MIMO_M_100_K_10_flat_fading_various_detectors_20150208T141007.mat');
%load('C:\Users\felipep\Dropbox\Doutorado\Massive MIMO\simulations\uplink_detection_comparison_flat_fading_results\Massive_MU_MIMO_M_50_K_10_flat_fading_various_detectors_20150208T163418.mat');
%load('C:\Users\felipep\Dropbox\Doutorado\Massive MIMO\simulations\uplink_detection_comparison_flat_fading_results\Massive_MU_MIMO_M_400_K_10_flat_fading_various_detectors_20150211T122801.mat');
%load('C:\Users\felipep\Dropbox\Doutorado\Massive MIMO\simulations\uplink_detection_comparison_flat_fading_results\Massive_MU_MIMO_M_500_K_10_flat_fading_various_detectors_20150212T174718.mat');
load('.\M_MU_MIMO_M_1000_K_10_multFad_woLargeScl_rake_perfect_est_20150503T104136.mat');

desiredEnNo = -20:1:-14;
for i=1:1:length(desiredEnNo)
    EbNoVecidx(i)=find(EbNoVec==desiredEnNo(i));
end
%EbNoVec = desiredEnNo;

LineWidth = 2;
FontSize = 14;
LOC = 'SouthWest';

% Set up a figure for visualizing BER results.
figure;
h = gcf; grid on; hold on;
set(h, 'Position', [0 0 600 500])
set(gca,'yscale','log','xlim',[EbNoVec(EbNoVecidx(1))-0.01, EbNoVec(EbNoVecidx(end))],'ylim',[1e-9 0.1e-4]);
xlabel('E_{b}/N_{0} [dB]','FontSize',FontSize,'FontName','Times New Roman');
ylabel('BER','FontSize',FontSize,'FontName','Times New Roman'); 
set(h,'NumberTitle','off');
set(h, 'renderer', 'zbuffer'); 
set(h,'Name', 'OFDM modulated with QPSK Massive MU-MIMO System');
%title('Massive MU-MIMO Detection on Uplink','FontSize',FontSize,'FontName','Times');

for k_idx=1:1:length(K)
    
    numSym = K(k_idx)*NFFT; % number of symbols, i.e., number of terminals.
    
    for m_idx=1:1:length(M)
        
        % Loop over selected EbNo points.
        idx1 = EbNoVecidx(1);
        for eb_no_idx = 1:length(desiredEnNo)
            
            idx = EbNoVecidx(eb_no_idx);
            
            % Plot results
            semilogy(EbNoVec(idx1:idx), BER_MFB(m_idx,idx1:idx), 'k-','LineWidth',2,'MarkerSize',12,'MarkerEdgeColor','k','MarkerFaceColor','w');
            semilogy(EbNoVec(idx1:idx), BER_MMSE_LE(m_idx,idx1:idx), 'ks-','LineWidth',0.5,'MarkerSize',12,'MarkerEdgeColor','k','MarkerFaceColor','w');
            semilogy(EbNoVec(idx1:idx), BER_ZF_LE(m_idx,idx1:idx), 'kx','LineWidth',0.5,'MarkerSize',12,'MarkerEdgeColor','k','MarkerFaceColor','w');
            semilogy(EbNoVec(idx1:idx), BER_MRC(m_idx,idx1:idx), 'ko-','LineWidth',0.5,'MarkerSize',12,'MarkerEdgeColor','k','MarkerFaceColor','w');

            set(gca,'FontSize',FontSize)
            set(gca,'FontName','Times New Roman')
            legend('MFB', 'MMSE', 'ZF','MRC','Location',LOC);
            drawnow;
         end
%         
%         for eb_no_idx = 1:length(desiredEnNo)
%             idx = EbNoVecidx(eb_no_idx);
%             semilogy(EbNoVec(idx1:idx), BER_MRC(m_idx,idx1:idx), 'k-', EbNoVec(idx1:idx), BER_ZF_LE(m_idx,idx1:idx), 'k-', EbNoVec(idx1:idx), BER_MMSE_LE(m_idx,idx1:idx), 'k-', EbNoVec(idx1:idx), BER_MFB(m_idx,idx1:idx), 'k-','LineWidth',1,'MarkerFaceColor','white','MarkerSize',8);
%         end
        
    end
end
%set(gca,'FontName','Times New Roman','FontSize',12,'XTick',0:5:30,'YTick',4.34:0.01:4.38);
hold off;

function symbol_sourse1 = data_map3(inter_pilot_out,z_out)
%û�п���n_PRB,������m (P20),����ֱ��ӳ��Ϊһ����������֡���д���
global ackNackSRS_SimuTran;
global pucch_type;
global N_UL_RB;
global N_RB_sc;
global PUCCHc;
global PUCCHN_1_cs;
global n_1_PUCCH;
global Delta_PUCCH_shift;
global N_2_RB;
global subframe_N;
global n_s;
global CPflag;
global n_2_PUCCH;
% if (CPflag==0)
%   PUCCHc=3;
% else
%  PUCCHc=2;
% end
 [M,N] = size(inter_pilot_out);
 symbol_sourse = inter_pilot_out;
if (ackNackSRS_SimuTran == 1) && (pucch_type == 0 || pucch_type == 1|| pucch_type == 2) 
  k = 1;
for j = 1:N-1                            %ΪSRSԤ��һ��SC-FDMA����
    for i = 1:M 
        if symbol_sourse(i,j) == 0;%��Ƶ����ȫ�Ƿ���ĸ�ֵ����
            symbol_sourse(i,j) = z_out(k);
            k = k+1;
        end
    end
end

else
k = 1;
for j = 1:N                                %������SRS
    for i = 1:M
        if symbol_sourse(i,j) == 0;%��Ƶ����ȫ�Ƿ���ĸ�ֵ����
            symbol_sourse(i,j) = z_out(k);
            k = k+1;
        end
    end
end
end
% if (pucch_type==0||pucch_type==1||pucch_type==2)
%    temp1=(PUCCHc * PUCCHN_1_cs) / Delta_PUCCH_shift;
%    if(PUCCHN_1_cs==0)
%        nn=0;
%    else
%        nn=1
%    end     %nn��PUCCHN_1_cs/8����ȡ����ֵ
% if  (n_1_PUCCH<temp1)  %����PUCCH��ӳ��λ��
%     m=N_2_RB;
% else
%     m=floor((n_1_PUCCH-temp1)/(PUCCHc*N_RB_sc/Delta_PUCCH_shift))+N_2_RB+nn;
% end
% else
%     m=floor(n_2_PUCCH/N_RB_sc);
% end  
 symbol_sourse1 = zeros(N_UL_RB*12,14);
% for ii=1:2
%     if (ii==1)
%     n_s_1=2*subframe_N ;
%     else
%     n_s_1=(2*subframe_N)+1;
%     end
%     if (mod(m+mod(n_s_1,2),2)==0)
%      n_prb(1,ii)=floor(m/2);
%     else
%      n_prb(1,ii)=N_ULRB-1-floor(m/2);
%     end  
% end    %n_prb�зֱ������ʱ϶��PUCCH��ӳ��λ��
% symbol_sourse1(n_prb(1)*12+1 : (n_prb(1)+1)*12,1:7) = symbol_sourse(:,1:7);
% symbol_sourse1(n_prb(2)*12+1 : (n_prb(2)+1)*12,8:14) = symbol_sourse(:,8:14);
% symbol_sourse1(n_prb(1)*12+1 : (n_prb(1)+1)*12,1:7) = symbol_sourse(:,1:7);
% symbol_sourse1(n_prb(2)*12+1 : (n_prb(2)+1)*12,8:14) = symbol_sourse(:,8:14);
symbol_sourse1(8*12+1 : 9*12,1:7) = symbol_sourse(:,1:7);
symbol_sourse1(6*12+1 : 7*12,8:14) = symbol_sourse(:,8:14);

%=======================================================
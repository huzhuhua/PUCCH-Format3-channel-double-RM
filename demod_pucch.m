function Rxinput_b = demod_pucch(Rxinput_d,pucch_tpye)
%PUCCH����ĵ��ƣ�����Э���еı���5.4.1-1
if pucch_tpye == 1           %1a
    if Rxinput_d > 0
        Rxinput_b = 0;
    else
        Rxinput_b = 1;
    end
elseif pucch_tpye == 2       %1b
    Rxinput_d_dec = Rxinput_d * (1 + j);           
    %����һ����ת���ӡ��ֱ��ж�ʵ�����鲿�����ʵ������0�����1����Ϊ0�������1����Ϊ1
                                       %����鲿С��0�����2����Ϊ0�������2����Ϊ1                  
    if real(Rxinput_d_dec) > 0
        Rxinput_b = 0;
    else
        Rxinput_b = 1;
    end
    
    if imag(Rxinput_d_dec) > 0
        Rxinput_b = [Rxinput_b 0];
    else
        Rxinput_b = [Rxinput_b 1];
    end
end
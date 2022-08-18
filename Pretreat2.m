order = xlsread('\附件1 近5年402家供应商的相关数据.xlsx', '企业的订货量（m³）', 'B2:IH403');
supply = xlsread('\附件1 近5年402家供应商的相关数据.xlsx', '供应商的供货量（m³）', 'B2:IH403');
total_supply=sum(supply,2);%订货总量
total_order=sum(order,2);%订货总量
times=zeros(402,1);%供货次数
% stability_supply=zeros(370,1);%供货稳定性
% 
% for i=1:370
%     count=0;%供货次数 
%     m_count=0;%方差之和
%     for j=1:240
%         if supply(i,j)~=0
%             count=count+1;
%             m_count=m_count+(supply(i,j)-order(i,j))^2;
%         end
%     end
%     times(i)=count;
%     stability_supply(i)=m_count./count;
% end
average_supply=zeros(402,1);%平均供货强度
for i=1:402
    average_supply(i)=total_supply(i)/240;
end
complete=zeros(402,1);%完成率
for i=1:402
    complete(i)=total_supply(i)/total_order(i);
end
%times_order=zeros(402,1);%订货次数
order_rate=zeros(402,1);%订单率
for i=1:402
    count_order=0;%完成指标次数
    for j=1:240
        if order(i,j)>=10
            count_order=count_order+1;
        end
    end
    order_rate(i)=count_order/240;
end
risk=zeros(402,1);%风险
variance=zeros(402,1);%方差
for i=1:402
    for j=1:240
        variance(i)=variance(i)+(supply(i,j)-average_supply(i))^2;
    end
    risk(i)=(variance(i)/240)^(1/2);
end

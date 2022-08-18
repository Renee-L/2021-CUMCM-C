%% 数据预处理
order = xlsread('\附件1 近5年402家供应商的相关数据.xlsx', '企业的订货量（m³）', 'B2:IH403');
supply = xlsread('\附件1 近5年402家供应商的相关数据.xlsx', '供应商的供货量（m³）', 'B2:IH403');
times=zeros(370,1);%供货次数
sum1=zeros(402,1);
sum2=zeros(402,1);
ratio=zeros(402,1);%缺货100次数/供货次数
ratio2=zeros(402,1);%缺货1000次数/供货次数
answer=zeros(402,1);
for i = 1:402
    count1=0;
    count2=0;
    count=0;%供货次数 
    for j = 1:240
         if supply(i,j)~=0
            count=count+1;
        end
        difference = supply(i, j) - order(i, j);
        %若供货量远小于订货量
        if difference < -100
            count1=count1+1;
        end
        if difference < -1000
            count2=count2+1;
        end
    end
    sum1(i)=count1;
    sum2(i)=count2;
    times(i)=count;
    ratio(i)=sum1(i)/times(i);
    ratio2(i)=sum2(i)/times(i);
    answer(i)=ratio(i)+ratio2(i);
    [sorts_sum1,index1]=sort(sum1,'descend')
    [sorts_sum2,index2]=sort(sum2,'descend')
    [sorts_ratio,index3]=sort(ratio,'descend')
    [sorts_ratio2,index4]=sort(ratio2,'descend')
    [sorts_answer,index5]=sort(answer,'descend')
end

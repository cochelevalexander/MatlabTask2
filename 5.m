  
function F1=F_score(net,H,targets)
%Compute accuracy for binary classification

n=length(targets);%# of samples
F1=0;%initialisation

ActualClass =  categorical({'normal' 'normal' 'pneumonia' 'normal' 'pneumonia' 'pneumonia' 'pneumonia' 'pneumonia' });
PredictedClass=categorical({'normal' 'pneumonia' 'pneumonia' 'pneumonia' 'normal' 'pneumonia' 'normal' 'normal'});

N=length(ActualClass);

%Accuracy
Accuracy=sum(ActualClass==PredictedClass)/N

TruePositive=sum(ActualClass==PredictedClass & ActualClass=='pneumonia')
FalsePositive=sum(ActualClass~=PredictedClass & PredictedClass=='pneumonia')
TrueNegative=sum(ActualClass==PredictedClass & PredictedClass=='pneumonia')
FalseNagative=sum(ActualClass~=PredictedClass &  ActualClass=='pneumonia')

%TP=(p;p), где сначала ожидаемое, потом реальное
%FP=(p;n)
%TN=(n;n)
%FN=(n;p)

precision=TruePositive/(TruePositive+FalsePositive)
recall=TruePositive/(TruePositive+FalseNagative)
f=(2*(precision*recall))/(precision+recall)
end
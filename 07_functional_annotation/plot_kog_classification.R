pdf('/DATA/Ricepan/08.function/KOG/SAMPLE.SingleCopyfilter.pep.fa.KOG.pdf', width=10, height=10)
d=read.table('/DATA/Ricepan/08.function/KOG/SAMPLE.SingleCopyfilter.pep.fa.KOG.matrix', sep='	')
#color = rainbow(24)
library(ggplot2)
library(grid)
#library(RColorBrewer)
NUM=length(d$V2)
color=rep("#09BFFE",NUM)
#qplot(V1, V2, data=d, geom='bar', position='stack', stat='identity', fill=V1)+
ggplot(data=d,aes(x=V1,y=V2,fill=V1))+geom_bar(position='stack', stat='identity')+#by cwt 2018.3.20

     #labs(title='KOG Function Classification\n(SAMPLE.SingleCopyfilter.pep.fa)\n', x='', y='Number of Genes')+
     labs(title='KOG Function Classification', x='', y='Number of Genes')+
     theme(panel.background = element_rect(fill='transparent'),
           panel.grid=element_line(color='grey'),
           panel.border=element_rect(fill='transparent',color='black'),
           legend.position="none", axis.text=element_text(color='black', size=12))+
#     theme(legend.title=element_blank(), legend.text=element_text(angle=270),
#                legend.key.width=unit(1, 'mm'), legend.key.height=unit(4, 'cm'),
#                legend.text.align=0.7, plot.title=element_text(face='bold'))+  
     geom_text(aes(label=V2), hjust=-0.5, vjust=0.5, size = 4)+
     scale_y_continuous(limits=c(0,18),trans='sqrt')+coord_flip()+
     scale_fill_manual(values=color)
dev.off()

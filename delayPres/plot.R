library(ggplot2)

df = read.csv('times.csv')
pdf('func_sim.pdf')
ggplot(data=df,aes(x=n,y=Time.in.ps))+
    geom_line()+
    geom_point()
dev.off()
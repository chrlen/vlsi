c(1862,2614,3366,3972,4786,5510,6322,7500,8210) -> times
data.frame(2:10,times) -> d
colnames(d) <- c('n','Time in ps')
write.table(d,'times.csv',row.names=F,sep=',')
 